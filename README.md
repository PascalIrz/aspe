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
- [aspe_demo](https://github.com/PascalIrz/aspe_demo) : Fichiers R Markdown pour prétraiter les données pour [un tableau de bord interactif](https://gitlab.ofb.fr/cedric.mondy1/aspedashboard)
- [aspeQual](https://github.com/PascalIrz/aspeQual) : package R destiné à la mise en qualité de la base Aspe

The package comes with a number of associated repos :
- [aspe_data](https://github.com/PascalIrz/aspe_data): building of the datasets included in the {aspe} package
- [aspe_test](https://github.com/PascalIrz/aspe_test): R Markdown files to test the {aspe} package and to build the tutorials
- [aspe_demo](https://github.com/PascalIrz/aspe_demo): R Markdown files to pre-process the fish data for [a dashboard app](https://gitlab.ofb.fr/cedric.mondy1/aspedashboard)
- [aspeQual](https://github.com/PascalIrz/aspeQual) : R package dedicated to the quality control on the Aspe database


Tutoriels (vignettes)
------------

- [Importer les tables de la base depuis un dump](https://rpubs.com/kamoke/713407)  
- [Traiter des données Indice Poisson Rivière (IPR)](https://rpubs.com/kamoke/713491)
- [Faire des traitements de base à partir des lots](https://rpubs.com/kamoke/715102)
- [Traiter des mesures individuelles](https://rpubs.com/kamoke/715858)
- [Faire des traitements géographiques](https://rpubs.com/kamoke/716322)
- [Construire des relations taille-poids](https://rpubs.com/kamoke/729779)


Nommage des fonctions / Functions' naming rules
---------------

Les familles de fonctions se distinguent par des préfixes :

- `mef_` : mise en forme des dataframes
- `expl_` : exploration de la base
- `geo_` : opérations spatiales
- `gg_` : production de graphiques avec `ggplot2`
- `imp_` : importation depuis un dump SQL
- `ipr_` : [indice poisson rivière](https://www.kmae-journal.org/articles/kmae/abs/2002/02/kmae2002365p405/kmae2002365p405.html))
- `misc_` : divers

Functions' names start by group-specific prefixes:

- `mef_` : tidying dataframes
- `expl_` : exploring the database
- `geo_` : spatial processing
- `gg_` : plots with `ggplot2`
- `imp_` : importing data from a SQL dump
- `ipr_` : [fish-based river health index](https://www.researchgate.net/publication/227818978_Development_and_validation_of_a_fish-based_index_FBI_for_the_assessment_of_river_health_in_France)))
- `misc_` : miscellaneous

Nommage des variables / Variables' naming rules
---------------

Dans la quasi-totalité des cas, les variables contenues dans une table sont préfixées en fonction de cette table. Par exemple :

- `sta_` : station
- `pop_` : point_prelevement
- `mei_` : mesure_individuelle

Pour une liste des noms et signification des variables, taper dans la console :

    data("dictionnaire")
    View(dictionnaire)


Almost systematically, variables' names start by table-specific prefixes:

- `sta_` : station
- `pop_` : point_prelevement (sampling point)
- `mei_` : mesure_individuelle (individual measurment)

To display a comprehensive list of variables with their meaning, call:

    data("dictionnaire")
    View(dictionnaire)
