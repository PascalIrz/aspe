% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/gg_histo_longueur.R
\name{gg_histo_longueur}
\alias{gg_histo_longueur}
\alias{mei_grapher_histo_longueur}
\title{Produire l'histogramme de distribution des longueurs individuelles pour une opération
de pêche}
\usage{
gg_histo_longueur(
  indiv_df,
  operation,
  especes,
  type_longueur = c("Totale", "Fourche", "Estim\\\\u00e9e d\\\\'apr\\\\u00e8s le poids"),
  n_intervalles = 30
)
}
\arguments{
\item{indiv_df}{Le dataframe contanant les données nécessaires.}

\item{operation}{Entier. Identifiant de l'opération de pêche au sens du champ ope_id.}

\item{especes}{Vecteur caractères. Identifiants des codes espèces en trois lettres.
Classiquement une seule espèce est désignée mais on peut préférer regrouper des
sous-espèces avec des identifiants différents ou conserver les identifications
au genre.}

\item{type_longueur}{Vecteur caractères. Intitulé(s) du ou des type(s) de longueur
à prendre en compte pour construire l'histogramme. Trois modalités sont proposées,
qui correspondent aux modélités du champ tlo_libelle de la table ref_type_longueur.}

\item{n_intervalles}{Nombre entier. Nombre d'intervalles de longueur sur l'axe des
abscisses. La valeur par défaut est 30.}
}
\value{
L'histogramme. C'est un objet de classe ggplot qui peut donc être repris par la
suite pour en modifier la mise en forme.
}
\description{
Produire l'histogramme de distribution des longueurs individuelles pour une opération
de pêche
}
\examples{
\dontrun{
gg_histo_longueur (indiv_df = data_ind_56,
operation = 6313,
especes = "GOU",
type_longueur = c("Fourche", "Estimée d'après le poids"),
n_intervalles = 25)
}
}
