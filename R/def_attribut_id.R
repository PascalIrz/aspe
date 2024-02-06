#' Définir les attributs des prélèvements
#'
#' @import magrittr
#' @import dplyr
#' @import utils
#' @importFrom rlang enquo quo_name quo_is_null
#'
#' @param df dataframe
#' @param var_id variable(s) identifiant les prélèvements
#' @param var_tmp variable identifiant la date de prélèvement
#' @param var_pro variable identifiant le protocole de pêche (optionnelle)
#'
#' @return tb data frame
#' @export
#'
#' @examples
#' \dontrun{
#' df <- mef_creer_passerelle() %>%
#' mef_ajouter_ope_date() %>%
#' mef_ajouter_type_protocole()
#' def_id <- def_attribut_id (var_id = pop_id,
#' var_tmp = annee,
#' var_pro = pro_libelle)
#' }
def_attribut_id <- function(df,var_id,var_tmp,var_pro=NULL) {
  var_id <- enquo(var_id)
  var_tmp <- enquo(var_tmp)
  var_pro <- enquo(var_pro)
  mmin <- min(pull(df, !!var_tmp))
  mmax <- max(pull(df, !!var_tmp))
  #-----------------------------------------------------------------------------
  # Series without sampling protocol
  if (quo_is_null(var_pro)) {
    tb <- select(df, !!var_id, !!var_tmp) %>% distinct() %>%
      summarise(across(quo_name(var_tmp), ~ min(.x), .names = "min_tmp"),
                across(quo_name(var_tmp), ~ max(.x), .names = "max_tmp"),
                across(quo_name(var_tmp), ~ length(unique(.x)), .names = "nb_obs"),
                across(quo_name(var_tmp), ~ max(0,diff(sort(.x), lag=1) - 1), .names = "nb_na_serie"),
                across(quo_name(var_tmp), ~ min(.x) - mmin, .names = "nb_na_start"),
                across(quo_name(var_tmp), ~ mmax - max(.x), .names = "nb_na_end"),
                .by = c(!!var_id)) %>%
      rowwise() %>% mutate(nb_na_cons = max(nb_na_serie,nb_na_start,nb_na_end)) %>%
      data.frame() %>% select(-nb_na_serie, -nb_na_start, -nb_na_end)
  } else {
    #-----------------------------------------------------------------------------
    # Series with sampling protocol
    def_obs_combin_pro <- function(i) {
      idi <- setNames(data.frame(id[i,]),colnames(id))
      df_i <- left_join(idi,df) %>% select(!!var_id, !!var_tmp, !!var_pro) %>% distinct()
      df_i <- df_i[order(df_i[,quo_name(var_tmp)]),]
      tbi <- data.frame()
      pro <- pull(df_i, !!var_pro) %>% unique()
      combin_pro <- do.call("c",mapply(function(x) combn(pro,x,simplify = FALSE), 1:length(pro)))
      x <- 1
      while(x <= length(combin_pro)) {
        protocol <- paste(combin_pro[[x]],collapse=",")
        names(protocol) <- quo_name(var_pro)
        df_pro <- df_i %>% filter(df_i[,quo_name(var_pro)] %in% combin_pro[[x]])
        pro_x <- df_pro %>% mutate(across(quo_name(var_pro), ~as.numeric(as.factor(.x)))) %>%
          pull(!!var_pro)
        tbx <- df_pro %>%
          summarise(across(quo_name(var_tmp), ~ min(.x), .names = "min_tmp"),
                    across(quo_name(var_tmp), ~ max(.x), .names = "max_tmp"),
                    across(quo_name(var_tmp), ~ length(unique(.x)), .names = "nb_obs"),
                    across(quo_name(var_tmp), ~ max(0,diff(sort(.x), lag=1) - 1), .names = "nb_na_serie"),
                    across(quo_name(var_tmp), ~ min(.x) - mmin, .names = "nb_na_start"),
                    across(quo_name(var_tmp), ~ mmax - max(.x), .names = "nb_na_end"),
                    .by = c(!!var_id)) %>%
          rowwise() %>% mutate(nb_na_cons = max(nb_na_serie,nb_na_start,nb_na_end)) %>%
          data.frame() %>% select(-nb_na_serie, -nb_na_start, -nb_na_end) %>%
          mutate(nb_pro = length(combin_pro[[x]]), nb_chg = sum(abs(diff(pro_x, lag = 1))), !!!protocol)
        tbi <- rbind(tbi,tbx)
        x <- x + 1
      }
    return(tbi)
    }
    id <- select(df, !!var_id) %>% distinct()
    tb <- do.call("rbind",lapply(1:nrow(id), function(i) def_obs_combin_pro(i)))
  }
  return(tb)
}