% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/mef_ajouter_lots.R
\name{mef_ajouter_lots}
\alias{mef_ajouter_lots}
\title{Ajouter les lots de poissons capturés à la passerelle.}
\usage{
mef_ajouter_lots(passerelle)
}
\arguments{
\item{passerelle}{Dataframe "passerelle" mettant en correspondance les identifiants des différentes tables.}
}
\value{
La passerelle complétée.
}
\description{
Ajouter les lots de poissons capturés à la passerelle.
}
\examples{
\dontrun{
passerelle <- passerelle \%>\%
mef_ajouter_lots()
}
}
