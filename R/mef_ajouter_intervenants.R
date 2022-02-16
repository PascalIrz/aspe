#' Ajouter à la passerelle les intervenants sur les opérations
#'     Ces intervenants sont l'opérateur, le commanditaire et le valideur.
#'
#' @param passerelle Dataframe "passerelle" mettant en correspondance les identifiants des
#'     différentes tables.
#'
#' @return La passerelle complétée.
#' @export
#'
#' @importFrom dplyr select left_join rename
#' @importFrom stringr str_extract
#'
#' @examples
#' \dontrun{
#' passerelle <- mef_creer_passerelle() %>%
#' mef_ajouter_intervenants()
#' }
#'
mef_ajouter_intervenants <- function(passerelle)

{
  # simplification des tables pour ne conserver que le nécessaire
  int_simp <- ref_intervenant %>%
    select(int_id,
           int_libelle_sandre)

  ope_simp <- operation %>%
    select(
      ope_id,
      ope_int_id_operateur_peche,
      ope_int_id_commanditaire,
      ope_int_id_validation_technique
    )

  # Jointure pour ajouter operateur, commanditaire etc. à la table ope_simp
  ope_simp <- ope_simp %>%
    left_join(
      y = int_simp %>%
        rename(
          ope_int_id_operateur_peche = int_id,
          operateur_peche = int_libelle_sandre
        )
    ) %>%
    left_join(
      y = int_simp %>%
        rename(
          ope_int_id_commanditaire = int_id,
          commanditaire = int_libelle_sandre
        )
    ) %>%
    left_join(
      y = int_simp %>%
        rename(
          ope_int_id_validation_technique = int_id,
          validation_technique = int_libelle_sandre
        )
    )

  # ajout de variables booleennes pour taguer si l'opération est OFB ou AFB (commanditaire etc.)
  passerelle <- passerelle %>%
    left_join(ope_simp) %>%
    mutate(
      operateur_ofb = str_extract(string = operateur_peche,
                                  pattern = "\\((.*)\\)"),
      operateur_ofb = ifelse(
        operateur_ofb %in% c("(OFB)", "(AFB)"),
        yes = TRUE,
        no = FALSE
      ),
      commanditaire_ofb = str_extract(string = commanditaire,
                                      pattern = "\\((.*)\\)"),
      commanditaire_ofb = ifelse(
        commanditaire_ofb %in% c("(OFB)", "(AFB)"),
        yes = TRUE,
        no = FALSE
      ),

      validation_ofb = str_extract(string = validation_technique,
                                   pattern = "\\((.*)\\)"),
      validation_ofb = ifelse(
        validation_ofb %in% c("(OFB)", "(AFB)"),
        yes = TRUE,
        no = FALSE
      )

    )

  passerelle

}
