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
#' @importFrom dplyr filter select starts_with pull rename
#' @importFrom tidyr pivot_longer pivot_wider
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
    select(CdAppelTaxon,
           starts_with("OrgCdAlternatif"),
           starts_with("CdAlternatif"))

  df1 <- df %>%
    select(CdAppelTaxon,
           starts_with("OrgCdAlternatif")) %>%
    pivot_longer(cols = OrgCdAlternatif1:OrgCdAlternatif11,
                 names_to = "variable_org",
                 values_to = "organisme")

  df2 <- df %>%
    select(CdAppelTaxon,
           starts_with("CdAlternatif")) %>%
    pivot_longer(cols = CdAlternatif1:CdAlternatif11,
                 names_to = "variable_code",
                 values_to = "code")

  df3 <- df1 %>%
    cbind(df2 %>% select(-CdAppelTaxon)) %>%
    filter(organisme %in% c("ASPE", "TAXREF"))

  mes_codes_sandre <- df3 %>%
    filter(organisme == "ASPE") %>%
    pull(CdAppelTaxon) %>%
    unique()

  df3 <- df3 %>%
    filter(CdAppelTaxon %in% mes_codes_sandre) %>%
    select(CdAppelTaxon, organisme, code) %>%
    pivot_wider(names_from = organisme,
                values_from = code) %>%
    rename(esp_code_sandre = CdAppelTaxon,
           esp_code_alternatif = ASPE,
           esp_code_taxref = TAXREF)

  df3

}

