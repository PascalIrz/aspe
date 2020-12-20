
<!-- README.md is generated from README.Rmd. Please edit that file -->

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

Installation
------------

If necessary, first install the {devtools} R package, then you can
install the released version of {aspe} from
[Github](https://github.com/PascalIrz/aspe) with:

    install_github("PascalIrz/aspe")
