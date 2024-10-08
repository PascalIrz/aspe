% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/mef_ipr_radar.R
\name{mef_ipr_radar}
\alias{mef_ipr_radar}
\title{Mettre un dataframe au format pour ls graphiques en radar.}
\usage{
mef_ipr_radar(metriques_df, pop_id)
}
\arguments{
\item{metriques_df}{Un dataframe contenant les métriques par station et par année,
produit par la fonction ipr_extraire_metriques().}

\item{pop_id}{Numérique entier. Identifiant du point de prélèvement (pop_id).}
}
\value{
Un dataframe mis en forme.
}
\description{
La fonction radarchart() du package \code{fmsb} nécessite en entrée un dataframe
au format spécifique.
}
\examples{
\dontrun{
mef_ipr_radar <- ipr_mef_radar(metriques_df = metriques_22, pop_id = 41964)
}
}
