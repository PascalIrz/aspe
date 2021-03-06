<!-- badges: start -->
[![R-CMD-check](https://github.com/PascalIrz/aspe/workflows/R-CMD-check/badge.svg)](https://github.com/PascalIrz/aspe/actions)
<!-- badges: end -->


aspe
====

{aspe} fournit des outils autorisant simplement la plupart des
traitements de base à partir d’une sauvegarde (dump SQL) de la base de
données ASPE de l’OFB. Ces traitements comprennent les calculs
d’abondances, densités, distribution en tailles et la détection de
tendances à l’échelle de la station. Ces calculs sont accompagnés de
fonctionnalités graphiques.

The goal of {aspe} is to is to provide a suite of tools for most of the
common processing of the ASPE database including importation from a SQL
format dump, calculation of abundances, densities, size distributions,
temporal trends for populations at the station level, along with
graphical output.

La base de données ASPE de l’OFB contient toutes les données
d’inventaire par pêche à l’électricité par le CSP, l’ONEMA, l’AFB, l’OFB
ainsi que par certains partenaires sur les rivières de France.

The ASPE database is administrated by the French Office for Biodiversity. It gathers, among others, all the river electrofishing samplings carried out by the former Fisheries Council, National Office for Water and Aquatic Systems and French Agency for Biodiversity.

Installation
------------

Si besoin, commencer par installer le package R {devtools} ainsi que la suite Rtools, puis installer {aspe} au moyen de la commande :

If necessary, first install the {devtools} R package and the Rtools suite, then you can
install the released version of {aspe} from
[Github](https://github.com/PascalIrz/aspe) with:

    devtools::install_github("PascalIrz/aspe")


Répertoires Github associés / Associated Github repositories
------------

Plusieurs dépôts Github sont associés au package :
- [aspe_data](https://github.com/PascalIrz/aspe_data) : construction des jeux de données inclus dans le package {aspe}
- [aspe_test](https://github.com/PascalIrz/aspe_test) : Fichiers R Markdown pour tester le package {aspe} et produire les tutos
- [aspe_demo](https://github.com/PascalIrz/aspe_demo) : Fichiers R Markdown pour prétraiter les données pour [un tableau de bord interactif](https://github.com/CedricMondy/AspeDashboard)

The package comes with a number of associated repos :
- [aspe_data](https://github.com/PascalIrz/aspe_data): building of the datasets included in the {aspe} package
- [aspe_test](https://github.com/PascalIrz/aspe_test): R Markdown files to test the {aspe} package and to build the tutorials
- [aspe_demo](https://github.com/PascalIrz/aspe_demo): R Markdown files to pre-process the fish data for [a dashboard app](https://github.com/CedricMondy/AspeDashboard)
