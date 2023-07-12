#' Ajouter les lots de poissons capturés à la passerelle
#'
#' @param df Dataframe "passerelle" mettant en correspondance les identifiants des différentes tables.
#'     df doit contenir une variable "pre_id" (identifiant du prélèvement élémentaire).
#'
#' @return La passerelle complétée.
#' @export
#'
#' @importFrom dplyr left_join select
#'
#' @examples
#' \dontrun{
#' passerelle <- passerelle %>%
#' mef_ajouter_lots()
#' }
mef_ajouter_lots <- function(df)

{

  df %>%
    left_join(y = lot_poissons %>%
                select(pre_id = lop_pre_id,
                       lop_id,
                       tyl_id = lop_tyl_id,
                       tlo_id = lop_tlo_id,
                       esp_id = lop_esp_id,
                       lop_effectif)) %>%
    left_join(y = ref_espece %>%
                select(esp_id,
                       esp_code_alternatif)) %>%
    select(-esp_id)

}
