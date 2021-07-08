#' Ajouter les mesures individuelles à la passerelle
#'
#' @param passerelle Dataframe "passerelle" mettant en correspondance les identifiants des différentes tables.
#'
#' @return La passerelle complétée.
#' @export
#'
#' @importFrom dplyr left_join rename
#'
#' @examples
#' \dontrun{
#' passerelle <- passerelle %>%
#' mef_ajouter_mei()
#' }
mef_ajouter_mei <- function(passerelle)

{
  passerelle %>%
    left_join(y = mesure_individuelle %>%
                rename(lop_id = mei_lop_id,
                       tlo_id = mei_tlo_id))
}
