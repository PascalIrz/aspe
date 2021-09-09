#' Ajouter l'opérateur de pêche à la passerelle
#'
#' @param passerelle Dataframe "passerelle" mettant en correspondance les identifiants des différentes tables.
#'
#' @return La passerelle complétée.
#' @export
#'
#' @importFrom dplyr left_join select
#'
#' @examples
#' \dontrun{
#' passerelle <- passerelle %>%
#' mef_ajouter_operateur()
#' }
mef_ajouter_operateur <- function(passerelle)

{
  passerelle %>%
    left_join(y = poste_intervenant %>%
                select(poste_wama,
                       utilisateur) %>%
                mutate(utilisateur = str_sub(utilisateur,
                                             start = 11),
                       utilisateur = ifelse(str_detect(utilisateur, pattern = "DIR"),
                                            yes = "OFB",
                                            no = utilisateur)))
}
