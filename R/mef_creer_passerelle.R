#' Création d'un tableau "passerelle"
#'
#' Cette fonction crée un tableau de correspondance pour simplifier la navigation parmi les tables de la base Aspe.
#' La base comprend plus d'une centaine de tables dont la plupart contiennent des référentiels associant des codes
#' à des modalités. Par exemple la table ref_protocole associe le code pro_id à la modalité
#' "Pêche partielle par points (grand milieu)". Ces tables sont dites "périphériques".
#' Chaque table comprend une clé primaire (suffixe "_id"), identifiant unique de chacune de ses lignes.
#' Les tables qui constituent la colonne vertébrale de la base sont station, point_prelevement,
#' operation, prelevement_elementaire, lot_poissons et mesure_individuelle.
#'
#' Ces tables sont liées de manières hiérarchique. Ainsi, chaque mesure individuelle se rapporte à un lot, qui
#' se rapporte à un prélèvement élémentaire, qui se rapporte à une opération ... jusqu'à la station.
#' Pour savoir sur quelle station a été capturé ce goujon de 87mm, il faut donc remonter toute la chaîne.
#' Pour simplifier cette procédure, et éviter d'avoir à la reproduire à chaque requête de sélection,
#' on peut construire un tableau de correspondance des clés primaires. On n'incluera toutefois pas la
#' table mesure_individuelle car elle comprend des millions de lignes, ce qui alourdirait considérablement
#' le tableau. Le traitement du contenu de cette table passe par la fonction mef_ajouter_mei().
#'
#' Pour que la fonction opère, il est nécessaire que les tables ci-dessus (sauf mesure_individuelle)
#' soient toutes dans l'environnement.
#'
#' @return Un dataframe contenant les correspondances entre les identifiants.
#' @export
#'
#' @examples
#' \dontrun{
#' ma_passerelle <- mef_creer_passerelle()
#' }
#'
mef_creer_passerelle <- function() {
  lot_poissons %>% select(lop_id,
                          pre_id = lop_pre_id) %>%
    left_join(y = prelevement_elementaire %>%
                select(pre_id,
                       ope_id = pre_ope_id)) %>%
    left_join(y = operation %>%
                select(ope_id,
                       pop_id = ope_pop_id,
                       pro_id = ope_pro_id,
                       poste_wama = ope_poste_wama)) %>%
    left_join(y = operation_objectif %>%
                select(ope_id = opo_ope_id,
                       obj_id = opo_obj_id)) %>%
    left_join(y = point_prelevement %>%
                select (sta_id = pop_sta_id,
                        pop_id,
                        sta_id = pop_sta_id)) %>%
    select(sta_id,
           pop_id,
           ope_id,
           obj_id,
           pro_id,
           poste_wama,
           pre_id,
           lop_id)
}
