#' Importer une table de correspondance entre les codes espèces 3 lettres Aspe et leurs codes Taxref
#'
#' La donnée ne provient pas de la base ASPE, mais de l'API SANDRE. Comme elle importe l'ensemble du
#'     référentiel taxonomique, l'opération prend plusieurs dizaines de secondes.
#'
#' @param url Caractère. URL du jeu de données à télécharger.
#'     Par défaut "https://api.sandre.eaufrance.fr/referentiels/v1/apt.csv?compress=true"
#'
#' @return Dataframe. Table de correspondence.
#' @export
#'
#' @importFrom readr read_csv2 locale
#' @importFrom dplyr filter select
#' @importFrom utils download.file
#'
#' @examples
#' \dontrun{
#' taxref <- imp_corres_aspe_taxref()
#' }
imp_corres_aspe_taxref <- function(url = "https://api.sandre.eaufrance.fr/referentiels/v1/apt.csv?compress=true")

{

  file <- paste0(tempdir(),
                 "\\ref_sandre.csv.gz")

  download.file(url = url,
                destfile = file ,
                mode = "wb")

  df <- read_csv2(file = file,
                  locale = locale(encoding = 'UTF-8')) %>%
    filter(OrgCdAlternatif2 == "ASPE",
           OrgCdAlternatif1 == "TAXREF") %>%
    select(esp_code_alternatif = CdAlternatif2,
           esp_code_taxref = CdAlternatif1)

  df

}

