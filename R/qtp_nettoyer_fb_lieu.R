#' Nettoyer les intitulés de lieux issus de Fishbase
#'
#' @param df Le dataframe contenant les paramètres taille-poids et une variable "lieu" à
#'     nettoyer. Typiquement importé avec la fonction rfishbase::length_weight() puis
#'     dont la variable "Locality" a été renommée en "lieu".
#'
#' @return Le dataframe avec la colonne "lieu" propre.
#' @export
#'
#' @importFrom dplyr mutate
#' @importFrom stringr str_replace_all str_squish str_replace
#'
#' @examples
#' \dontrun{
#' tp_fb_propre <- qtp_nettoyer_fb_lieu(df = tp_fb_brut)
#' }
qtp_nettoyer_fb_lieu <- function(df)

{

  df <- df %>%
    mutate(lieu = str_replace_all(lieu, " \\s*\\([^\\)]+\\)", ""),# suppr. texte entre parenthèses
           lieu = str_replace_all(lieu, "[:digit:]", ""), # suppr. les chiffres (coords, années)
           lieu = str_replace_all(lieu, "[\\-\\/]", ""), # suppr. certains caractères spéciaux
           lieu = str_squish(lieu), # supprimer les espaces qui trainent ou les fusionner
           lieu = str_replace(lieu, ",$", "")) # si le dernier caractère est une virgule, la suppr.

  df

}
