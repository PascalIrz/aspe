#' Importer les tables ASPE à partir de la BDD IDG (OFB).
#' Par défaut elles le sont toutes.
#'
#' @param conn connexion à la BDD
#' @param tab_excl Vecteur caractère indiquant les éventuelles tables à ne pas importer.
#' @param tab_select Vecteur caractère indiquant les tables à importer. Prime sur tab_excl.
#' @param ... autre
#'
#' @returns Les dataframes correspondant à chacune des tables de la base (sauf celles expurgées au préalable)
#' @export
#'
#' @importFrom cli cli_process_start cli_process_done cli_process_failed
#' @importFrom DBI dbListObjects Id dbReadTable
#' @importFrom dplyr pull
#' @importFrom purrr map_df
#'
#' @examples
#' \dontrun{
#' bdd_aspe <- imp_connecter_aspe_idg()
#'
#' imp_importer_aspe_idg(conn = bdd_aspe)
#'
#' imp_deconnecter_aspe_idg(conn = bdd_aspe)
#' }

imp_importer_aspe_idg <- function(conn, tab_excl = NA, tab_select = NA, ...){

  table_names <-
    conn %>%
    DBI::dbListObjects(DBI::Id(schema = 'aspe')) %>%
    dplyr::pull(table) %>%
    purrr::map_df(~slot(.x, 'name')) %>%
    dplyr::pull(table) %>%
    sort()

  table_names <-
    table_names[!grepl('batch_', table_names)]

  # if (is.character(tab_select)) {
  #   table_names <-
  #     table_names[table_names %in% tab_select]
  # } else {
  #   if (is.character(tab_excl)) {
  #     table_names <-
  #       table_names[!table_names %in% tab_excl]
  #   }
  # }

  for (table_name in table_names) {
    id <- cli::cli_process_start("table {.val {table_name}}")
    tryCatch({
      assign(
        x = table_name,
        value = DBI::dbReadTable(conn, DBI::Id(schema = "aspe", table = table_name)),
        envir = .GlobalEnv
      )
      cli::cli_process_done(id = id, msg_done = "table {.val {table_name}}... OK!")  # coche verte
    }, error = function(e) {
      cli::cli_process_failed(id = id, msg = "\u00c9chec pour {.field {table_name}}: {conditionMessage(e)}")
    })
  }

  rm(list = setdiff(ls(envir = .GlobalEnv), table_names), envir = .GlobalEnv)

}


