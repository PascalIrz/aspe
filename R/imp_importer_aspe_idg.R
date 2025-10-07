#' Importer les tables ASPE à partir de la BDD IDG (OFB)
#'
#' @param conn connexion à la BDD
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
#' bdd_aspe <- start_connexion_aspe_idg()
#'
#' imp_importer_aspe_idg(conn = bdd_aspe)
#'
#' stop_connexion_aspe_idg(conn = bdd_aspe)
#' }

imp_importer_aspe_idg <- function(conn, ...){

  table_names <-
    conn %>%
    DBI::dbListObjects(DBI::Id(schema = 'aspe')) %>%
    dplyr::pull(table) %>%
    purrr::map_df(~slot(.x, 'name')) %>%
    dplyr::pull(table) %>%
    sort()

  table_names <-
    table_names[!grepl('batch_', table_names)]

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


