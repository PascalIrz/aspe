#' Filtrer un dataframe passerelle sur le niveau de validation des opérations.
#'
#' @param df Dataframe passerelle qui doit contenir le champ "ope_id".
#' @param validation Vecteur entier indiquant les modalités à sélectionner, selon le codage
#'     du champ eta_id de la table ref_etat_avancement.
#'     1 = "En cours de saisie"
#'     2 = "Validé niveau 1"
#'     3 = "Validé niveau 2" (Valeur par défaut).
#'
#' @return Dataframe filtré, c'est-à-dire expurgé de certaines opérations.
#' @export
#'
#' @importFrom dplyr left_join select filter
#'
#' @examples
#' \dontrun{
#' # Opérations qui ne sont plus en cours de saisie
#' data_22_filtre <- mef_filtrer_validation(df = data_22, validation = 2:3)
#' }
mef_filtrer_validation <- function(df, validation = 3)

{

  df %>%
    left_join(y = operation %>%
                select(ope_id, eta_id = ope_eta_id)) %>%
    filter(eta_id %in% validation)

}
