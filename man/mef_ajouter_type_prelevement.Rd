% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/mef_ajouter_type_prelevement.R
\name{mef_ajouter_type_prelevement}
\alias{mef_ajouter_type_prelevement}
\title{Ajouter à la passerelle le type de prélèvement élémentaire}
\usage{
mef_ajouter_type_prelevement(df)
}
\arguments{
\item{df}{Dataframe "passerelle" mettant en correspondance les identifiants des différentes tables.}
}
\value{
La passerelle complétée.
}
\description{
Par type de prélèvement, on entend les modalités du tpe_libelle de la
table ref_type_prelevement_elementaire
}
\examples{
\dontrun{
passerelle <- passerelle \%>\%
mef_ajouter_type_prelevement()
}
}
