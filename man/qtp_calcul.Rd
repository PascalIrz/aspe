% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/qtp_calcul.R
\name{qtp_calcul}
\alias{qtp_calcul}
\title{Calculer les relations taille-poids sur un ensemble d'espèces}
\usage{
qtp_calcul(df, especes, seuil_densite = 0.001, seuil_poids_absolu = 5)
}
\arguments{
\item{df}{Dataframe contenant les données.}

\item{especes}{Vecteur texte contenant les codes espèces et trois lettres.}

\item{seuil_densite}{Numérique. Seuil de densité de probabilité probabilité au sens
de ggplot2::gemp_density(). Par défaut il est de 1p1000.}

\item{seuil_poids_absolu}{Numérique. Poids minimum pour qu'un individu ne soit pas exclus,
en grammes.}
}
\value{
Un dataframe contenant pour chaque espèce les coefficients et un résumé de la régression.
}
\description{
Calculer les relations taille-poids sur un ensemble d'espèces
}
\examples{
\dontrun{
qtp_calcul (df = tp_data,
especes = c("GAR", "SAN", "BRE"),
seuil_poids_absolu = 10)
}
}
