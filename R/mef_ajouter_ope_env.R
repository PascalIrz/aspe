#' Rajouter les variables environnementales pour chaque opération à la passerelle (quand disponible).
#'
#' Ces variables sont en premier lieu renseignées depuis la table "operation_ipr", faute de quoi elles
#'     sont complétées depuis la table "point_prelevement".
#'
#' @param passerelle Dataframe "passerelle" mettant en correspondance les identifiants des différentes tables.
#'
#' @return La passerelle à laquelle ont été ajoutés les variables environnementales.
#' @export
#'
#' @importFrom dplyr left_join select starts_with mutate
#'
#' @examples
#' \dontrun{
#' passerelle <- mef_ajouter_ope_env(passerelle = passerelle)
#' }
mef_ajouter_ope_env <- function(passerelle)

{

  ope_env <- passerelle %>%
    select(pop_id,
           ope_id) %>%
    left_join(    # jointure table operation_ipr
      y = operation_ipr %>%
        select(ope_id = opi_ope_id,
               starts_with('opi_param_')
         )
      ) %>%
    left_join(     # jointure table point_prelevement
      y = point_prelevement %>%
        select(
          pop_id,
          distance_mer = pop_distance_mer,
          pop_largeur_lit_mineur:pop_temperature_moyenne_juillet
        )
    ) %>%
    mutate(
      altitude = ifelse(is.na(opi_param_alt),
                        pop_altitude,
                        opi_param_alt),
      surface_bv = ifelse(is.na(opi_param_sbv),
                          pop_surface_bassin_versant_amont,
                          opi_param_sbv),
      distance_source = ifelse(is.na(opi_param_ds),
                               pop_distance_source,
                               opi_param_ds),
      largeur = ifelse(is.na(opi_param_lar),
                       pop_largeur_lit_mineur,
                       opi_param_lar),
      pente = ifelse(is.na(opi_param_pent),
                     pop_pente_ign_cours_eau,
                     opi_param_pent),
      profondeur = opi_param_prof,
      temp_juillet = ifelse(is.na(opi_param_tjuillet) | opi_param_tjuillet == -99,
                            pop_temperature_moyenne_juillet,
                            opi_param_tjuillet),
      temp_janvier = ifelse(is.na(opi_param_tjanvier) | opi_param_tjanvier == -99,
                            pop_temperature_moyenne_janvier,
                            opi_param_tjanvier)
    ) %>%
    select(     # choix des variables à conserver
      -pop_id,
      -starts_with('opi_param'),
      -(pop_largeur_lit_mineur:pop_temperature_moyenne_juillet)
    ) %>%
    distinct()


  passerelle <- passerelle %>%
    left_join(ope_env) %>%
    mutate(temp_juillet = ifelse(temp_juillet == -99, # codage valeurs manquantes
                                 NA,
                                 temp_juillet),
           temp_janvier = ifelse(temp_janvier == -99,
                                 NA,
                                 temp_janvier))
 #   filter(!(temp_juillet == -99 & temp_janvier == -99))

  passerelle

}

