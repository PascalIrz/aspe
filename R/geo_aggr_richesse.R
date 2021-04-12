#' Aggréger les richesses par entité hydrographique
#'
#' Calculer à partir des données Aspe le nombre d'espèces différentes recensées par
#'     Zone HYdro, Sous-secteur Hydro, Secteur Hydro ou Région hydro.
#'
#' Comme la fonction effectue une jointure entre les inventaires et les entités hydrographiques,
#'     il faut que les deux objets géographiques aient au moins un nom de champ en commun.
#'
#' @param ope_geo_data Objet de classe sf contenant les captures par opération.
#' @param echelle Caractère. Au choix entre "ZoneHydro", "SousSecteurHydro", "SecteurHydro"
#'     et "RegionHydro".
#' @param bassin_geo_poly Objet de classe sf contenant les polygones délimitant les
#'     entités hydrographiques.
#'
#' @return Un dataframe avec les richesses par entité hydrographique.
#' @export
#'
#' @importFrom dplyr group_by syms summarise n_distinct ungroup filter right_join
#' @importFrom sf st_drop_geometry st_as_sf
#'
#' @examples
#' \dontrun{
#' richesse_par_unite_spatiale <- geo_aggr_richesse(ope_geo_data = data_geo,
#' echelle = "Secteur_Hydro",
#' bassin_geo_poly = bv_simp)
#' }
geo_aggr_richesse <- function(ope_geo_data,
                              echelle = c("Zone_Hydro", "Sous_Secteur_Hydro",
                                      "Secteur_Hydro", "Region_Hydro"),
                              bassin_geo_poly)

{

  if(echelle == "Zone_Hydro")
  {
    code <- "CdZoneHydr"
    libelle <- "LbZoneHydr"
  }

  if(echelle == "Sous_Secteur_Hydro")
  {
    code <- "CdSousSect"
    libelle <- "LbSousSect"
  }

  if(echelle == "Secteur_Hydro")
  {
    code <- "CdSecteurH"
    libelle <- "LbSecteurH"
  }

  if(echelle == "Region_Hydro")
  {
    code <- "CdRegionHy"
    libelle <- "LbRegionHy"
  }

  richesse_par_unite_spatiale <- ope_geo_data %>%
    group_by(!!!syms(code), !!!syms(libelle)) %>%
    summarise(richesse = n_distinct(esp_code_alternatif),
              nb_ope = n_distinct(ope_id)) %>%
    ungroup() %>%
    sf::st_drop_geometry() %>%
    right_join(y = bassin_geo_poly) %>%
    sf::st_as_sf() %>%
    filter(!is.na(richesse))

  richesse_par_unite_spatiale

}
