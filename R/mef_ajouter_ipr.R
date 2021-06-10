#' Ajouter les notes IPR à une table passerelle
#'
#' @param passerelle Dataframe mettant en correspondance les identifiants des différentes tables.
#'
#' @return Dataframe avec la valeur de l'IPR, et la classe de qualité.
#' @export
#'
#' @importFrom lubridate ymd_hms dmy
#'
#' @examples
#' \dontrun{
#' mon_df_ipr <- mef_ajouter_ipr(passerelle = passerelle)
#' }
#'
mef_ajouter_ipr <- function(passerelle)

{

  prov <- passerelle %>%
    left_join(y = operation_ipr %>%
                select(ope_id = opi_ope_id, ipr = opi_ipr, cli_id = opi_cli_id)) %>% # récupération IPR
    distinct() %>%#  suppression des doublons
    left_join(y = classe_ipr %>% select(cli_id, cli_libelle))

  prov

}
