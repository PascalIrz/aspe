#' Rajouter le libellé du site
#'
#' @description
#' `r lifecycle::badge("deprecated")`
#'
#' Fonction remplacée par "mef_ajouter_libelle_site()".
#'
#' @param passerelle Dataframe "passerelle" mettant en correspondance les identifiants des différentes tables.
#'
#' @return La passerelle à laquelle ont été ajoutés les libellés des points de prélèvement.
#' @export
#'
#' @importFrom dplyr left_join select mutate_at mutate vars
#'
#' @examples
#' \dontrun{
#' passerelle <- mef_ajouter_libelle(passerelle = passerelle)
#' }
mef_ajouter_libelle <- function(passerelle)

{
  passerelle %>%
    left_join(y = point_prelevement %>%
                select(pop_id, pop_libelle = pop_libelle_wama)) %>%
    left_join(y = station %>%
                select(sta_id, sta_libelle_sandre)) %>%
    mutate_at(vars(pop_libelle, sta_libelle_sandre),
              as.character) %>%
    mutate(pop_libelle = ifelse(is.na(pop_libelle),
                                sta_libelle_sandre,
                                pop_libelle)) %>%
    mutate(pop_libelle = ifelse(is.na(pop_libelle),
                                pop_id,
                                pop_libelle)) %>%
    select(-sta_libelle_sandre)

}
