#' Ajouter les codes couleurs aux classes IPR
#'
#' @param df_classes_ipr Dataframe contenant les intitulés des classes, typiquement
#'     le dataframe classe_ipr de la base Aspe.
#'
#' @return Le dataframe complété. La colonne ajoutée est "cli_couleur".
#' @export
#'
#' @importFrom dplyr case_when mutate
#' @importFrom forcats fct_reorder
#' @examples
#' \dontrun{
#' gg_ipr_station(df_ipr = ipr_dept,
#'   var_id_sta = pop_libelle,
#'   station_sel = c("TRIEUX à PLESIDY", "LEGUER à PLOUBEZRE"),
#'   sup_500m = FALSE)
#' }
ipr_completer_classes_couleur <- function(df_classes_ipr)

{
  df_classes_ipr <- df_classes_ipr %>%
    mutate(
      cli_couleur = case_when(
        cli_classe == 1 ~ "#1f78b4",
        cli_classe == 2 ~ "#b2df8a",
        cli_classe == 3 ~ "#ffff33",
        cli_classe == 4 ~ "#ff7f00",
        cli_classe == 5 ~ "#e41a1c"
      ),
      cli_libelle = as.factor(cli_libelle),
      cli_libelle = fct_reorder(cli_libelle, cli_classe)
    )

  df_classes_ipr

}
