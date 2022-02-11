#' Ajouter les codes couleurs aux classes IPR
#'
#' @param df_classes_ip Dataframe contenant les intitulés des classes, typiquement
#'     le dataframe classe_ipr de la base Aspe.
#' @param var_numero_classe Variable contenant les numéros de classes de 1 (meilleur état)
#'     à 5 (le pire).
#' @param var_libelle_classe Variable contenant les libellés de classes.
#' @return Le dataframe complété. La colonne ajoutée est "classe_couleur".
#' @export
#'
#' @importFrom dplyr case_when mutate rename
#' @importFrom forcats fct_reorder
#' @importFrom rlang :=
#'
#' @examples
#' \dontrun{
#' classe_ipr_plus <- classe_ipr_plus %>%
#'   ip_completer_classes_couleur(var_numero_classe = cip_classe,
#'                                var_libelle_classe = cip_libelle)
#' }
ip_completer_classes_couleur <- function(df_classes_ip,
                                         var_numero_classe = cli_classe,
                                         var_libelle_classe = cli_libelle)

{
  var_numero_classe <- enquo(var_numero_classe)
  var_libelle_classe <- enquo(var_libelle_classe)

  df_classes_ip <- df_classes_ip %>%
    mutate(
      classe_couleur = case_when(
        !!var_numero_classe == 1 ~ "#1f78b4",
        !!var_numero_classe == 2 ~ "#b2df8a",
        !!var_numero_classe == 3 ~ "#ffff33",
        !!var_numero_classe == 4 ~ "#ff7f00",
        !!var_numero_classe == 5 ~ "#e41a1c"
      ),
      !!var_libelle_classe := as.factor(!!var_libelle_classe),
      !!var_libelle_classe := fct_reorder(!!var_libelle_classe,
                                         !!var_numero_classe)
    )

  df_classes_ip

}
