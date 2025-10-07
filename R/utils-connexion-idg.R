#' Démarre une connexion à ASPE sur la BDD IDG (OFB)
#'
#' @description
#' Fonction pour se connecter à la BDD ASPE en utilisant les paramètres de connexion
#' stockés dans l'environnement R (fichier `.Renviron`).
#'
#' @returns Connexion. Renvoie une erreur si connexion impossible.
#' @export
#'
#' @importFrom cli col_red col_yellow col_blue col_green
#' @importFrom DBI dbConnect dbIsValid
#' @importFrom RPostgres Postgres
#'
#' @examples
#' \dontrun{
#' bdd_aspe <- start_connexion_idg()
#'
#' start_connexion_idg(conn = bdd_aspe)
#' }
#'

start_connexion_idg <- function() {
  required_vars <- c(
    'BDD_IDG_HOST',
    'BDD_IDG_PORT',
    'BDD_IDG_LOGIN',
    'BDD_IDG_PWD',
    'BDD_IDG_ASPE_NAME'
  )
  missing_vars <- required_vars[!nzchar(Sys.getenv(required_vars))]

  if (length(missing_vars) > 0) {
    msg <- paste0(
      cli::col_red("ERREUR - Variables d\'environnement manquantes: "),
      cli::col_yellow(paste(missing_vars, collapse = ", ")),
      "\nV\u00e9rifiez la pr\u00e9sence de ces variables dans votre fichier .Renviron"
    )
    stop(msg)
  }

  message(
    cli::col_blue("Connexion \u00e0 la base "),
    cli::col_green(Sys.getenv('BDD_IDG_ASPE_NAME')),
    cli::col_blue(" en cours...")
  )

  tryCatch({
    conn <- DBI::dbConnect(
      drv = RPostgres::Postgres(),
      host = Sys.getenv('BDD_IDG_HOST'),
      port = Sys.getenv('BDD_IDG_PORT'),
      dbname = Sys.getenv('BDD_IDG_ASPE_NAME'),
      user = Sys.getenv('BDD_IDG_LOGIN'),
      password = Sys.getenv('BDD_IDG_PWD')
    )

    #
    is_valid <- DBI::dbIsValid(conn)
    if (is_valid) {
      message(cli::col_green("\u2714 Connexion \u00e9tablie avec succ\u00e8s !"))
    }
  }, error = function(e) {
    error_msg <-
      paste0(
        cli::col_red("\u2716 ERREUR: Connexion impossible!\n\n"),
        e$message,
        "\n\nV\u00e9rifiez les infos suivantes:\n",
        " - Les param\u00e8tres de connexion sont corrects;\n",
        " - Le VPN est activ\u00e9 si n\u00e9cessaire;\n",
        " - Le serveur de base de donn\u00e9es est accessible;\n"
      )
    message(error_msg)
  })
  return(conn)
}



#' Stoppe une connexion à ASPE sur la BDD IDG (OFB)
#'
#' @description
#' Fonction stoppe la connexion à la BDD
#'
#' @param conn nom de la connexion (objet) à stopper.
#' @return Aucune valeur.
#'
#' @importFrom DBI dbDisconnect
#'
#' @export
#'
#' @examples
#' \dontrun{
#' bdd_aspe <- start_sql_connexion()
#'
#' stop_connexion_idg(conn = bdd_aspe)
#' }

#' @importFrom DBI dbDisconnect
stop_connexion_idg <- function(conn) {
  DBI::dbDisconnect(conn)
}
