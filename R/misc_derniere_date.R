#' Obtenir la date maxi saisie dans la base Aspe
#'
#' Cette fonction extrait l'ensemble des champs contenant la chaîne de caractère "date"
#'     dans l'ensemble des dataframes, en prend le max et omettant les dates ultérieures
#'     à la date système.
#'
#' @return La date maximale trouvée
#' @export
#'
#' @importFrom purrr map2 reduce
#' @importFrom dplyr pull mutate filter
#' @importFrom lubridate ymd
#' @importFrom stringr str_sub
#'
#' @examples
#' \dontrun{
#' date_max <- misc_derniere_date()
#' }
misc_derniere_date <- function()

{

  prov <-
    expl_trouver_variable("date") # identifie les variables contenant la chaîne "date" et les tables

  map2(
    .x = prov$table, # pour chaque variable, collecte du max
    .y = prov$variable,
    .f = function(table, variable) {
      table %>% get() %>% pull(variable) %>% max(na.rm = TRUE)
    }
  ) %>%
    reduce(rbind) %>%
    as.data.frame() %>%
    mutate(date_max = str_sub(V1, 1, 10), # pour homogénéiser entre ymd et ymd_hms
           date_max = lubridate::ymd(date_max)) %>% # passage en format date
    filter(date_max < Sys.Date()) %>% # suppression des dates ultérieures à aujourd'hui
    pull(date_max) %>%
    max(na.rm = TRUE) # max des max

}
