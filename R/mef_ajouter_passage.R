#' Ajouter le numéro de passage associé à chaque prélèvement élémentairte de la passerelle.
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
#' mef_ajouter_passage()
#' }
mef_ajouter_passage <- function(passerelle)

{
  passerelle %>%
    left_join(y = passage %>%
                select(pre_id = pas_id,
                       pas_numero))

}
