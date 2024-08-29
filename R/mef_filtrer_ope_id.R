#' Filtrer les opérations de pêche
#'
#' @importFrom magrittr %>%
#' @import dplyr
#' @importFrom rlang enquo quo_is_null quo_name
#'
#' @param df data frame
#' @param var_id variable(s) identifiant les prélèvements
#' @param var_tmp variable identifiant la date de prélèvement
#' @param var_surf variable identifiant la surface de pêche (optionnelle)
#' @param var_pro variable identifiant le protocole de pêche (optionnelle)
#' @param var_pds variable identifiant la présence d'information sur les poids (optionnelle)
#' @param var_mei variable identifiant la présence d'information sur les mesures individuelles (optionnelle)
#' @param var_pas variable identifiant le numéro du passage de pêche (optionnelle)
#' @param var_date variable identifiant une date additionnelle de pêche (optionnelle)
#' @param default logique
#'
#' @return df
#' @export
#'
#' @examples
#' \dontrun{
#' df <- mef_creer_passerelle() %>%
#' mef_ajouter_ope_date() %>%
#' mef_ajouter_surf_calc() %>%
#' mef_ajouter_type_protocole() %>%
#' mef_filtrer_ope_id(var_id = pop_id,
#' var_tmp = annee,
#' var_surf = ope_surface_calculee,
#' var_pro = pro_libelle,
#' default=TRUE)
#' df <- mef_creer_passerelle() %>%
#' mef_ajouter_ope_date() %>%
#' mef_ajouter_surf_calc() %>%
#' mef_ajouter_type_protocole() %>%
#' mef_ajouter_poids() %>%
#' mef_filtrer_ope_id(var_id = pop_id,
#' var_tmp = annee,
#' var_surf = ope_surface_calculee,
#' var_pds = lop_poids)
#' df <- df %>%
#' mef_filtrer_ope_id(var_id = pop_id,
#' var_tmp = annee,
#' var_pro = pro_libelle,
#' default=TRUE)
#' }
mef_filtrer_ope_id <- function(df,var_id,var_tmp,var_surf=NULL,var_pro=NULL,var_pds=NULL,var_mei=NULL,var_pas=NULL,var_date=NULL,default=FALSE) {
  #---------------------------------------------------------------------------
  var_id <- enquo(var_id)
  var_tmp <- enquo(var_tmp)
  var_surf <- enquo(var_surf)
  var_pro <- enquo(var_pro)
  var_pds <- enquo(var_pds)
  var_mei <- enquo(var_mei)
  var_pas <- enquo(var_pas)
  var_date <- enquo(var_date)
  #---------------------------------------------------------------------------
  filter_function <- function(tb) {
    id <- select(df, !!var_id, !!var_tmp, ope_id) %>% distinct() %>% right_join(tb) %>% pull(ope_id)
    df_id <- left_join(select(tb, !!var_id),df) %>% distinct()
    #---------------------------------------------------------------------------
    # Filter by surface information availability
    if (!quo_is_null(var_surf)) {
      f_id <- df %>% filter(ope_id %in% id, !is.na(df[,quo_name(var_surf)])) %>% pull(ope_id) %>% unique()
      if (length(f_id) > 0) { id <- f_id }
    }
    #---------------------------------------------------------------------------
    # Filter by protocol to get series with the least protocol changes
    if (!quo_is_null(var_pro) & length(id) > 1) {
      tmp <- sort(unique(pull(df_id, !!var_tmp)))
      pro <- do.call("rbind",lapply(id, function(i) {
        df_pro <- filter(df_id, !ope_id %in% id[!id %in% i]) %>% select(!!var_id, !!var_tmp, !!var_pro, ope_id) %>% distinct()
        chg <- sum(unlist(lapply(2:length(tmp), function(t) ifelse(df_pro[df_pro[,quo_name(var_tmp)] %in% tmp[t],quo_name(var_pro)] %in% df_pro[df_pro[,quo_name(var_tmp)] %in% tmp[t-1],quo_name(var_pro)], 0, 1))))
        data.frame("id"=i,"chg"=chg)
      }))
      id <- pro$id[pro$chg %in% min(pro$chg)]
    }
    #---------------------------------------------------------------------------
    # Filter by biomass information availability
    if (!quo_is_null(var_pds) & length(id) > 1) {
      f_id <- df %>% filter(ope_id %in% id, !is.na(df[,quo_name(var_pds)])) %>% pull(ope_id) %>% unique()
      if (length(f_id) > 0) { id <- f_id }
    }
    #---------------------------------------------------------------------------
    # Filter by individual metric information availability
    if (!quo_is_null(var_mei) & length(id) > 1) {
      f_id <- df %>% filter(ope_id %in% id, !is.na(df[,quo_name(var_mei)])) %>% pull(ope_id) %>% unique()
      if (length(f_id) > 0) { id <- f_id }
    }
    #---------------------------------------------------------------------------
    # Filter by sampling pass
    if (!quo_is_null(var_pas) & length(id) > 1) {
      f_id <- df %>% filter(ope_id %in% id, df[,quo_name(var_pas)] > 1) %>% pull(ope_id) %>% unique()
      if (length(f_id) > 0) { id <- f_id }
    }
    #---------------------------------------------------------------------------
    # Filter by additional time
    if (!quo_is_null(var_date) & length(id) > 1) {
      date <- select(tb, !!var_id) %>% left_join(df) %>% summarise(nb = length(unique(ope_id)), .by = c(!!var_date)) %>%
        filter(nb %in% max(nb)) %>% pull(!!var_date)
      f_id <- filter(df, ope_id %in% id, df[,quo_name(var_date)] %in% date) %>% pull(ope_id) %>% unique()
      if (length(f_id) > 0) { id <- f_id }
    }
    #---------------------------------------------------------------------------
    # By default, keep the first operation
    if (isTRUE(default)) {
      id <- id[1]
    }
    return(id)
  }
  #-----------------------------------------------------------------------------
  nb_ope <- df %>% summarise(nb = length(unique(ope_id)), .by = c(!!var_id, !!var_tmp))
  ope_filter <- nb_ope[nb_ope$nb > 1,]
  ope_select <- select(df, !!var_id, !!var_tmp, ope_id) %>% right_join(nb_ope[nb_ope$nb == 1,]) %>% pull(ope_id) %>% unique() %>%
    c(unlist(lapply(1:nrow(ope_filter), function(i) filter_function(ope_filter[i,]))))
  df <- df %>% filter(ope_id %in% ope_select)
  return(df)
}
