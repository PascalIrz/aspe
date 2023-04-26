#' Sélectionner et nommer les colonnes au format requis en entrée de la macro
#'     Excel de calcul de l'indice
#'
#' @param data Le dataframe contenant les données, issu de la fonction formater_pour_macro().
#' @param fichier_macro Caractère. Chemin vers le fichier Excel de la macro.
#'
#' @return Le dataframe
#' @export
#'
#' @importFrom readxl read_xlsx
#'
#' @examples
#' \dontrun{
#' data_macro <- ipr_renommer_pour_macro(data = data_macro,
#' fichier_macro = "raw_data/CalculIPRv1.3.xls")
#' }
ipr_renommer_pour_macro <- function(data, fichier_macro) {

  noms_colonnes <- readxl::read_xlsx(fichier_macro, skip = 1)

  noms_especes <- noms_colonnes %>%
    select(ABLab:VANab) %>%
    names() %>%
    str_sub(start = 1, end = 3)

  # il manque les espèces suivantes
  noms_especes_manquantes <- base::setdiff(noms_especes, names(data))

  # il faut les rajouter
  data <- data %>%
    `is.na<-`(noms_especes_manquantes)

  #
  ref_operation <- data %>%
    select(ope_id:ope_date) %>%
    mutate(ope_date = format(ope_date, format = "%d/%m/%Y"))

  names(ref_operation) <- noms_colonnes %>%
    select(1:4) %>%
    names()

  var_env <- data %>%
    select(opi_param_surf:opi_param_bassin)

  names(var_env) <- noms_colonnes %>%
    select(6:15) %>%
    names()

  captures <- data %>%
    select(all_of(noms_especes))

  names(captures) <- paste0(names(captures), 'ab')

  bind_cols(ref_operation, v1 = NA, var_env, v2 = NA, captures)

}
