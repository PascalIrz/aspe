% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/mef_ajouter_ope_desc_peche.R
\name{mef_ajouter_ope_desc_peche}
\alias{mef_ajouter_ope_desc_peche}
\title{Rajouter à la passerelle les variables de description de la pêche pour chaque opération (quand disponible).}
\usage{
mef_ajouter_ope_desc_peche(df)
}
\arguments{
\item{df}{Dataframe "passerelle" mettant en correspondance les identifiants des différentes tables.}
}
\value{
La passerelle à laquelle ont été ajoutés les variables environnementales
}
\description{
Ces variables sont issues de la table "operation_description_peche".
}
\examples{
\dontrun{
passerelle <- mef_ajouter_ope_desc_peche(df = passerelle)
}
}
