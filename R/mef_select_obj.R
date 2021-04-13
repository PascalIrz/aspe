#' Filtrer la passerelle sur le ou les objectif(s) poursuivis par l'opération. On appelle objectif
#'     par exemple l'appartenance à un réseau.
#'
#' @param passerelle Dataframe "passerelle" mettant en correspondance les identifiants des différentes tables.
#' @param objectif Vecteur numérique indiquant le ou les objectif(s) à conserver.
#'     A choisir parmi :
#'     1 = "Sauvetage - Transfert",
#'     2 = "DCE – Référence",
#'     3 = "RCS – Réseau de Contrôle de Surveillance",
#'     4 = "RRP – Réseau de Référence Pérenne",
#'     5 = "CO – Contrôle opérationnel",
#'     6 = "RHP – Réseau Hydrobiologique Piscicole",
#'     etc.
#'     La correspondance entre les codes et les libellés peut être retrouvée dans
#'     la table ref_objectif.
#'
#' @return La passerelle filtrée sur le ou les objectif(s).
#' @export
#'
#' @importFrom dplyr left_join select filter rename
#'
#' @examples
#' \dontrun{
#' passerelle <- passerelle %>%
#' mef_select_obj(objectif = 2:6)
#' }
mef_select_obj <- function(passerelle, objectif)

{

  passerelle <- passerelle %>%
    left_join(y = operation_objectif %>%
                rename(ope_id  = opo_ope_id)) %>%
    filter(opo_obj_id %in% objectif) %>%
    select(-opo_obj_id) %>%
    unique()

}
