## ---- include = FALSE---------------------------------------------------------
knitr::opts_chunk$set(
  collapse = TRUE,
  comment = "#>"
)

## ----setup, message = FALSE, warning = FALSE----------------------------------
library(aspe)
library(tidyverse)

## ---- eval = FALSE------------------------------------------------------------
#  importer_dump_sql(fichier_dump = "raw_data/aspe.sql")

## ---- eval = FALSE------------------------------------------------------------
#  scinder_dump(fichier_dump = "raw_data/aspe.sql")

## ---- eval = FALSE------------------------------------------------------------
#  importer_tables_a_partir_des_lignes(lignes_dump = "raw_data/lignes_autres_tables.RData")

