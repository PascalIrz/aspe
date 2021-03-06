% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/mef_ajouter_abs.R
\name{mef_ajouter_abs}
\alias{mef_ajouter_abs}
\title{Ajouter à un dataframe de présences les lignes des absences (avec effectif et densité nuls)}
\usage{
mef_ajouter_abs(df)
}
\arguments{
\item{df}{Dataframe avec les variables ope_id, esp_code_alternatif, effectif, dens_ind_1000m2 et annee.}
}
\value{
Le dataframe avec des lignes supplémentaires pour chacune des espèces absentes à chacune
    des opérations.
}
\description{
La fonction fait appel au dataframe "operation" de la base Aspe qui doit impérativement avoir
    été chargé auparavant.
}
\examples{
\dontrun{
df_complet <- mef_ajouter_abs(df = df_presences)
}
}
