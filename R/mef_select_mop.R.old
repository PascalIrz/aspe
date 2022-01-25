#' Filtrer la passerelle sur le moyen de prospection.
#'
#' @param passerelle Dataframe "passerelle" mettant en correspondance les identifiants des différentes tables.
#' @param moyen_prospection Vecteur numérique indiquant le ou les moyens de prospection
#'     à conserver. A choisir parmi 1 = "A pied", 2 = "En bateau", 3 = "Mixte" et 4 = "Non renseigné".
#'     La correspondance entre les codes et les libellés peut être retrouvée dans
#'     la table ref_moyen_prospection.
#'
#' @return La passerelle filtrée sur le ou les moyens de prospection.
#' @export
#'
#' @importFrom dplyr left_join select filter
#'
#' @examples
#' \dontrun{
#' passerelle <- passerelle %>%
#' mef_select_mop(moyen_prospection = c(1, 2, 3))
#' }
mef_select_mop <- function(passerelle, moyen_prospection)

{

  passerelle %>%
    left_join(y = operation_description_peche %>%
                select(ope_id = odp_ope_id, mop_id = odp_mop_id)) %>%
    filter(mop_id %in% moyen_prospection) %>%
    select(-mop_id)

}
