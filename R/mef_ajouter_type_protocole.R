#' Ajouter le type de protocole à la passerelle
#'
#' ex : Indice Abondance Saumon.
#'     Nécessite d'avoir chargé les tables "operation" et "ref_protocole".
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
#' mef_ajouter_type_protocole()
#' }
mef_ajouter_type_protocole <- function(df)

{
  df %>%
    left_join(y = operation %>%
                select(ope_id,
                       pro_id = ope_pro_id)) %>%
    left_join(y = ref_protocole %>%
                select(pro_id,
                       pro_libelle)) %>%
    select(-pro_id)
}
