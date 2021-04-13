#' Filtrer la passerelle sur le protocole employé.
#'
#' @param passerelle Dataframe "passerelle" mettant en correspondance les identifiants des différentes tables.
#' @param protocole Vecteur numérique indiquant le ou les protocole(s) à conserver.
#'     A choisir parmi :
#'     1 = "Pêche complète à un ou plusieurs passages",
#'     2 = "Pêche partielle par points (grand milieu)",
#'     3 = "Pêche par ambiances",
#'     4 = "Pêche partielle sur berge",
#'     5 = "Indice Abondance Saumon",
#'     6 = "Vigitruite",
#'     7 = "Indice Abondance Anguille"
#'     La correspondance entre les codes et les libellés peut être retrouvée dans
#'     la table ref_protocole.
#'
#' @return La passerelle filtrée sur le ou les protocole(s).
#' @export
#'
#' @importFrom dplyr left_join select filter
#'
#' @examples
#' \dontrun{
#' passerelle <- passerelle %>%
#' mef_select_proto(protocole = c(1, 3))
#' }
mef_select_proto <- function(passerelle, protocole)

{

  passerelle %>%
    left_join(y = operation %>%
                select(ope_id, pro_id = ope_pro_id, ope_date)) %>%
    filter(pro_id %in% protocole) %>%
    select(-pro_id)

}
