#' Ajouter à la passerelle les utilisateurs sur les opérations
#'
#' Ces utilisateurs sont le créateur et la personne qui a effectué la dernière modification.
#'     Ils sont identifiés par leur adresse email.
#'
#' @param df Dataframe "passerelle" mettant en correspondance les identifiants des
#'     différentes tables.
#'
#' @return La passerelle complétée.
#' @export
#'
#' @importFrom dplyr select left_join rename
#'
#' @examples
#' \dontrun{
#' passerelle <- mef_creer_passerelle() %>%
#' mef_ajouter_utilisateurs()
#' }
#'
mef_ajouter_utilisateurs <- function(df)

{
  # simplification des tables pour ne conserver que le nécessaire

  uti_simp <- utilisateur %>%
    select(uti_id,
           int_id = uti_int_id,
           uti_mail)

  ope_simp <- operation %>%
    select(ope_id,
           ope_uti_id_creation,
           ope_uti_id_derniere_modification)

  # Jointure pour ajouter à la table ope_simp le créateur et modificateur
  ope_simp <- ope_simp %>%
    left_join(y = uti_simp %>%
                rename(ope_uti_id_creation = uti_id,
                       createur = uti_mail)) %>%
    left_join(y = uti_simp %>%
                rename(ope_uti_id_derniere_modification = uti_id,
                       modificateur = uti_mail))

  df <- df %>%
    left_join(ope_simp)

  df

}
