#' Mettre les données nécessaires au calcul de l'IPR au format requis en entrée de la macro
#'     Excel de calcul de l'indice.
#'
#' @param passerelle Dataframe mettant en correspondance les identifiants des différentes tables.
#' @param date_debut Date de début de la période à extraire au format jj/mm/aaaa.
#' @param date_fin Date de fin de la période à extraire au format jj/mm/aaaa. Par défaut c'est la
#'     date du jour où la fonction est exécutée.
#'
#' @return Un dataframe au format souhaité, mais dont les colonnes doivent ensuite être renommées
#'     avec la fonction renommer_pour_macro().
#' @export
#'
#' @importFrom lubridate ymd_hms dmy
#' @importFrom tidyr pivot_wider
#' @importFrom stringr str_sub str_extract
#'
#' @examples
#' \dontrun{
#' data_macro <- formater_pour_macro(passerelle = passerelle, date_debut = '01/01/2020')
#' }
formater_pour_macro <- function(passerelle, date_debut, date_fin = format(Sys.Date(), "%d/%m/%Y"))

{

  data <- passerelle %>%
    select(sta_id, pop_id, ope_id, pre_id) %>%
    distinct() %>%
    left_join(y = operation_ipr %>% select(ope_id = opi_ope_id, opi_ipr, starts_with("opi_param"))) %>%
    filter(!is.na(opi_ipr)) %>%
    left_join(y = operation %>% select(ope_id, ope_date)) %>%
    left_join(y = point_prelevement %>% select(pop_id, pop_enh_id, pop_libelle_wama)) %>%
    left_join(y = station %>% select(sta_id, sta_libelle_sandre)) %>%
    mutate(ope_date = ymd_hms(ope_date)) %>%
    filter(ope_date <= dmy(date_fin) & ope_date >= dmy(date_debut)) %>%
    left_join(y = lot_poissons %>% select(pre_id = lop_pre_id, esp_id = lop_esp_id, lop_effectif)) %>%
    left_join(y = ref_espece %>% select(esp_id, esp_code_alternatif)) %>%
    left_join(ref_unite_hydrographique %>% select(unh_code_sandre, unh_libelle_sandre),
              by = c("opi_param_bassin" = "unh_code_sandre")) %>%
    mutate(coursdo = NA,
           unh_libelle_sandre = str_extract(unh_libelle_sandre, pattern = '\\b\\w+$'),
           unh_libelle_sandre = str_sub(unh_libelle_sandre, 1, 4)) %>%
    select(ope_id, coursdo, sta_libelle_sandre, ope_date, opi_param_surf, opi_param_sbv, opi_param_ds,
           opi_param_lar, opi_param_pent, opi_param_prof, opi_param_alt, opi_param_tjuillet, opi_param_tjanvier,
           opi_param_bassin, esp_code_alternatif, lop_effectif)

  data %>%
    group_by_at(setdiff(names(.), "lop_effectif")) %>%
    summarise(effectif = sum(lop_effectif, na.rm = TRUE)) %>%
    ungroup() %>%
    pivot_wider(names_from = esp_code_alternatif, values_from = effectif)

}
