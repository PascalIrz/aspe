% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/imp_importer_dump_sql.R
\name{imp_importer_dump_sql}
\alias{imp_importer_dump_sql}
\title{Importer le dump SQL de la base Aspe}
\usage{
imp_importer_dump_sql(fichier_dump)
}
\arguments{
\item{fichier_dump}{Le chemin vers le fichier d'extension .sql (décompressé) ou
.sql.gz (archive).}
}
\value{
Les dataframes correspondant à chacune des tables de la base.
}
\description{
Importer le dump SQL de la base Aspe
}
\examples{

\dontrun{
imp_importer_dump_sql(fichier_dump = "../raw_data/dump.sql")
}


}
