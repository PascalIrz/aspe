% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/mef_ajouter_libelle.R
\name{mef_ajouter_libelle}
\alias{mef_ajouter_libelle}
\title{Rajouter le libellé du site}
\usage{
mef_ajouter_libelle(passerelle)
}
\arguments{
\item{passerelle}{Dataframe "passerelle" mettant en correspondance les identifiants des différentes tables.}
}
\value{
La passerelle à laquelle ont été ajoutés les libellés des points de prélèvement.
}
\description{
\ifelse{html}{\href{https://lifecycle.r-lib.org/articles/stages.html#deprecated}{\figure{lifecycle-deprecated.svg}{options: alt='[Deprecated]'}}}{\strong{[Deprecated]}}.
Fonction remplacée par "mef_ajouter_libelle_site()".
}
\examples{
\dontrun{
passerelle <- mef_ajouter_libelle(passerelle = passerelle)
}
}
