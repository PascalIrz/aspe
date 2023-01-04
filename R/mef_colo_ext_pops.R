#' Formater le tableau des captures sur un ensemble de points
#'
#' L'objectif est de visualiser la dynamique du peuplement. Permet d'identifier les taxons
#'     qui apparaissent ou disparaissent ainsi que les abondances.
#'
#' @param df Dataframe contenant les captures et contenant les champs pop_id, pop_libelle,
#'     annee, esp_code_alternatif, effectif.
#' @param id_point Caractère. Identifiant du ou des point(s) au sens du champ pop_id de la base Aspe.
#'     Par défaut, tous les identifiants présents dans le tableau df sont pris en compte.
#'
#' @return Un dataframe pour un ensemble de points de prélèvement qui est mis en forme
#'     pour produire des graphiques avec la fonction gg_colo_ext_pop().
#' @export
#'
#' @importFrom dplyr filter pull left_join mutate arrange select group_by case_when lag summarise
#' @importFrom tidyr expand
#' @importFrom purrr map_df
#'
#' @examples
#' \dontrun{
#' colo_ext_mon_point <- captures %>%
#'     mef_colo_ext_pops()
#' }
mef_colo_ext_pops <- function(df, id_point = NULL)

{
  mef_colo_ext_pop_1pt <- function(df, id_point)

  {
    selection <- df

    if(!is.null(id_point)) selection <- selection %>% filter(pop_id == id_point)

    selection <- selection %>%
      group_by(annee,
               esp_code_alternatif,
               pop_id,
               pop_libelle,
               pro_libelle) %>%
      summarise(effectif = sum(lop_effectif, na.rm = TRUE)) %>%
      ungroup() %>%
      droplevels()

    libelle <- selection %>%
      pull(pop_libelle) %>%
      .[1]

    selection <- selection %>%
      expand(annee,
             esp_code_alternatif,
             pop_id,
             pop_libelle) %>%
      left_join(selection,
                by = c("annee", "esp_code_alternatif", "pop_id", "pop_libelle")) %>%
      mutate(effectif = ifelse(is.na(effectif),
                               yes = 0,
                               no = effectif)) %>%
      arrange(esp_code_alternatif,
              annee) %>%
      select(pop_id,
             pop_libelle,
             pro_libelle,
             annee,
             esp_code_alternatif,
             effectif) %>%
      group_by(esp_code_alternatif) %>%
      mutate(
        col_ext = case_when(
          effectif > 0 & lag(effectif, 1) == 0 ~ "colonisation",
          effectif == 0 & lag(effectif, 1) > 0 ~ "extinction",
          TRUE ~ "statu quo"
        ),
        diam_point = case_when(
          col_ext == "extinction" ~ 10,
          effectif == 0 ~ NA_real_,
          TRUE ~ effectif ^ 0.5
        ),
        type_point = col_ext == "extinction"
      ) %>%
      ungroup()

    selection

  }

  mes_pops <- df %>%
    pull(pop_id) %>%
    unique()

  if (!is.null(id_point))
    mes_pops <- id_point

  capt_mef_colo_ext <- map_df(.x = mes_pops,
                              .f = mef_colo_ext_pop_1pt,
                              df = df)

  capt_mef_colo_ext

}
