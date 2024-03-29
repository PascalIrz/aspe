% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/export_tables_rdata.R
\name{export_tables_rdata}
\alias{export_tables_rdata}
\title{Exporter les dataframes au format .RData}
\usage{
export_tables_rdata(repertoire = NA)
}
\arguments{
\item{repertoire}{Caractères. Chemin vers le répertoire où les fichiers seront écrits.}
}
\value{
Les fichiers sont sauvegardés dans le répertoire choisi. Si aucun chemin n'est indiqué,
ça sera dans un sous-répertoire "processed_data" du répertoire de travail qui est créé au besoin.
Les fichiers sont au nombre de deux, l'un pour les mesures individuelles et l'autre pour les
autres tables. Ils sont respectivement nommés mei_aaaa_mm_jj_hh_mm_ss (d'après les dates et heures
de la sauvegarde), et tables_sauf_mei_aaaa_mm_jj_hh_mm_ss.
}
\description{
Exporter les dataframes au format .RData
}
\examples{
\dontrun{
export_tables_rdata()
}
}
