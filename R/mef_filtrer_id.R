#' Filtrer les prélèvements
#'
#' @import magrittr
#' @import dplyr
#' @importFrom rlang enquo quo_is_null quo_name

#'
#' @param df data frame
#' @param tb data frame
#' @param var_id variable(s) identifiant les prélèvements
#' @param var_sta variable identifiant les points de prélèvements (optionnelle)
#' @param var_pro variable identifiant le protocole de pêche (optionnelle)
#' @param min_obs numerique définissant le nombre minimal d'observations par prélèvement
#' @param max_na_cons numerique définissant le nombre maximal de valeurs manquantes consécutives par prélèvement
#' @param max_pro numerique définissant le nombre maximal de protocoles de pêche par prélèvement
#' @param max_chg numerique définissant le nombre maximal de changement de protocole de pêche par prélèvement
#'
#' @return df
#' @export
#'
#' @examples
#' \dontrun{
#' df <- mef_creer_passerelle() %>%
#' mef_ajouter_ope_date() %>%
#' mef_ajouter_ope_saison() %>%
#' mef_ajouter_type_protocole()
#' tb <- def_attribut_id (df,
#' var_id = c(pop_id,saison),
#' var_tmp = annee,
#' var_pro = pro_libelle)
#' df_id <- mef_filtrer_id(df,
#' tb,
#' var_id = c(pop_id, saison),
#' var_sta = pop_id,
#' var_pro = pro_libelle,
#' min_obs = 10,
#' max_na_cons = 3,
#' max_pro = 1)
#' df_id <- mef_filtrer_id(df,
#' tb,
#' var_id = pop_id,
#' min_obs = 10,
#' max_na_cons = 3)
#' }
mef_filtrer_id <- function(df,tb,var_id,var_sta=NULL,var_pro=NULL,min_obs,max_na_cons=NULL,max_pro=NULL,max_chg=NULL) {
  var_id <- enquo(var_id)
  var_pro <- enquo(var_pro)
  var_sta <- enquo(var_sta)
  if (quo_is_null(var_sta)) { var_sta <- var_id }
  #-----------------------------------------------------------------------------
  tb <- filter(tb, nb_obs >= min_obs)
  if (!is.null(max_na_cons)) {
    tb <- filter(tb, nb_na_cons <= max_na_cons)
  }
  if (!is.null(max_pro)) {
    tb <- filter(tb, nb_pro <= max_pro)
  }
  if (!is.null(max_chg)) {
    tb <- filter(tb, nb_chg <= max_chg)
  }
  #-----------------------------------------------------------------------------
  tb <- mutate(tb, row_id=row_number())
  rowid <- tb %>% reframe(rowid = row_id[which(nb_obs == max(nb_obs))][1], .by = c(!!var_sta)) %>% pull(rowid)
  tb <- filter(tb, row_id %in% rowid)
  if (quo_is_null(var_pro)) {
    df <- inner_join(df, select(tb, !!var_id))
  } else {
    df <- do.call("rbind", lapply(1:nrow(tb), function(i) {
      pro <- unlist(strsplit(pull(tb[i,], !!var_pro),","))
      df_i <- filter(df, df[,quo_name(var_pro)] %in% pro) %>%
        inner_join(select(tb[i,],!!var_id))
      return(df_i) }
    ))
  }
  return(df)
}
