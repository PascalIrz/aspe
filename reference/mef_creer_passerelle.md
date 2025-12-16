# Création d'un tableau "passerelle"

Cette fonction crée un tableau de correspondance pour simplifier la
navigation parmi les tables de la base Aspe. La base comprend plus d'une
centaine de tables dont la plupart contiennent des référentiels
associant des codes à des modalités. Par exemple la table ref_protocole
associe le code pro_id à la modalité "Pêche partielle par points (grand
milieu)". Ces tables sont dites "périphériques". Chaque table comprend
une clé primaire (suffixe "\_id"), identifiant unique de chacune de ses
lignes. Les tables qui constituent la colonne vertébrale de la base sont
station, point_prelevement, operation, prelevement_elementaire,
lot_poissons et mesure_individuelle.

## Usage

``` r
mef_creer_passerelle()
```

## Value

Un dataframe contenant les correspondances entre les identifiants.

## Details

Ces tables sont liées de manières hiérarchique. Ainsi, chaque mesure
individuelle se rapporte à un lot, qui se rapporte à un prélèvement
élémentaire, qui se rapporte à une opération ... jusqu'à la station.
Pour savoir sur quelle station a été capturé ce goujon de 87mm, il faut
donc remonter toute la chaîne. Pour simplifier cette procédure, et
éviter d'avoir à la reproduire à chaque requête de sélection, on peut
construire un tableau de correspondance des clés primaires. On
n'incluera toutefois pas la table mesure_individuelle car elle comprend
des millions de lignes, ce qui alourdirait considérablement le tableau.
Le traitement du contenu de cette table passe par la fonction
mef_ajouter_mei().

Pour que la fonction opère, il est nécessaire que les tables ci-dessus
(sauf mesure_individuelle) soient toutes dans l'environnement.

## Examples

``` r
if (FALSE) { # \dontrun{
ma_passerelle <- mef_creer_passerelle()
} # }
```
