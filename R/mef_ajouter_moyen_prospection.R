#' Ajouter à la passerelle le moyen de prospection
#'
#' Ex : A pied / En bateau. Les modalités sont précisées dans la table ref_moyen_prospection.
#'
#' @param df Dataframe "passerelle" mettant en correspondance les identifiants des différentes tables.
#'     df doit contenir une variable "ope_id" (identifiant de l'opération de pêche).
#'
#' @return La passerelle complétée.
#' @export
#'
#' @importFrom dplyr left_join select
#'
#' @examples
#' \dontrun{
#' passerelle <- passerelle %>%
#' mef_ajouter_moyen_prospection()
#' }
mef_ajouter_moyen_prospection <- function(df)

{
  df %>%
    left_join(y = operation_description_peche %>%
                select(ope_id = odp_ope_id,
                       mop_id = odp_mop_id)) %>%
    left_join(y = ref_moyen_prospection %>%
                select(mop_id,
                       mop_libelle)) %>%
    select(c(names(df), "mop_libelle"))

}
