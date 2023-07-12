#' Ajouter à la passerelle l'a qualification de a donnée'état d'avancement de la saisie
#'
#' ex : En cours de saisie / Validé niveau 1.
#'
#' @param df Dataframe "passerelle" mettant en correspondance les identifiants des différentes tables.
#'
#' @return La passerelle complétée.
#' @export
#'
#' @importFrom dplyr left_join select
#'
#' @examples
#' \dontrun{
#' passerelle <- passerelle %>%
#' mef_ajouter_validation()
#' }
mef_ajouter_validation <- function(df)

{
  df %>%
    left_join(y = operation %>%
                select(ope_id,
                       eta_id = ope_eta_id)) %>%
    left_join(y = ref_etat_avancement %>%
                select(eta_id,
                       eta_libelle)) %>%
    select(-eta_id)
}
