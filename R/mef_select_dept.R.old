#' Filtrer la passerelle sur un ou des département(s).
#'
#' @param passerelle Dataframe "passerelle" mettant en correspondance les identifiants des différentes tables.
#' @param dept Vecteur numérique indiquant le ou les département(s) à conserver.
#'
#' @return La passerelle filtrée sur le ou les département(s).
#' @export
#'
#' @importFrom dplyr left_join select filter
#'
#' @examples
#' \dontrun{
#' passerelle <- passerelle %>%
#' mef_select_dept(dept = c(22, 29, 35, 56))
#' }
mef_select_dept <- function(passerelle, dept)

{
  passerelle %>%
    left_join(y = station %>%
                select(sta_id, sta_com_code_insee)) %>%
    filter(str_sub(sta_com_code_insee, start = 1, end = 2) %in% dept) %>%
    select(-sta_com_code_insee)

}
