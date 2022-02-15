#' Gérer les limites de classes d'indices sur classe_ipr
#'
#' @param df_classes Dataframe d'entrée, en général classe_ipr
#' @param metriques Booléen. Si TRUE, on considère qu'il s'agit des métriques et non de
#'     l'indice agrégé. Les seuils sont donc divisés par 7 (le nombre des métriques dans l'IPR).
#' @param sup_500m Booléen. TRUE si les stations sont au-dessus de 500m d'altitude, ce qui change
#'     un seuil de classe IPR.
#'
#' @return Le dataframe filtré selon l'altitude
#'
#' @examples
#' \dontrun{
#' classe_classes_ipr <- classe_ipr %>%
#'   gg_gerer_seuils_classes_ipr_int()
#' }
gg_gerer_seuils_classes_ipr_int <- function(df_classes,
                                            metriques = FALSE,
                                            sup_500m)

{

  # ne pas déplacer sinon le bloc suivant ne fonctionne pas
  df_classes <- df_classes %>%
    replace(is.na(.), 0)

  # suppression des lignes selon le seuil d'altitude
  if(sup_500m) {
    df_classes <- df_classes %>%
      filter(cli_altitude_max != 500)
  } else {
    df_classes <- df_classes %>%
      filter(cli_altitude_min != 500)
  }

  # si métriques, on divise les seuils par 7
  if(metriques)
  {
    df_classes <- df_classes %>%
      mutate(classe_borne_inf = cli_borne_inf / 7,
             classe_borne_sup = cli_borne_sup / 7,
             # pour éviter une bande grise après l'arrière-plan rouge
             classe_borne_sup = ifelse(cli_classe == 5,
                                       yes = Inf,
                                       no = classe_borne_sup),
             classe_libelle = cli_libelle)
  } else{
    df_classes <- df_classes %>%
      mutate(classe_borne_inf = cli_borne_inf,
             classe_borne_sup = cli_borne_sup,
             # pour éviter une bande grise après l'arrière-plan rouge
             classe_borne_sup = ifelse(cli_classe == 5,
                                       yes = Inf,
                                       no = classe_borne_sup),
             classe_libelle = cli_libelle)

  }

  df_classes

}
