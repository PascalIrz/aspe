#' Ajouter à la passerelle les numéros de départements.
#'
#' Si le code commune de la station est renseigné dans la table station, ses deux premiers caractères
#'     indiquent le département. S'il est manquant mais renseigné dans la table point_prelevement,
#'     c'est cette information qui est utilisée. Malgré tout l'information est manquantes dans
#'     certains cas
#'
#' @param df Dataframe "passerelle" mettant en correspondance les identifiants des différentes tables.
#'     La passerelle doit comprendre des colonnes "sta_id" et "pop_id".
#'
#' @return La passerelle complétée par le département.
#' @export
#'
#' @importFrom dplyr left_join select filter
#' @importFrom stringr str_sub
#'
#' @examples
#' \dontrun{
#' passerelle <- passerelle %>%
#' mef_ajouter_dept()
#' }
mef_ajouter_dept <- function(df)

{

  df %>%
    left_join(y = station %>%
                select(sta_id,
                       com_code_insee = sta_com_code_insee)) %>%
    mutate(dept_sta = as.character(com_code_insee),
           dept_sta = str_sub(dept_sta, 1, 2)) %>%
    left_join(point_prelevement %>%
                select(pop_id,
                       pop_com_code_insee  = pop_com_code_insee_wama)) %>%
    mutate(dept_pop = as.character(pop_com_code_insee),
           dept_pop = str_sub(dept_pop, 1, 2),
           dept = ifelse(is.na(dept_sta),
                         yes = dept_pop,
                         no = dept_sta)) %>%
    select(c(names(df), "dept"))

}
