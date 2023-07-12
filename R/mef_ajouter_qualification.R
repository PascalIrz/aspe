#' Ajouter à la passerelle la qualification de la donnée
#'
#' ex : Correcte / Incorrecte / Incertaine.
#'
#' @param df Dataframe "passerelle" mettant en correspondance les identifiants des différentes tables.
#'     df doit contenir une variable "ope_id" (identifiant de l'opération de pêche).
#'
#' @return La passerelle complétée.
#' @export
#'
#' @importFrom dplyr left_join select
#'
#' @examples
#' \dontrun{
#' passerelle <- passerelle %>%
#' mef_ajouter_qualification()
#' }
mef_ajouter_qualification <- function(df)

{
  df %>%
    left_join(y = operation %>%
                select(ope_id,
                       niq_id = ope_niq_id)) %>%
    left_join(y = ref_niveau_qualification %>%
                select(niq_id,
                       niq_libelle)) %>%
    select(-niq_id)
}
