# Signification des champs de la base Aspe

Signification des champs de la base Aspe

## Usage

``` r
data(data_dictionnaire)
```

## Format

An object of class `data.frame` with 742 rows and 3 columns.

## Examples

``` r
# \donttest{
data(data_dictionnaire)
data_dictionnaire# }
#>                               nom_table
#> 1                              ambiance
#> 2                              ambiance
#> 3                              ambiance
#> 4                              ambiance
#> 5                              ambiance
#> 6                              ambiance
#> 7                              ambiance
#> 8                              ambiance
#> 9                              ambiance
#> 10                             ambiance
#> 11                             ambiance
#> 12                             ambiance
#> 13                             ambiance
#> 14                             ambiance
#> 15                             ambiance
#> 16                             ambiance
#> 17                             ambiance
#> 18                             ambiance
#> 19                             ambiance
#> 20                             ambiance
#> 21                       autres_especes
#> 22                       autres_especes
#> 23                           classe_ipr
#> 24                           classe_ipr
#> 25                           classe_ipr
#> 26                           classe_ipr
#> 27                           classe_ipr
#> 28                           classe_ipr
#> 29                           classe_ipr
#> 30                           classe_ipr
#> 31                           classe_ipr
#> 32                      classe_ipr_plus
#> 33                      classe_ipr_plus
#> 34                      classe_ipr_plus
#> 35                      classe_ipr_plus
#> 36                      classe_ipr_plus
#> 37                      classe_ipr_plus
#> 38                      classe_ipr_plus
#> 39                      classe_ipr_plus
#> 40                      classe_ipr_plus
#> 41                              commune
#> 42                              commune
#> 43                              commune
#> 44                              commune
#> 45                          departement
#> 46                          departement
#> 47                          departement
#> 48                  dispositif_collecte
#> 49                  dispositif_collecte
#> 50                  dispositif_collecte
#> 51                  dispositif_collecte
#> 52                  dispositif_collecte
#> 53                  dispositif_collecte
#> 54                  dispositif_collecte
#> 55                     dispositif_point
#> 56                     dispositif_point
#> 57                     dispositif_point
#> 58                     dispositif_point
#> 59                     dispositif_point
#> 60                   dispositif_station
#> 61                   dispositif_station
#> 62                   dispositif_station
#> 63                   dispositif_station
#> 64                   dispositif_station
#> 65                        documentation
#> 66                        documentation
#> 67                        documentation
#> 68                          dossier_doc
#> 69                          dossier_doc
#> 70                          dossier_doc
#> 71                            operation
#> 72                            operation
#> 73                            operation
#> 74                            operation
#> 75                            operation
#> 76                            operation
#> 77                            operation
#> 78                            operation
#> 79                            operation
#> 80                            operation
#> 81                            operation
#> 82                            operation
#> 83                            operation
#> 84                            operation
#> 85                            operation
#> 86                            operation
#> 87                            operation
#> 88                            operation
#> 89                            operation
#> 90                            operation
#> 91                            operation
#> 92                            operation
#> 93                            operation
#> 94                            operation
#> 95                            operation
#> 96                            operation
#> 97                            operation
#> 98                            operation
#> 99                            operation
#> 100                           operation
#> 101                           operation
#> 102                           operation
#> 103                           operation
#> 104                           operation
#> 105                           operation
#> 106                           operation
#> 107                           operation
#> 108                           operation
#> 109                           operation
#> 110                           operation
#> 111                           operation
#> 112                           operation
#> 113                           operation
#> 114                           operation
#> 115                           operation
#> 116                           operation
#> 117         operation_description_peche
#> 118         operation_description_peche
#> 119         operation_description_peche
#> 120         operation_description_peche
#> 121         operation_description_peche
#> 122         operation_description_peche
#> 123         operation_description_peche
#> 124         operation_description_peche
#> 125         operation_description_peche
#> 126         operation_description_peche
#> 127         operation_description_peche
#> 128         operation_description_peche
#> 129         operation_description_peche
#> 130         operation_description_peche
#> 131         operation_description_peche
#> 132         operation_description_peche
#> 133         operation_description_peche
#> 134         operation_description_peche
#> 135         operation_description_peche
#> 136         operation_description_peche
#> 137         operation_description_peche
#> 138         operation_description_peche
#> 139         operation_description_peche
#> 140         operation_description_peche
#> 141         operation_description_peche
#> 142         operation_description_peche
#> 143         operation_description_peche
#> 144         operation_description_peche
#> 145         operation_description_peche
#> 146 operation_donnees_environnementales
#> 147 operation_donnees_environnementales
#> 148 operation_donnees_environnementales
#> 149 operation_donnees_environnementales
#> 150 operation_donnees_environnementales
#> 151 operation_donnees_environnementales
#> 152 operation_donnees_environnementales
#> 153 operation_donnees_environnementales
#> 154 operation_donnees_environnementales
#> 155 operation_donnees_environnementales
#> 156 operation_donnees_environnementales
#> 157 operation_donnees_environnementales
#> 158 operation_donnees_environnementales
#> 159 operation_donnees_environnementales
#> 160 operation_donnees_environnementales
#> 161 operation_donnees_environnementales
#> 162 operation_donnees_environnementales
#> 163 operation_donnees_environnementales
#> 164 operation_donnees_environnementales
#> 165 operation_donnees_environnementales
#> 166 operation_donnees_environnementales
#> 167 operation_donnees_environnementales
#> 168 operation_donnees_environnementales
#> 169 operation_donnees_environnementales
#> 170 operation_donnees_environnementales
#> 171 operation_donnees_environnementales
#> 172                   point_prelevement
#> 173                   point_prelevement
#> 174                   point_prelevement
#> 175                   point_prelevement
#> 176                   point_prelevement
#> 177                   point_prelevement
#> 178                   point_prelevement
#> 179                   point_prelevement
#> 180                   point_prelevement
#> 181                   point_prelevement
#> 182                   point_prelevement
#> 183                   point_prelevement
#> 184                   point_prelevement
#> 185                   point_prelevement
#> 186                   point_prelevement
#> 187                   point_prelevement
#> 188                   point_prelevement
#> 189                   point_prelevement
#> 190                   point_prelevement
#> 191                   point_prelevement
#> 192                   point_prelevement
#> 193                   point_prelevement
#> 194                   point_prelevement
#> 195                   point_prelevement
#> 196                   point_prelevement
#> 197                   point_prelevement
#> 198                   point_prelevement
#> 199                   point_prelevement
#> 200                   point_prelevement
#> 201                   point_prelevement
#> 202                   point_prelevement
#> 203                   point_prelevement
#> 204                   point_prelevement
#> 205                   point_prelevement
#> 206                   point_prelevement
#> 207                   point_prelevement
#> 208                   point_prelevement
#> 209                   point_prelevement
#> 210                   point_prelevement
#> 211                   point_prelevement
#> 212                   point_prelevement
#> 213                   point_prelevement
#> 214            ref_unite_hydrographique
#> 215            ref_unite_hydrographique
#> 216            ref_unite_hydrographique
#> 217            ref_unite_hydrographique
#> 218            ref_unite_hydrographique
#> 219                             station
#> 220                             station
#> 221                             station
#> 222                             station
#> 223                             station
#> 224                             station
#> 225                             station
#> 226                             station
#> 227                             station
#> 228                             station
#> 229                             station
#> 230                             station
#> 231                             station
#> 232                             station
#> 233                             station
#> 234                             station
#> 235                       groupe_points
#> 236                       groupe_points
#> 237                       groupe_points
#> 238                       groupe_points
#> 239                       groupe_points
#> 240                       groupe_points
#> 241                       groupe_points
#> 242                       groupe_points
#> 243                       groupe_points
#> 244                       groupe_points
#> 245                        lot_poissons
#> 246                        lot_poissons
#> 247                        lot_poissons
#> 248                        lot_poissons
#> 249                        lot_poissons
#> 250                        lot_poissons
#> 251                        lot_poissons
#> 252                        lot_poissons
#> 253                        lot_poissons
#> 254                        lot_poissons
#> 255                        lot_poissons
#> 256                        lot_poissons
#> 257                             passage
#> 258                             passage
#> 259             prelevement_elementaire
#> 260             prelevement_elementaire
#> 261             prelevement_elementaire
#> 262             prelevement_elementaire
#> 263                          ref_espece
#> 264                          ref_espece
#> 265                          ref_espece
#> 266                          ref_espece
#> 267                          ref_espece
#> 268                          ref_espece
#> 269                          ref_espece
#> 270                          ref_espece
#> 271                          ref_espece
#> 272                          ref_espece
#> 273                          ref_espece
#> 274                          ref_espece
#> 275            ref_formation_geologique
#> 276            ref_formation_geologique
#> 277            ref_formation_geologique
#> 278            ref_formation_geologique
#> 279             ref_regime_hydrologique
#> 280             ref_regime_hydrologique
#> 281             ref_regime_hydrologique
#> 282             ref_regime_hydrologique
#> 283                              facies
#> 284                              facies
#> 285                              facies
#> 286                              facies
#> 287                              facies
#> 288                              facies
#> 289                              facies
#> 290                              facies
#> 291                              facies
#> 292                              facies
#> 293                             habitat
#> 294                             habitat
#> 295                             habitat
#> 296                             habitat
#> 297                             habitat
#> 298                             habitat
#> 299                             habitat
#> 300                             habitat
#> 301                             habitat
#> 302                             habitat
#> 303                   habitat_anguilles
#> 304                   habitat_anguilles
#> 305                   habitat_anguilles
#> 306                   habitat_anguilles
#> 307                   habitat_anguilles
#> 308                   habitat_anguilles
#> 309                   habitat_anguilles
#> 310                   habitat_anguilles
#> 311                   habitat_anguilles
#> 312                   habitat_anguilles
#> 313                   habitat_anguilles
#> 314                   habitat_anguilles
#> 315                   habitat_anguilles
#> 316                   habitat_anguilles
#> 317       historique_environnemental_pp
#> 318       historique_environnemental_pp
#> 319       historique_environnemental_pp
#> 320       historique_environnemental_pp
#> 321       historique_environnemental_pp
#> 322       historique_environnemental_pp
#> 323       historique_environnemental_pp
#> 324                 mesure_individuelle
#> 325                 mesure_individuelle
#> 326                 mesure_individuelle
#> 327                 mesure_individuelle
#> 328                 mesure_individuelle
#> 329                 mesure_individuelle
#> 330                 mesure_individuelle
#> 331                 mesure_individuelle
#> 332                 mesure_individuelle
#> 333                 mesure_individuelle
#> 334                       operation_ipr
#> 335                       operation_ipr
#> 336                       operation_ipr
#> 337                       operation_ipr
#> 338                       operation_ipr
#> 339                       operation_ipr
#> 340                       operation_ipr
#> 341                       operation_ipr
#> 342                       operation_ipr
#> 343                       operation_ipr
#> 344                       operation_ipr
#> 345                       operation_ipr
#> 346                       operation_ipr
#> 347                       operation_ipr
#> 348                       operation_ipr
#> 349                       operation_ipr
#> 350                       operation_ipr
#> 351                       operation_ipr
#> 352                       operation_ipr
#> 353                       operation_ipr
#> 354                       operation_ipr
#> 355                       operation_ipr
#> 356                       operation_ipr
#> 357                       operation_ipr
#> 358                       operation_ipr
#> 359                       operation_ipr
#> 360                       operation_ipr
#> 361                       operation_ipr
#> 362                       operation_ipr
#> 363                       operation_ipr
#> 364                       operation_ipr
#> 365                       operation_ipr
#> 366                       operation_ipr
#> 367                       operation_ipr
#> 368                       operation_ipr
#> 369                       operation_ipr
#> 370                       operation_ipr
#> 371                       operation_ipr
#> 372                       operation_ipr
#> 373                       operation_ipr
#> 374                       operation_ipr
#> 375                       operation_ipr
#> 376                  operation_ipr_plus
#> 377                  operation_ipr_plus
#> 378                  operation_ipr_plus
#> 379                  operation_ipr_plus
#> 380                  operation_ipr_plus
#> 381                  operation_ipr_plus
#> 382                  operation_ipr_plus
#> 383                  operation_ipr_plus
#> 384                  operation_ipr_plus
#> 385                  operation_ipr_plus
#> 386                  operation_ipr_plus
#> 387                  operation_ipr_plus
#> 388                  operation_ipr_plus
#> 389                  operation_ipr_plus
#> 390                  operation_ipr_plus
#> 391                  operation_ipr_plus
#> 392                  operation_ipr_plus
#> 393                  operation_ipr_plus
#> 394                  operation_ipr_plus
#> 395                  operation_ipr_plus
#> 396                  operation_ipr_plus
#> 397                  operation_ipr_plus
#> 398                  operation_ipr_plus
#> 399                  operation_ipr_plus
#> 400                  operation_ipr_plus
#> 401                  operation_ipr_plus
#> 402                  operation_ipr_plus
#> 403                  operation_ipr_plus
#> 404                  operation_ipr_plus
#> 405                  operation_ipr_plus
#> 406                  operation_ipr_plus
#> 407                  operation_ipr_plus
#> 408                  operation_ipr_plus
#> 409                  operation_ipr_plus
#> 410                  operation_ipr_plus
#> 411                  operation_ipr_plus
#> 412                  operation_ipr_plus
#> 413                  operation_ipr_plus
#> 414                  operation_ipr_plus
#> 415                  operation_ipr_plus
#> 416                  operation_ipr_plus
#> 417                  operation_ipr_plus
#> 418                  operation_ipr_plus
#> 419                  operation_ipr_plus
#> 420                  operation_ipr_plus
#> 421                  operation_ipr_plus
#> 422                  operation_ipr_plus
#> 423                  operation_ipr_plus
#> 424                  operation_ipr_plus
#> 425                  operation_ipr_plus
#> 426                  operation_ipr_plus
#> 427                  operation_ipr_plus
#> 428                  operation_ipr_plus
#> 429                  operation_ipr_plus
#> 430                  operation_ipr_plus
#> 431                  operation_ipr_plus
#> 432                  operation_ipr_plus
#> 433                  operation_ipr_plus
#> 434                  operation_objectif
#> 435                  operation_objectif
#> 436                     operation_suivi
#> 437                     operation_suivi
#> 438                     operation_suivi
#> 439                     operation_suivi
#> 440                     operation_suivi
#> 441                     operation_suivi
#> 442                     operation_suivi
#> 443                     operation_suivi
#> 444                     operation_suivi
#> 445                     operation_suivi
#> 446                     operation_suivi
#> 447                      pathologie_lot
#> 448                      pathologie_lot
#> 449                      pathologie_lot
#> 450                      pathologie_lot
#> 451                  pathologie_poisson
#> 452                  pathologie_poisson
#> 453                  pathologie_poisson
#> 454                  pathologie_poisson
#> 455             point_prelevement_image
#> 456             point_prelevement_image
#> 457             point_prelevement_image
#> 458             point_prelevement_image
#> 459             point_prelevement_image
#> 460             point_prelevement_image
#> 461             point_prelevement_image
#> 462             point_prelevement_image
#> 463             point_prelevement_image
#> 464            probabilite_presence_ipr
#> 465            probabilite_presence_ipr
#> 466            probabilite_presence_ipr
#> 467            probabilite_presence_ipr
#> 468       probabilite_presence_ipr_plus
#> 469       probabilite_presence_ipr_plus
#> 470       probabilite_presence_ipr_plus
#> 471                        profil_droit
#> 472                        profil_droit
#> 473                   ref_accessibilite
#> 474                   ref_accessibilite
#> 475                   ref_accessibilite
#> 476                          ref_bassin
#> 477                          ref_bassin
#> 478                          ref_bassin
#> 479             ref_categorie_piscicole
#> 480             ref_categorie_piscicole
#> 481             ref_categorie_piscicole
#> 482             ref_categorie_piscicole
#> 483          ref_classe_vitesse_courant
#> 484          ref_classe_vitesse_courant
#> 485          ref_classe_vitesse_courant
#> 486                       ref_colmatage
#> 487                       ref_colmatage
#> 488                       ref_colmatage
#> 489                       ref_colmatage
#> 490          ref_condition_hydrologique
#> 491          ref_condition_hydrologique
#> 492          ref_condition_hydrologique
#> 493          ref_condition_hydrologique
#> 494          ref_condition_hydrologique
#> 495                           ref_droit
#> 496                           ref_droit
#> 497                           ref_droit
#> 498                           ref_droit
#> 499           ref_entite_hydrographique
#> 500           ref_entite_hydrographique
#> 501           ref_entite_hydrographique
#> 502           ref_entite_hydrographique
#> 503           ref_entite_hydrographique
#> 504                 ref_etat_avancement
#> 505                 ref_etat_avancement
#> 506                 ref_etat_avancement
#> 507              ref_fabricant_materiel
#> 508              ref_fabricant_materiel
#> 509              ref_fabricant_materiel
#> 510              ref_fabricant_materiel
#> 511                 ref_facies_ambiance
#> 512                 ref_facies_ambiance
#> 513                 ref_facies_ambiance
#> 514                 ref_facies_ambiance
#> 515                 ref_facies_ambiance
#> 516                       ref_flag_wama
#> 517                       ref_flag_wama
#> 518                       ref_flag_wama
#> 519                       ref_flag_wama
#> 520               ref_fraction_analysee
#> 521               ref_fraction_analysee
#> 522               ref_fraction_analysee
#> 523               ref_fraction_analysee
#> 524               ref_fraction_analysee
#> 525               ref_fraction_analysee
#> 526                   ref_granulometrie
#> 527                   ref_granulometrie
#> 528                   ref_granulometrie
#> 529                   ref_granulometrie
#> 530                   ref_granulometrie
#> 531                      ref_importance
#> 532                      ref_importance
#> 533                      ref_importance
#> 534                     ref_intervenant
#> 535                     ref_intervenant
#> 536                     ref_intervenant
#> 537                     ref_intervenant
#> 538                     ref_intervenant
#> 539                     ref_intervenant
#> 540                     ref_intervenant
#> 541                       ref_isolement
#> 542                       ref_isolement
#> 543                       ref_isolement
#> 544           ref_localisation_ambiance
#> 545           ref_localisation_ambiance
#> 546           ref_localisation_ambiance
#> 547                       ref_logique_3
#> 548                       ref_logique_3
#> 549                       ref_logique_3
#> 550                       ref_logique_4
#> 551                       ref_logique_4
#> 552                       ref_logique_4
#> 553        ref_methode_estimation_poids
#> 554        ref_methode_estimation_poids
#> 555        ref_methode_estimation_poids
#> 556                 ref_modele_materiel
#> 557                 ref_modele_materiel
#> 558                 ref_modele_materiel
#> 559                 ref_modele_materiel
#> 560                 ref_modele_materiel
#> 561               ref_moyen_prospection
#> 562               ref_moyen_prospection
#> 563               ref_moyen_prospection
#> 564            ref_niveau_qualification
#> 565            ref_niveau_qualification
#> 566            ref_niveau_qualification
#> 567            ref_niveau_qualification
#> 568            ref_niveau_qualification
#> 569                        ref_objectif
#> 570                        ref_objectif
#> 571                        ref_objectif
#> 572                        ref_objectif
#> 573                        ref_objectif
#> 574                  ref_occupation_sol
#> 575                  ref_occupation_sol
#> 576                  ref_occupation_sol
#> 577                  ref_occupation_sol
#> 578                  ref_occupation_sol
#> 579                         ref_ombrage
#> 580                         ref_ombrage
#> 581                         ref_ombrage
#> 582                         ref_ombrage
#> 583                         ref_ombrage
#> 584                ref_ombrage_ambiance
#> 585                ref_ombrage_ambiance
#> 586                ref_ombrage_ambiance
#> 587                ref_ombrage_ambiance
#> 588                ref_ombrage_ambiance
#> 589                 ref_ombrage_riviere
#> 590                 ref_ombrage_riviere
#> 591                 ref_ombrage_riviere
#> 592                 ref_ombrage_riviere
#> 593                 ref_ombrage_riviere
#> 594                      ref_pathologie
#> 595                      ref_pathologie
#> 596                      ref_pathologie
#> 597                      ref_pathologie
#> 598                          ref_profil
#> 599                          ref_profil
#> 600                          ref_profil
#> 601                       ref_protocole
#> 602                       ref_protocole
#> 603                       ref_protocole
#> 604                       ref_protocole
#> 605                       ref_protocole
#> 606                    ref_repeuplement
#> 607                    ref_repeuplement
#> 608                    ref_repeuplement
#> 609                            ref_sexe
#> 610                            ref_sexe
#> 611                            ref_sexe
#> 612                       ref_sinuosite
#> 613                       ref_sinuosite
#> 614                       ref_sinuosite
#> 615                       ref_situation
#> 616                       ref_situation
#> 617                       ref_situation
#> 618                  ref_support_sandre
#> 619                  ref_support_sandre
#> 620                  ref_support_sandre
#> 621                  ref_support_sandre
#> 622                  ref_tendance_debit
#> 623                  ref_tendance_debit
#> 624                  ref_tendance_debit
#> 625                  ref_tendance_debit
#> 626                  ref_tendance_debit
#> 627                       ref_turbidite
#> 628                       ref_turbidite
#> 629                       ref_turbidite
#> 630                       ref_turbidite
#> 631                       ref_turbidite
#> 632                  ref_type_abondance
#> 633                  ref_type_abondance
#> 634                  ref_type_abondance
#> 635        ref_type_abondance_anguilles
#> 636        ref_type_abondance_anguilles
#> 637        ref_type_abondance_anguilles
#> 638        ref_type_abondance_anguilles
#> 639           ref_type_abondance_saumon
#> 640           ref_type_abondance_saumon
#> 641           ref_type_abondance_saumon
#> 642                  ref_type_colmatage
#> 643                  ref_type_colmatage
#> 644                  ref_type_colmatage
#> 645                  ref_type_colmatage
#> 646                  ref_type_colmatage
#> 647                     ref_type_facies
#> 648                     ref_type_facies
#> 649                     ref_type_facies
#> 650                     ref_type_facies
#> 651                     ref_type_facies
#> 652              ref_type_groupe_points
#> 653              ref_type_groupe_points
#> 654              ref_type_groupe_points
#> 655               ref_type_illustration
#> 656               ref_type_illustration
#> 657               ref_type_illustration
#> 658                   ref_type_longueur
#> 659                   ref_type_longueur
#> 660                   ref_type_longueur
#> 661                   ref_type_longueur
#> 662                        ref_type_lot
#> 663                        ref_type_lot
#> 664                        ref_type_lot
#> 665                        ref_type_lot
#> 666                        ref_type_lot
#> 667    ref_type_prelevement_elementaire
#> 668    ref_type_prelevement_elementaire
#> 669    ref_type_prelevement_elementaire
#> 670                 ref_type_projection
#> 671                 ref_type_projection
#> 672                 ref_type_projection
#> 673                 ref_type_projection
#> 674                 ref_type_projection
#> 675                 ref_type_projection
#> 676                      ref_vegetation
#> 677                      ref_vegetation
#> 678                      ref_vegetation
#> 679            ref_vegetation_dominante
#> 680            ref_vegetation_dominante
#> 681            ref_vegetation_dominante
#> 682                       ref_zone_huet
#> 683                       ref_zone_huet
#> 684                       ref_zone_huet
#> 685                              region
#> 686                              region
#> 687                              region
#> 688                         utilisateur
#> 689                         utilisateur
#> 690                         utilisateur
#> 691                         utilisateur
#> 692                         utilisateur
#> 693                         utilisateur
#> 694                   utilisateur_droit
#> 695                   utilisateur_droit
#> 696                     rejet_operation
#> 697                     rejet_operation
#> 698                     rejet_operation
#> 699                     rejet_operation
#> 700                     rejet_operation
#> 701                     rejet_operation
#> 702                     rejet_operation
#> 703                     rejet_operation
#> 704                    trace_traitement
#> 705                    trace_traitement
#> 706                    trace_traitement
#> 707                    trace_traitement
#> 708                    trace_traitement
#> 709                    trace_traitement
#> 710               trace_traitement_base
#> 711               trace_traitement_base
#> 712               trace_traitement_base
#> 713               trace_traitement_base
#> 714               trace_traitement_base
#> 715               trace_traitement_base
#> 716               trace_traitement_base
#> 717               trace_traitement_base
#> 718               trace_traitement_base
#> 719               trace_traitement_base
#> 720                            libelles
#> 721                            libelles
#> 722                            libelles
#> 723                            libelles
#> 724                            libelles
#> 725                            libelles
#> 726                            libelles
#> 727                            libelles
#> 728                           materiels
#> 729                           materiels
#> 730                           materiels
#> 731                           materiels
#> 732                           materiels
#> 733                           materiels
#> 734                           materiels
#> 735                           materiels
#> 736                          parametres
#> 737                          parametres
#> 738                          parametres
#> 739                          parametres
#> 740                          parametres
#> 741                          parametres
#> 742                  parametres_globaux
#>                                              nom_var
#> 1                                             amb_id
#> 2                                      amb_code_zone
#> 3                                            amb_nom
#> 4                                       amb_longueur
#> 5                                        amb_largeur
#> 6                                     amb_profondeur
#> 7                                         amb_faa_id
#> 8                                         amb_sit_id
#> 9                                         amb_loa_id
#> 10                                        amb_cvc_id
#> 11                              amb_gra_id_dominante
#> 12                             amb_gra_id_accessoire
#> 13                              amb_veg_id_dominante
#> 14                   amb_tya_id_vegetation_aquatique
#> 15                               amb_tya_id_embacles
#> 16                     amb_tya_id_vegetation_bordure
#> 17                             amb_tya_id_sous_berge
#> 18                          amb_tya_id_granulometrie
#> 19                                  amb_observations
#> 20                                        amb_oma_id
#> 21                                        aue_esp_id
#> 22                                        aue_ope_id
#> 23                                            cli_id
#> 24                                        cli_classe
#> 25                                       cli_libelle
#> 26                                     cli_borne_inf
#> 27                                     cli_borne_sup
#> 28                                  cli_altitude_min
#> 29                                  cli_altitude_max
#> 30                             cli_date_debut_valide
#> 31                               cli_date_fin_valide
#> 32                                            cip_id
#> 33                                        cip_classe
#> 34                                       cip_libelle
#> 35                                     cip_borne_inf
#> 36                                     cip_borne_sup
#> 37                                  cip_altitude_min
#> 38                                  cip_altitude_max
#> 39                             cip_date_debut_valide
#> 40                               cip_date_fin_valide
#> 41                                    com_code_insee
#> 42                                com_dep_code_insee
#> 43                                       com_libelle
#> 44                                        com_statut
#> 45                                    dep_code_insee
#> 46                                dep_reg_code_insee
#> 47                                       dep_libelle
#> 48                                            dic_id
#> 49                                   dic_code_sandre
#> 50                                dic_libelle_sandre
#> 51                                        dic_dic_id
#> 52                                        dic_statut
#> 53                                    dic_mnemonique
#> 54                                        dic_obj_id
#> 55                                            dip_id
#> 56                                        dip_dic_id
#> 57                                        dip_pop_id
#> 58                                    dip_date_debut
#> 59                                      dip_date_fin
#> 60                                            dis_id
#> 61                                        dis_dic_id
#> 62                                        dis_sta_id
#> 63                                    dis_date_debut
#> 64                                      dis_date_fin
#> 65                                            doc_id
#> 66                                        doc_dos_id
#> 67                                       doc_libelle
#> 68                                            dos_id
#> 69                                     dos_parent_id
#> 70                                       dos_libelle
#> 71                                            ope_id
#> 72                                     ope_code_wama
#> 73                                       ope_id_wama
#> 74                                        ope_pop_id
#> 75                                        ope_pro_id
#> 76                        ope_int_id_operateur_peche
#> 77                          ope_int_id_commanditaire
#> 78                   ope_int_id_validation_technique
#> 79                               ope_directeur_peche
#> 80                                          ope_date
#> 81                                    ope_poste_wama
#> 82                               ope_pente_ligne_eau
#> 83                              ope_section_mouillee
#> 84                                 ope_durete_totale
#> 85                          ope_temp_max_moyenne_eau
#> 86                ope_temp_air_bassin_versant_cerema
#> 87           ope_precipitation_bassin_versant_cerema
#> 88        ope_amplitude_thermique_air_station_cerema
#> 89                ope_temperature_air_station_cerema
#> 90                              ope_surface_calculee
#> 91                                 ope_espece_ciblee
#> 92                                        ope_esp_id
#> 93                     ope_commentaire_espece_ciblee
#> 94                                        ope_niq_id
#> 95                                        ope_eta_id
#> 96                                 ope_limite_0_plus
#> 97                                 ope_limite_1_plus
#> 98               ope_nb_anguilles_vues_non_capturees
#> 99                                   ope_commentaire
#> 100                                 ope_sans_poisson
#> 101                 ope_niveau_typologique_theorique
#> 102                              ope_uti_id_creation
#> 103                                ope_date_creation
#> 104                 ope_uti_id_derniere_modification
#> 105                   ope_date_derniere_modification
#> 106                                       ope_flw_id
#> 107                           ope_degroupage_lots_ok
#> 108                                       ope_cap_id
#> 109                          ope_validation_en_cours
#> 110                          ope_commanditaire_modif
#> 111                          ope_commanditaire_valid
#> 112                          ope_synthese_disponible
#> 113            ope_date_derniere_generation_synthese
#> 114                               ope_confidentielle
#> 115          ope_date_premiere_demande_non_diffusion
#> 116     ope_date_derniere_modification_non_diffusion
#> 117                                       odp_ope_id
#> 118                                       odp_mop_id
#> 119                                  odp_duree_peche
#> 120                                odp_nombre_traits
#> 121                      odp_nombre_points_anguilles
#> 122             odp_surface_eq_radier_rapide_troncon
#> 123                       odp_observations_generales
#> 124                                     odp_longueur
#> 125                             odp_largeur_lame_eau
#> 126                                  odp_iso_id_aval
#> 127                                 odp_iso_id_amont
#> 128                          odp_largeur_rive_gauche
#> 129                         odp_longueur_rive_gauche
#> 130                          odp_largeur_rive_droite
#> 131                         odp_longueur_rive_droite
#> 132                      odp_temperature_instantanee
#> 133                                 odp_conductivite
#> 134                                       odp_ted_id
#> 135                                       odp_tur_id
#> 136                                       odp_coh_id
#> 137                       odp_debit_moyen_journalier
#> 138                          odp_debit_moyen_horaire
#> 139                                       odp_mom_id
#> 140                                      odp_tension
#> 141                                    odp_intensite
#> 142                                    odp_puissance
#> 143                                odp_nombre_anodes
#> 144                            odp_nombre_epuisettes
#> 145                             odp_maille_epuisette
#> 146                                       ode_ope_id
#> 147                 ode_lo3_id_secteur_debit_reserve
#> 148                 ode_lo3_id_secteur_soumis_ecluse
#> 149                        ode_lo3_id_soutien_etiage
#> 150                      ode_observations_hydrologie
#> 151                   ode_profondeur_moyenne_station
#> 152                       ode_observation_vegetation
#> 153                        ode_observation_colmatage
#> 154                                       ode_hab_id
#> 155                                       ode_haa_id
#> 156                                       ode_omb_id
#> 157                                       ode_col_id
#> 158               ode_gra_id_granulometrie_dominante
#> 159              ode_gra_id_granulometrie_accessoire
#> 160                         ode_observations_station
#> 161                                       ode_rep_id
#> 162                    ode_observations_repeuplement
#> 163                     ode_lo3_id_station_canalisee
#> 164                      ode_lo3_id_station_naviguee
#> 165        ode_lo3_id_frequentation_sports_nautiques
#> 166                                ode_lo3_id_curage
#> 167                                   ode_faucardage
#> 168                     ode_lo3_id_deboisement_total
#> 169              ode_lo4_id_modification_morphologie
#> 170                  ode_lo4_id_extraction_granulats
#> 171                      ode_observations_lits_rives
#> 172                                           pop_id
#> 173                                       pop_sta_id
#> 174                                  pop_code_sandre
#> 175                                    pop_code_wama
#> 176                                 pop_libelle_wama
#> 177                          pop_com_code_insee_wama
#> 178                                       pop_enh_id
#> 179                                       pop_sus_id
#> 180                                    pop_geometrie
#> 181                                       pop_typ_id
#> 182                                pop_coordonnees_x
#> 183                                pop_coordonnees_y
#> 184                                     pop_lieu_dit
#> 185                         pop_localisation_precise
#> 186                                 pop_distance_mer
#> 187                     pop_distance_maree_dynamique
#> 188                                pop_fog_id_cerema
#> 189                                       pop_ocs_id
#> 190                                       pop_zoh_id
#> 191                                pop_reh_id_cerema
#> 192                                       pop_cap_id
#> 193                                       pop_acc_id
#> 194                           pop_largeur_lit_mineur
#> 195                                       pop_unh_id
#> 196                              pop_distance_source
#> 197                                     pop_altitude
#> 198                          pop_pente_ign_cours_eau
#> 199                 pop_surface_bassin_versant_amont
#> 200                  pop_temperature_moyenne_janvier
#> 201                  pop_temperature_moyenne_juillet
#> 202                                       pop_uti_id
#> 203                   pop_date_derniere_modification
#> 204                                       pop_statut
#> 205                                       pop_bas_id
#> 206           pop_etablissement_realise_modification
#> 207                            pop_unh_id_historique
#> 208                   pop_distance_source_historique
#> 209                          pop_altitude_historique
#> 210               pop_pente_ign_cours_eau_historique
#> 211      pop_surface_bassin_versant_amont_historique
#> 212       pop_temperature_moyenne_janvier_historique
#> 213       pop_temperature_moyenne_juillet_historique
#> 214                                           unh_id
#> 215                                  unh_code_sandre
#> 216                                      unh_libelle
#> 217                              unh_ordre_affichage
#> 218                               unh_libelle_sandre
#> 219                                           sta_id
#> 220                                  sta_code_sandre
#> 221                               sta_libelle_sandre
#> 222                                       sta_enh_id
#> 223                      sta_eligibilite_ipr_iprplus
#> 224                               sta_com_code_insee
#> 225                                sta_point_km_aval
#> 226                         sta_localisation_precise
#> 227                      sta_code_national_masse_eau
#> 228                                    sta_geometrie
#> 229                                       sta_typ_id
#> 230                                sta_coordonnees_x
#> 231                                sta_coordonnees_y
#> 232                   sta_date_derniere_modification
#> 233                                       sta_uti_id
#> 234                                       sta_statut
#> 235                                           grp_id
#> 236                                       grp_tgp_id
#> 237                                       grp_nombre
#> 238                   grp_nombre_points_sans_poisson
#> 239                 grp_nombre_points_facies_profond
#> 240                 grp_nombre_points_facies_courant
#> 241                    grp_nombre_points_facies_plat
#> 242                          grp_nombre_points_berge
#> 243                         grp_nombre_points_chenal
#> 244                         grp_nombre_points_annexe
#> 245                                           lop_id
#> 246                                       lop_pre_id
#> 247                                       lop_esp_id
#> 248                                       lop_tyl_id
#> 249               lop_longueur_specimens_taille_mini
#> 250               lop_longueur_specimens_taille_maxi
#> 251                              lop_numero_lot_wama
#> 252                                        lop_poids
#> 253                                 lop_poids_estime
#> 254                                       lop_mep_id
#> 255                                     lop_effectif
#> 256                                       lop_tlo_id
#> 257                                           pas_id
#> 258                                       pas_numero
#> 259                                           pre_id
#> 260                                       pre_ope_id
#> 261                                       pre_tpe_id
#> 262                                        pre_duree
#> 263                                           esp_id
#> 264                                  esp_code_sandre
#> 265                              esp_code_alternatif
#> 266                                   esp_nom_commun
#> 267                                    esp_nom_latin
#> 268                              esp_taille_maximale
#> 269                              esp_ordre_affichage
#> 270                                       esp_statut
#> 271                                     esp_code_ipr
#> 272                          esp_eligible_calcul_ipr
#> 273                      esp_eligible_calcul_iprplus
#> 274                                  esp_code_taxref
#> 275                                           fog_id
#> 276                                      fog_libelle
#> 277                              fog_ordre_affichage
#> 278                                         fog_code
#> 279                                           reh_id
#> 280                                      reh_libelle
#> 281                              reh_ordre_affichage
#> 282                                         reh_code
#> 283                                           fac_id
#> 284                                   fac_ode_ope_id
#> 285                                       fac_tyf_id
#> 286                          fac_importance_relative
#> 287                           fac_profondeur_moyenne
#> 288                             fac_gra_id_dominante
#> 289                            fac_gra_id_accessoire
#> 290                                       fac_tyc_id
#> 291                                       fac_ved_id
#> 292                      fac_recouvrement_vegetation
#> 293                                           hab_id
#> 294                                       hab_sin_id
#> 295                                       hab_omr_id
#> 296                          hab_tya_id_trous_fosses
#> 297                           hab_tya_id_sous_berges
#> 298                         hab_tya_id_abris_rocheux
#> 299                      hab_tya_id_embacles_souches
#> 300                hab_tya_id_abri_vegetal_aquatique
#> 301                    hab_tya_id_vegetation_bordure
#> 302                  hab_tys_id_vegetation_aquatique
#> 303                                           haa_id
#> 304                  haa_lo3_id_diversite_ecoulement
#> 305                  haa_lo3_id_ripisylve_equilibree
#> 306                                    haa_plat_lent
#> 307                                 haa_plat_courant
#> 308                                      haa_courant
#> 309                          haa_taa_id_trous_fosses
#> 310                           haa_taa_id_sous_berges
#> 311                         haa_taa_id_abris_rocheux
#> 312                      haa_taa_id_embacles_souches
#> 313                  haa_taa_id_vegetation_aquatique
#> 314                    haa_taa_id_vegetation_bordure
#> 315                                       haa_ved_id
#> 316                                haa_taa_id_racine
#> 317                                          hepp_id
#> 318                                      hepp_pop_id
#> 319                             hepp_donnee_modifiee
#> 320                             hepp_ancienne_valeur
#> 321                             hepp_nouvelle_valeur
#> 322                        hepp_date_de_modification
#> 323 hepp_etablissement_ayant_realise_la_modification
#> 324                                           mei_id
#> 325                                       mei_lop_id
#> 326                                       mei_sex_id
#> 327                                       mei_taille
#> 328                                        mei_poids
#> 329                                 mei_poids_estime
#> 330                                       mei_mep_id
#> 331                                          mei_age
#> 332                                mei_mesure_reelle
#> 333                                       mei_tlo_id
#> 334                                       opi_ope_id
#> 335                                       opi_cli_id
#> 336                                            opi_g
#> 337                                            opi_a
#> 338                                            opi_v
#> 339                                           opi_t1
#> 340                                           opi_t2
#> 341                                     opi_effectif
#> 342                                  opi_ner_observe
#> 343                                  opi_nel_observe
#> 344                                  opi_nte_observe
#> 345                                  opi_dit_observe
#> 346                                  opi_dio_observe
#> 347                                  opi_dii_observe
#> 348                                  opi_dti_observe
#> 349                                opi_ner_theorique
#> 350                                opi_nel_theorique
#> 351                                opi_nte_theorique
#> 352                                opi_dit_theorique
#> 353                                opi_dio_theorique
#> 354                                opi_dii_theorique
#> 355                                opi_dti_theorique
#> 356                                          opi_ner
#> 357                                          opi_nel
#> 358                                          opi_nte
#> 359                                          opi_dit
#> 360                                          opi_dio
#> 361                                          opi_dii
#> 362                                          opi_dti
#> 363                                          opi_ipr
#> 364                               opi_date_execution
#> 365                               opi_version_script
#> 366                                    opi_param_alt
#> 367                                   opi_param_surf
#> 368                                    opi_param_sbv
#> 369                                     opi_param_ds
#> 370                                    opi_param_lar
#> 371                                   opi_param_pent
#> 372                                   opi_param_prof
#> 373                               opi_param_tjuillet
#> 374                               opi_param_tjanvier
#> 375                                 opi_param_bassin
#> 376                                       oip_ope_id
#> 377                                         oip_huet
#> 378                                        oip_evapo
#> 379                                       oip_runoff
#> 380                                        oip_debit
#> 381                                          oip_pow
#> 382                                     oip_effectif
#> 383                                   oip_trx_0_plus
#> 384                             oip_trx_0_plus_seuil
#> 385                                     oip_ric_util
#> 386                                  oip_tol_observe
#> 387                               oip_stther_observe
#> 388                                oip_lipar_observe
#> 389                                 oip_omni_observe
#> 390                                oip_intol_observe
#> 391                              oip_o2intol_observe
#> 392                                oip_limno_observe
#> 393                    oip_abondance_o2intol_observe
#> 394                     oip_abondance_hintol_observe
#> 395                      oip_abondance_rhpar_observe
#> 396          oip_abondance_juveniles_truites_observe
#> 397                                oip_tol_theorique
#> 398                             oip_stther_theorique
#> 399                              oip_lipar_theorique
#> 400                               oip_omni_theorique
#> 401                              oip_intol_theorique
#> 402                            oip_o2intol_theorique
#> 403                              oip_limno_theorique
#> 404                  oip_abondance_o2intol_theorique
#> 405                   oip_abondance_hintol_theorique
#> 406                    oip_abondance_rhpar_theorique
#> 407       oip_abondance_juveniles_truites_theoriques
#> 408                                          oip_tol
#> 409                                       oip_stther
#> 410                                        oip_lipar
#> 411                                         oip_omni
#> 412                                        oip_intol
#> 413                                      oip_o2intol
#> 414                                        oip_limno
#> 415                            oip_abondance_o2intol
#> 416                             oip_abondance_hintol
#> 417                              oip_abondance_rhpar
#> 418                  oip_abondance_juveniles_truites
#> 419                                     oip_ipr_plus
#> 420                                       oip_cip_id
#> 421                               oip_date_execution
#> 422                               oip_version_script
#> 423                                oip_param_reg4_gv
#> 424                                    oip_param_sbv
#> 425                                   oip_param_geol
#> 426                                    oip_param_lar
#> 427                                   oip_param_pent
#> 428                                oip_param_strateg
#> 429                                 oip_param_bassin
#> 430                           oip_param_temp_mean_bv
#> 431                           oip_param_prec_mean_bv
#> 432                          oip_param_temp_ampl_sta
#> 433                          oip_param_temp_mean_sta
#> 434                                       opo_ope_id
#> 435                                       opo_obj_id
#> 436                                           ops_id
#> 437                                       ops_ope_id
#> 438                                         ops_date
#> 439                                      ops_uti_nom
#> 440                                  ops_int_libelle
#> 441                                  ops_eta_libelle
#> 442                                  ops_niq_libelle
#> 443                        ops_int_operateur_libelle
#> 444                    ops_int_commanditaire_libelle
#> 445             ops_int_validation_technique_libelle
#> 446                         ops_modification_libelle
#> 447                                       pal_lop_id
#> 448                                       pal_pat_id
#> 449                                       pal_fra_id
#> 450                                       pal_imp_id
#> 451                                       pap_mei_id
#> 452                                       pap_pat_id
#> 453                                       pap_fra_id
#> 454                                       pap_imp_id
#> 455                                           ppi_id
#> 456                                       ppi_pop_id
#> 457                                       ppi_tyi_id
#> 458                                  ppi_nom_fichier
#> 459                                    ppi_type_mime
#> 460                               ppi_taille_fichier
#> 461                                   ppi_principale
#> 462                                       ppi_uti_id
#> 463                                         ppi_date
#> 464                                   ppi_opi_ope_id
#> 465                                       ppi_esp_id
#> 466                           ppi_valeur_probabilite
#> 467                               ppi_param_effectif
#> 468                                  ppip_oip_ope_id
#> 469                                      ppip_esp_id
#> 470                          ppip_valeur_probabilite
#> 471                                       prd_pro_id
#> 472                                       prd_dro_id
#> 473                                           acc_id
#> 474                                      acc_libelle
#> 475                              acc_ordre_affichage
#> 476                                           bas_id
#> 477                                  bas_code_sandre
#> 478                               bas_libelle_sandre
#> 479                                           cap_id
#> 480                               cap_libelle_sandre
#> 481                              cap_ordre_affichage
#> 482                                  cap_code_sandre
#> 483                                           cvc_id
#> 484                                      cvc_libelle
#> 485                              cvc_ordre_affichage
#> 486                                           col_id
#> 487                               col_libelle_sandre
#> 488                              col_ordre_affichage
#> 489                                  col_code_sandre
#> 490                                           coh_id
#> 491                                      coh_libelle
#> 492                                  coh_code_sandre
#> 493                               coh_libelle_sandre
#> 494                              coh_ordre_affichage
#> 495                                           dro_id
#> 496                                         dro_code
#> 497                                      dro_libelle
#> 498                              dro_ordre_affichage
#> 499                                           enh_id
#> 500                               enh_libelle_sandre
#> 501                                  enh_code_sandre
#> 502                              enh_ordre_affichage
#> 503                                       enh_statut
#> 504                                           eta_id
#> 505                                      eta_libelle
#> 506                              eta_ordre_affichage
#> 507                                           fam_id
#> 508                                      fam_libelle
#> 509                              fam_ordre_affichage
#> 510                                       fam_statut
#> 511                                           faa_id
#> 512                                      faa_libelle
#> 513                              faa_ordre_affichage
#> 514                                  faa_code_sandre
#> 515                               faa_libelle_sandre
#> 516                                           flw_id
#> 517                                    flw_code_wama
#> 518                                      flw_libelle
#> 519                              flw_ordre_affichage
#> 520                                           fra_id
#> 521                                  fra_code_sandre
#> 522                               fra_libelle_sandre
#> 523                                      fra_libelle
#> 524                              fra_ordre_affichage
#> 525                                    fra_code_wama
#> 526                                           gra_id
#> 527                                      gra_libelle
#> 528                              gra_ordre_affichage
#> 529                                  gra_code_sandre
#> 530                               gra_libelle_sandre
#> 531                                           imp_id
#> 532                                      imp_libelle
#> 533                              imp_ordre_affichage
#> 534                                           int_id
#> 535                                  int_code_sandre
#> 536                               int_libelle_sandre
#> 537                              int_ordre_affichage
#> 538                               int_flag_affichage
#> 539                                       int_statut
#> 540                                 int_libelle_aspe
#> 541                                           iso_id
#> 542                                      iso_libelle
#> 543                              iso_ordre_affichage
#> 544                                           loa_id
#> 545                                      loa_libelle
#> 546                              loa_ordre_affichage
#> 547                                           lo3_id
#> 548                                      lo3_libelle
#> 549                              lo3_ordre_affichage
#> 550                                           lo4_id
#> 551                                      lo4_libelle
#> 552                              lo4_ordre_affichage
#> 553                                           mep_id
#> 554                                      mep_libelle
#> 555                              mep_ordre_affichage
#> 556                                           mom_id
#> 557                                       mom_fam_id
#> 558                                      mom_libelle
#> 559                              mom_ordre_affichage
#> 560                                       mom_statut
#> 561                                           mop_id
#> 562                                      mop_libelle
#> 563                              mop_ordre_affichage
#> 564                                           niq_id
#> 565                                      niq_libelle
#> 566                              niq_ordre_affichage
#> 567                                  niq_code_sandre
#> 568                               niq_libelle_sandre
#> 569                                           obj_id
#> 570                                       obj_dic_id
#> 571                                      obj_libelle
#> 572                              obj_ordre_affichage
#> 573                       obj_obligatoire_calcul_ipr
#> 574                                           ocs_id
#> 575                                      ocs_libelle
#> 576                              ocs_ordre_affichage
#> 577                                  ocs_code_sandre
#> 578                               ocs_libelle_sandre
#> 579                                           omb_id
#> 580                                      omb_libelle
#> 581                                  omb_code_sandre
#> 582                               omb_libelle_sandre
#> 583                              omb_ordre_affichage
#> 584                                           oma_id
#> 585                                  oma_code_sandre
#> 586                               oma_libelle_sandre
#> 587                                      oma_libelle
#> 588                              oma_ordre_affichage
#> 589                                           omr_id
#> 590                                      omr_libelle
#> 591                              omr_ordre_affichage
#> 592                                  omr_code_sandre
#> 593                               omr_libelle_sandre
#> 594                                           pat_id
#> 595                                  pat_code_sandre
#> 596                               pat_libelle_sandre
#> 597                              pat_ordre_affichage
#> 598                                           pro_id
#> 599                                      pro_libelle
#> 600                              pro_ordre_affichage
#> 601                                           pro_id
#> 602                                     pro_acronyme
#> 603                                      pro_libelle
#> 604                              pro_ordre_affichage
#> 605                                       pro_esp_id
#> 606                                           rep_id
#> 607                                      rep_libelle
#> 608                              rep_ordre_affichage
#> 609                                           sex_id
#> 610                                      sex_libelle
#> 611                              sex_ordre_affichage
#> 612                                           sin_id
#> 613                                      sin_libelle
#> 614                              sin_ordre_affichage
#> 615                                           sit_id
#> 616                                      sit_libelle
#> 617                              sit_ordre_affichage
#> 618                                           sus_id
#> 619                                  sus_code_sandre
#> 620                               sus_libelle_sandre
#> 621                              sus_ordre_affichage
#> 622                                           ted_id
#> 623                                      ted_libelle
#> 624                              ted_ordre_affichage
#> 625                                  ted_code_sandre
#> 626                               ted_libelle_sandre
#> 627                                           tur_id
#> 628                                      tur_libelle
#> 629                                  tur_code_sandre
#> 630                               tur_libelle_sandre
#> 631                              tur_ordre_affichage
#> 632                                           tya_id
#> 633                                      tya_libelle
#> 634                              tya_ordre_affichage
#> 635                                           taa_id
#> 636                               taa_libelle_sandre
#> 637                              taa_ordre_affichage
#> 638                                  taa_code_sandre
#> 639                                           tys_id
#> 640                                      tys_libelle
#> 641                              tys_ordre_affichage
#> 642                                           tyc_id
#> 643                                      tyc_libelle
#> 644                              tyc_ordre_affichage
#> 645                                  tyc_code_sandre
#> 646                               tyc_libelle_sandre
#> 647                                           tyf_id
#> 648                                      tyf_libelle
#> 649                              tyf_ordre_affichage
#> 650                                  tyf_code_sandre
#> 651                               tyf_libelle_sandre
#> 652                                           tgp_id
#> 653                                      tgp_libelle
#> 654                              tgp_ordre_affichage
#> 655                                           tyi_id
#> 656                                      tyi_libelle
#> 657                              tyi_ordre_affichage
#> 658                                           tlo_id
#> 659                                    tlo_code_wama
#> 660                                      tlo_libelle
#> 661                              tlo_ordre_affichage
#> 662                                           tyl_id
#> 663                                      tyl_libelle
#> 664                              tyl_ordre_affichage
#> 665                                  tyl_code_sandre
#> 666                               tyl_libelle_sandre
#> 667                                           tpe_id
#> 668                                      tpe_libelle
#> 669                              tpe_ordre_affichage
#> 670                                           typ_id
#> 671                                  typ_code_sandre
#> 672                               typ_libelle_sandre
#> 673                                      typ_libelle
#> 674                              typ_ordre_affichage
#> 675                                    typ_code_epsg
#> 676                                           veg_id
#> 677                                      veg_libelle
#> 678                              veg_ordre_affichage
#> 679                                           ved_id
#> 680                                      ved_libelle
#> 681                              ved_ordre_affichage
#> 682                                           zoh_id
#> 683                                      zoh_libelle
#> 684                              zoh_ordre_affichage
#> 685                                   reg_code_insee
#> 686                                      reg_libelle
#> 687                              reg_ordre_affichage
#> 688                                           uti_id
#> 689                                       uti_int_id
#> 690                                          uti_nom
#> 691                                       uti_prenom
#> 692                                         uti_mail
#> 693                                        uti_actif
#> 694                                       utd_dro_id
#> 695                                       utd_uti_id
#> 696                                         trait_id
#> 697                            "Trait_base_id_poste"
#> 698                               rejet_operation_id
#> 699                                      rejet_table
#> 700                                    rejet_colonne
#> 701                                        rejet_rdg
#> 702                                     rejet_raison
#> 703                                     rejet_valeur
#> 704                                         trait_id
#> 705                                 trait_date_debut
#> 706                                   trait_date_fin
#> 707                                trait_utilisateur
#> 708                                   trait_resultat
#> 709                                     trait_raison
#> 710                                         trait_id
#> 711                              trait_base_id_poste
#> 712                                           "trait
#> 713                            trait_base_date_debut
#> 714                              trait_base_date_fin
#> 715                              trait_base_resultat
#> 716                                trait_base_raison
#> 717                trait_base_nb_operations_traitees
#> 718                    "trait_base_nb_operations_OK"
#> 719                    "trait_base_nb_operations_KO"
#> 720                                 lib_code_famille
#> 721                                   lib_id_famille
#> 722                                    lib_code_wama
#> 723                                      lib_id_wama
#> 724                                 lib_libelle_wama
#> 725                                   lib_table_aspe
#> 726                                      lib_id_aspe
#> 727                                 lib_libelle_aspe
#> 728                                  mat_id_listemat
#> 729                                       mat_lm_nom
#> 730                                      mat_lm_code
#> 731                                   mat_lm_typemat
#> 732                                   mat_table_aspe
#> 733                                      mat_id_aspe
#> 734                                       mat_id_fab
#> 735                                 mat_libelle_aspe
#> 736                                     par_nom_base
#> 737                                  par_nom_fichier
#> 738                           par_repertoire_fichier
#> 739                                   par_traitement
#> 740                                   par_poste_wama
#> 741                                 par_id_operateur
#> 742                               pag_nettoyer_cible
#>                                                                                                                                                                                                      comm_var
#> 1                                                                                                                                                                                                 Identifiant
#> 2                                                                                                                                                                                     Code zone de l'ambiance
#> 3                                                                                                                                                                                                         Nom
#> 4                                                                                                                                                                                             Longueur (en m)
#> 5                                                                                                                                                                                              Largeur (en m)
#> 6                                                                                                                                                                                           Profondeur (en m)
#> 7                                                                                                                                                                                              Type de faciès
#> 8                                                                                                                                                                                                   Situation
#> 9                                                                                                                                                                                  Localisation de l'ambiance
#> 10                                                                                                                                                                               Classe de vitesse du courant
#> 11                                                                                                                                                                                    Granulométrie dominante
#> 12                                                                                                                                                                                   Granulométrie accessoire
#> 13                                                                                                                                                                 Type de végétation dominante de l'ambiance
#> 14                                                                                                                                                                              Câches - Végétation aquatique
#> 15                                                                                                                                                                                          Câches - Embâcles
#> 16                                                                                                                                                                             Câches - Végétation de bordure
#> 17                                                                                                                                                                                        Câches - Sous-berge
#> 18                                                                                                                                                                                     Câches - Granulométrie
#> 19                                                                                                                                                                                               Observations
#> 20                                                                                                                                                                                      Ombrage de l'ambiance
#> 21                                                                                                                                                                                     Identifiant de l'epèce
#> 22                                                                                                                                                                                      Numéro de l'opération
#> 23                                                                                                                                                                                                Identifiant
#> 24                                                                                                                                                                                        Numéro de la classe
#> 25                                                                                                                                                                           Intitulé de la classe de qualité
#> 26                                                                                                                                                                              Borne inférieure de la classe
#> 27                                                                                                                                                                              Borne supérieure de la classe
#> 28                                                                                                                                                             Altitude minimale de la station pour la classe
#> 29                                                                                                                                                             Altitude maximale de la station pour la classe
#> 30                                                                                                                                                                                  Date de début de validité
#> 31                                                                                                                                                                                    Date de fin de validité
#> 32                                                                                                                                                                                                Identifiant
#> 33                                                                                                                                                                                        Numéro de la classe
#> 34                                                                                                                                                                           Intitulé de la classe de qualité
#> 35                                                                                                                                                                              Borne inférieure de la classe
#> 36                                                                                                                                                                              Borne supérieure de la classe
#> 37                                                                                                                                                             Altitude minimale de la station pour la classe
#> 38                                                                                                                                                             Altitude maximale de la station pour la classe
#> 39                                                                                                                                                                                  Date de début de validité
#> 40                                                                                                                                                                                    Date de fin de validité
#> 41                                                                                                                                                                                                 Code INSEE
#> 42                                                                                                                                                                                  Code INSEE du département
#> 43                                                                                                                                                                                      Libellé de la commune
#> 44                                                                                                                                                                                       Statut de la commune
#> 45                                                                                                                                                                                                 Code INSEE
#> 46                                                                                                                                                                                    Code INSEE de la région
#> 47                                                                                                                                                                                     Libellé du département
#> 48                                                                                                                                                                                                Identifiant
#> 49                                                                                                                                                                                                Code Sandre
#> 50                                                                                                                                                                                             Libellé Sandre
#> 51                                                                                                                                                                                       Méta-réseau éventuel
#> 52                                                                                                                     Flag permettant de savoir si le dispositif de collecte est à l'état "Validé" ou "Gelé"
#> 53                                                                                                                                                                       Mnémonique du dispositif de collecte
#> 54                                                                                                                                                                     Objectif représenté par le Méta-réseau
#> 55                                                                                                                                                                                                Identifiant
#> 56                                                                                                                                                                      Identifiant du dispositif de collecte
#> 57                                                                                                                                                                        Identifiant du point de prélèvement
#> 58                                                                                                                                                                     Date de début d'appartenance au réseau
#> 59                                                                                                                                                                       Date de fin d'appartenance au réseau
#> 60                                                                                                                                                                                                Identifiant
#> 61                                                                                                                                                                      Identifiant du dispositif de collecte
#> 62                                                                                                                                                                                  Identifiant de la station
#> 63                                                                                                                                                                     Date de début d'appartenance au réseau
#> 64                                                                                                                                                                       Date de fin d'appartenance au réseau
#> 65                                                                                                                                                                                                Identifiant
#> 66                                                                                                                                                                                    Dossier parent éventuel
#> 67                                                                                                                                                                                      Libellé Documentation
#> 68                                                                                                                                                                                                Identifiant
#> 69                                                                                                                                                                                    Dossier parent éventuel
#> 70                                                                                                                                                                                            Libellé Dossier
#> 71                                                                                                                                                                                      Numéro de l'opération
#> 72                                                                                                                                                                                 Ancien code opération Wama
#> 73                                                                                                                                                                   Identifiant de l'ancienne opération Wama
#> 74                                                                                                                                                                               Point de prélèvement associé
#> 75                                                                                                                                                                                         Protocole de pêche
#> 76                                                                                                 Organisme de l'opérateur de pêche (sauvegardée au cas où l''opérateur change de structure de rattachement)
#> 77                                                                                                                                                            Organisme commanditaire de l'opération de pêche
#> 78                                                                                                                                         Organisme chargé de la validation technique (niveau 2) des données
#> 79                                                                                                                                                                                         Directeur de pêche
#> 80                                                                                                                                                                      Date et heure de l'opération de pêche
#> 81                                                                                                                                                                                       Numéro du poste Wama
#> 82                                                                                                                                                                             Pente de la ligne d'eau (en ‰)
#> 83                                                                                                                                                                                           Section mouillée
#> 84                                                                                                                                                                    Dureté totale (calcium par litre en mg)
#> 85                                                                                                                         Température maximale moyenne de l'eau (30 jours consécutifs les plus chauds en °C)
#> 86                                                                                                                        Température moyenne inter-annuelle de l'air du bassin versant amont (donnée Cerema)
#> 87                                                                                                                           Précipitation moyenne inter-annuelle sur le bassin versant amont (donnée Cerema)
#> 88                                                                                                                                Amplitude thermique inter-annuelle maximale de l'air de la station (Cerema)
#> 89                                                                                                                       Température moyenne inter-annuelle de l'année de l''air à la station (donnée Cerema)
#> 90                                                                                                                                                                                   Surface calculée (en m2)
#> 91                                                                                                                                                                               Pêche à espèce ciblée ou pas
#> 92                                                                                                                                                                  Identifiant de l'espèce ciblée principale
#> 93                                                                                                                                                            Commentaire associé à (aux) espèce(s) ciblée(s)
#> 94                                                                                                                                                            Niveau de qualification de l'opération de pêche
#> 95                                                                                                                                                                 Etat d'avancement de l''opération de pêche
#> 96                                                                                                                 Limite 0+ (taille limite des individus de moins d'un an) pour les IA Saumon et Vigitruites
#> 97                                                                                                                  Limite 1+ (taille limite des individus d'un à deux ans) pour les IA Saumon et Vigitruites
#> 98                                                                                                                                                                      Nombre d'anguilles vues non capturées
#> 99                                                                                                                                                      Commentaire saisi lors des validations (niv 1, niv 2)
#> 100                                                                                                                                                                            Opération avec ou sans poisson
#> 101                                                                                                                                                      Niveau typologique théorique de l'opération de pêche
#> 102                                                                                                                                                                 Opérateur ayant créé l'opération de pêche
#> 103                                                                                                                                                                      Date de création de la ligne en base
#> 104                                                                                                                                                             Dernier utilisateur ayant modifié l'opération
#> 105                                                                                                                                                         Date de dernière modification de la ligne en base
#> 106                                                                                                                                                               Valeurs du champ op_flag_wama issue de Wama
#> 107                                                                                        Flag permettant de savoir si le dégroupage des lots de poissons s'est bien déroulé ou pas à la validation niveau 1
#> 108                                                                                                                                                                                       Catégorie piscicole
#> 109                                                                                                                Flag permettant d'empêcher la modification d''une opération si une validation est en cours
#> 110                                                                                                                                    Flag permettant de savoir si le commanditaire à modifier une opération
#> 111                                                                                                                                     Flag permettant de savoir si le commanditaire à valider une opération
#> 112                                                                                                                                                    Présence d'un rapport de synthèse disponible et à jour
#> 113                                                                                                                                          Date de dernière génération des rapports de synthèse d'opération
#> 114                                                                                                                                                              Flag de diffusion accessibilité de la donnée
#> 115                                                                                                                                                           La date de la première demande de non diffusion
#> 116                                                                                                                                                   La date de la dernière modification de la non diffusion
#> 117                                                                                                                                                                                     Numéro de l'opération
#> 118                                                                                                                                                                                      Moyen de prospection
#> 119                                                                                                                                                                            Durée de la pêche (en minutes)
#> 120                                                                                                                                                                 Nombre de traits (IA Saumon / Vigitruite)
#> 121                                                                                                                                                                           Nombre de points (IA Anguilles)
#> 122                                                                                                                           Surface équivalent radier / rapide du tronçon de la station (en m²) (IA Saumon)
#> 123                                                                                                                                              Observations générales concernant la description de la pêche
#> 124                                                                                                                                                     Longueur pêchée (en m) ou longueur de l'opération (m)
#> 125                                                                                                                                                                           Largeur de la lame d'eau (en m)
#> 126                                                                                                                                                                       Isolement à l'aval (pêche complète)
#> 127                                                                                                                                                                      Isolement à l'amont (pêche complète)
#> 128                                                                                                                                                           Largeur pêchée en rive gauche (pêche sur berge)
#> 129                                                                                                                                                         Longueur pêchée en rive gauche  (pêche sur berge)
#> 130                                                                                                                                                          Largeur pêchée en rive droite  (pêche sur berge)
#> 131                                                                                                                                                         Longueur pêchée en rive droite  (pêche sur berge)
#> 132                                                                                                                                                                          Température instantannée (en °C)
#> 133                                                                                                                                                                         Conductivité (en microsimmens/cm)
#> 134                                                                                                                                                                                         Tendance du débit
#> 135                                                                                                                                                                                                 Turbidité
#> 136                                                                                                                                                                                  Conditions hydrologiques
#> 137                                                                                                                                                                            Débit moyen journalier (en m3)
#> 138                                                                                                                                                                               Débit moyen horaire (en m3)
#> 139                                                                                                                                                                                Modèle du matériel utilisé
#> 140                                                                                                                                                                                        Tension (en volts)
#> 141                                                                                                                                                                                    Intensité (en Ampères)
#> 142                                                                                                                                                                                        Puissance (en kvA)
#> 143                                                                                                                                                                                           Nombre d'anodes
#> 144                                                                                                                                                                                       Nombre d'épuisettes
#> 145                                                                                                                                                                                     Maille de l'épuisette
#> 146                                                                                                                                                                                     Numéro de l'opération
#> 147                                                                                                                                                                                   Secteur à débit réservé
#> 148                                                                                                                                                                                   Secteur soumis à éclusé
#> 149                                                                                                                                                                                          Soutien d'étiage
#> 150                                                                                                                                                                      Observations concernant l'hydrologie
#> 151                                                                                                                                                                   Profondeur moyenne de la station (en m)
#> 152                                                                                                                                                                     Observations concernant la végétation
#> 153                                                                                                                                                                                 Observations du colmatage
#> 154                                                                                                                                                                                       Identifiant habitat
#> 155                                                                                                                                                                             Identifiant habitat anguilles
#> 156                                                                                                                                                              Ombrage (IA Saumon, Vigitruite, IA Anguille)
#> 157                                                                                                                                                                              Colmatage (saumon, anguille)
#> 158                                                                                                                                                                Granulométrie dominante (saumon, anguille)
#> 159                                                                                                                                                               Granulométrie accessoire (saumon, anguille)
#> 160                                                                                                                                                                               Observations sur la station
#> 161                                                                                                                                                                               Repeuplement sur la station
#> 162                                                                                                                                                                   Observations concernant le repeuplement
#> 163                                                                                                                                                                                         Station canalisée
#> 164                                                                                                                                                                                          Station naviguée
#> 165                                                                                                                                                                    Fréquentation par les sports nautiques
#> 166                                                                                                                                                                                                    Curage
#> 167                                                                                                                                                                                                Faucardage
#> 168                                                                                                                                                                                         Déboisement total
#> 169                                                                                                                                                                            Modification de la morphologie
#> 170                                                                                                                                                                                   Extraction de granulats
#> 171                                                                                                                                                               Observations concernant le lit et les rives
#> 172                                                                                                                                                                                               Identifiant
#> 173                                                                                                                                                                                         Station de mesure
#> 174                                                                                                                                                                                      Code Sandre du point
#> 175                                                                                                                                                                                        Code Wama du point
#> 176                                                                                                                                                                      Libellé Wama du point de prélèvement
#> 177                                                                                                                                  Code INSEE de la commune Wama du point non rattaché à une station Sandre
#> 178                                                                                                                                                                                 Cours d'eau du point Wama
#> 179                                                                                                                                                                             Identifiant du support Sandre
#> 180                                                                                                                                                                Géométrie du point de prélèvement en WGS84
#> 181                                                                                                                                                                         Identifiant du type de projection
#> 182                                                                                                                               Coordonnées x issue du point Sandre ou Wama (dans la projection pop_typ_id)
#> 183                                                                                                                               Coordonnées y issue du point Sandre ou Wama (dans la projection pop_typ_id)
#> 184                                                                                                                                                                                                  Lieu-dit
#> 185                                                                                                                                                                                      Localisation précise
#> 186                                                                                                                                                                                         Distance à la mer
#> 187                                                                                                                                                                             Distance à la marée dynamique
#> 188                                                                                                                                Formation géologique dominante sur le bassin versant amont (donnée Cerema)
#> 189                                                                                                                                                                                         Occupation du sol
#> 190                                                                                                                                                                                              Zone de Huet
#> 191                                                                                                                                                                       Régime hydrologique (donnée Cerema)
#> 192                                                                                                                                                                                       Catégorie piscicole
#> 193                                                                                                                                                                                             Accessibilité
#> 194                                                                                                                                                                              Largeur du lit mineur (en m)
#> 195                                                                                                                                                                                      Unité hydrographique
#> 196                                                                                                                                                                              Distance à la source (en km)
#> 197                                                                                                                                                                                           Altitude (en m)
#> 198                                                                                                                                                                           Pente IGN du cours d'eau (en %)
#> 199                                                                                                                                                                  Surface du bassin versant amont (en km²)
#> 200                                                                                                                                                                      Température moyenne en janvier en °C
#> 201                                                                                                                                                                      Température moyenne en juillet en °C
#> 202                                                                                                                                                 Dernier utilisateur ayant modifié le point de prélèvement
#> 203                                                                                                                                                        Date de dernière modification des données du point
#> 204                                                                                                                      Flag permettant de savoir si le point de prélèvement est à l'état "Validé" ou "Gelé"
#> 205                                                                                                                                                                            Bassin du point de prélèvement
#> 206                                                                                                                                                             L'établissement ayant réalisé la modification
#> 207                                                                                                                                                                           Historique unite hydrographique
#> 208                                                                                                                                                                                Historique distance source
#> 209                                                                                                                                                                                       Historique altitude
#> 210                                                                                                                                                                            Historique pente ign cours eau
#> 211                                                                                                                                                                   Historique surface bassin versant amont
#> 212                                                                                                                                                                    Historique temperature moyenne janvier
#> 213                                                                                                                                                                    Historique temperature moyenne juillet
#> 214                                                                                                                                                                                               Identifiant
#> 215                                                                                                                                                                                               Code Sandre
#> 216                                                                                                                                                                                                   Libellé
#> 217                                                                                                                                                                                         Ordre d'affichage
#> 218                                                                                                                                                                                            Libellé Sandre
#> 219                                                                                                                                                                                               Identifiant
#> 220                                                                                                                                                                                               Code Sandre
#> 221                                                                                                                                                                              Libellé de la station Sandre
#> 222                                                                                                                                                                    Identifiant de l'entité hydrographique
#> 223                                                                                                         Flag permettant de savoir si la station est éligible ou pas au calcul des indicateurs IPR et IPR+
#> 224                                                                                                                                                                                  Code INSEE de la commune
#> 225                                                                                                                                                                                   Point kilometrique aval
#> 226                                                                                                                                                                                      Localisation précise
#> 227                                                                                                                                                                           Code national de la masse d'eau
#> 228                                                                                                                                                                                   Géométrie de la station
#> 229                                                                                                                                                                         Identifiant du type de projection
#> 230                                                                                                                                             Coordonnées x issue du Sandre (dans la projection sta_typ_id)
#> 231                                                                                                                                             Coordonnées y issue du Sandre (dans la projection sta_typ_id)
#> 232                                                                                                                                                               Date de dernière modification de la station
#> 233                                                                                                                                                              Dernier utilisateur ayant modifié la station
#> 234                                                                                                                                   Flag permettant de savoir si la station est à l'état "Validé" ou "Gelé"
#> 235                                                                                                                                                                                               Identifiant
#> 236                                                                                                                                                                                  Type de groupe de points
#> 237                                                                                                                                                                                          Nombre de points
#> 238                                                                                                                                                                             Nombre de points sans poisson
#> 239                                                                                                                                                                        Nombre de points en faciès profond
#> 240                                                                                                                                                                        Nombre de points en faciès courant
#> 241                                                                                                                                                                           Nombre de points en faciès plat
#> 242                                                                                                                                                                                 Nombre de points en berge
#> 243                                                                                                                                                                                Nombre de points en chenal
#> 244                                                                                                                                                                                Nombre de points en annexe
#> 245                                                                                                                                                                                               Identifiant
#> 246                                                                                                                                                                                   Prélèvement élémentaire
#> 247                                                                                                                                                                                  Espèce de poisson du lot
#> 248                                                                                                                                                                                               Type du lot
#> 249                                                                                                                                                            Longueur des spécimens taille minimale (en mm)
#> 250                                                                                                                                                            Longueur des spécimens taille maximale (en mm)
#> 251                                                                                                                                                                                        Numéro du lot Wama
#> 252                                                                                                                                                                                Poids du lot (saisi, en g)
#> 253                                                                                                                                                                              Poids du lot (calculé, en g)
#> 254                                                                                                                                                                             Méthode d'estimation du poids
#> 255                                                                                                                                                                                           Effectif du lot
#> 256                                                                                                                                                                      Type de longueur (Fourche ou Totale)
#> 257                                                                                                                                                                                               Identifiant
#> 258                                                                                                                                                                                         Numéro du passage
#> 259                                                                                                                                                                                               Identifiant
#> 260                                                                                                                                                                                     Numéro de l'opération
#> 261                                                                                                                                   Type du prélèvement élémentaire : Ambiance, Groupe de points ou Passage
#> 262                                                                                                                                                                          Durée du prélèvement élémentaire
#> 263                                                                                                                                                                                               Identifiant
#> 264                                                                                                                                                                                               Code Sandre
#> 265                                                                                                                                                                                           Code alternatif
#> 266                                                                                                                                                                                     Nom commun du poisson
#> 267                                                                                                                                                                                      Nom latin du poisson
#> 268                                                                                                                                                                             Taille maximale pour l'espèce
#> 269                                                                                                                                                                                         Ordre d'affichage
#> 270                                                                                                                                                                                        Statut de l'espèce
#> 271                                                                                                                                                                                         code service SEEE
#> 272                                                                                                                                                                      Espèce invotoriée pour le calcul IPR
#> 273                                                                                                                                                                 Espèce invotoriée pour le calcul IPR Plus
#> 274                                                                                                                                                                                      Code TAXREF - CD_NOM
#> 275                                                                                                                                                                                               Identifiant
#> 276                                                                                                                                                                                                   Libellé
#> 277                                                                                                                                                                                         Ordre d'affichage
#> 278                                                                                                                                                                                 Code formation géologique
#> 279                                                                                                                                                                                               Identifiant
#> 280                                                                                                                                                                                                   Libellé
#> 281                                                                                                                                                                                         Ordre d'affichage
#> 282                                                                                                                                                                               Code du régime hydrologique
#> 283                                                                                                                                                                                               Identifiant
#> 284                                                                                                                                                                                     Numéro de l'opération
#> 285                                                                                                                                                                                            Type de faciès
#> 286                                                                                                                                                                        Importance relative du faciès en %
#> 287                                                                                                                                                                       Profondeur moyenne du faciès (en m)
#> 288                                                                                                                                                                         Granulométrie dominante du faciès
#> 289                                                                                                                                                                        Granulométrie accessoire du faciès
#> 290                                                                                                                                                                                         Type de colmatage
#> 291                                                                                                                                                                                      Végétation dominante
#> 292                                                                                                                                                             Pourcentage de recouvrement par la végétation
#> 293                                                                                                                                                                                               Identifiant
#> 294                                                                                                                                                                                                 Sinuosité
#> 295                                                                                                                                                                                         Ombrage (rivière)
#> 296                                                                                                                                                                                            Trous / Fosses
#> 297                                                                                                                                                                                               Sous-berges
#> 298                                                                                                                                                                                             Abris rocheux
#> 299                                                                                                                                                                                        Embâcles / souches
#> 300                                                                                                                                                                                    Abri végétal aquatique
#> 301                                                                                                                                                                                     Végétation de bordure
#> 302                                                                                                                                                                                      Végétation aquatique
#> 303                                                                                                                                                                                               Identifiant
#> 304                                                                                                                                                                                 Diversité des écoulements
#> 305                                                                                                                                                                                      Ripisylve équilibrée
#> 306                                                                                                                                                                                               % plat lent
#> 307                                                                                                                                                                                            % plat courant
#> 308                                                                                                                                                                                                 % courant
#> 309                                                                                                                                                                                            Trous / Fosses
#> 310                                                                                                                                                                                               Sous-berges
#> 311                                                                                                                                                                                             Abris rocheux
#> 312                                                                                                                                                                                        embacles / souches
#> 313                                                                                                                                                                                      Végétation aquatique
#> 314                                                                                                                                                                                     Végétation de bordure
#> 315                                                                                                                                                                       Identifiant de végétation dominante
#> 316                                                                                                                                                                                                   Racines
#> 317                                                                                                                                                                                               Identifiant
#> 318                                                                                                                                                                              Point de prélèvement associé
#> 319                                                                                                                                                                                           Donnée modifiée
#> 320                                                                                                                                                                                           Ancienne valeur
#> 321                                                                                                                                                                                           Nouvelle valeur
#> 322                                                                                                                                                                                      Date de modification
#> 323                                                                                                                                                               Etablissement ayant realise la modification
#> 324                                                                                                                                                                                               Identifiant
#> 325                                                                                                                                                                                            Lot du poisson
#> 326                                                                                                                                                                                           Sexe du poisson
#> 327                                                                                                                                                                                 Taille du poisson (en mm)
#> 328 Poids du poisson (saisi, en g). La présence d'une valeur dans mei_poids pour un lot de type N est héritée de WAMA et conservée à titre informatif, après recopie dans le champ lop_poids de lot_poissons.
#> 329                                                                                                                                                                          Poids du poisson (calculé, en g)
#> 330                                                                                                                                                                             Méthode d'estimation du poids
#> 331                                                                                                                                                                                            Age du poisson
#> 332                                                                                                                                                       Mesure réelle ou déterminée par dégroupage d'un lot
#> 333                                                                                                                                                                      Type de longueur (Fourche ou Totale)
#> 334                                                                                                                                                                                     Numéro de l'opération
#> 335                                                                                                                                                                                  Identifiant de la classe
#> 336                                                                                                                                                                                                         g
#> 337                                                                                                                                                                                                         a
#> 338                                                                                                                                                                                                         v
#> 339                                                                                                                                                                                                        t1
#> 340                                                                                                                                                                                                        t2
#> 341                                                                                                                                                                                                  Effectif
#> 342                                                                                                                                          Valeur de la métrique NER (nombre d'espèces rhéophiles) observée
#> 343                                                                                                                                         Valeur de la métrique NEL (nombre d'espèces lithophiles) observée
#> 344                                                                                                                                                Valeur de la métrique NTE (nombre total d'espèces) observé
#> 345                                                                                                                                         Valeur de la métrique DIT (densité d'individus tolérants) observé
#> 346                                                                                                                                         Valeur de la métrique DIO (densité d'individus omnivores) observé
#> 347                                                                                                                                     Valeur de la métrique DII (densité d'individus invertivores) observée
#> 348                                                                                                                                            Valeur de la métrique DTI (densité totale d'individus) observé
#> 349                                                                                                                                         Valeur de la métrique NER (nombre d'espèces rhéophiles) théorique
#> 350                                                                                                                                        Valeur de la métrique NEL (nombre d'espèces lithophiles) théorique
#> 351                                                                                                                                              Valeur de la métrique NTE (nombre total d'espèces) théorique
#> 352                                                                                                                                       Valeur de la métrique DIT (densité d'individus tolérants) théorique
#> 353                                                                                                                                       Valeur de la métrique DIO (densité d'individus omnivores) théorique
#> 354                                                                                                                                    Valeur de la métrique DII (densité d'individus invertivores) théorique
#> 355                                                                                                                                          Valeur de la métrique DTI (densité totale d'individus) théorique
#> 356                                                                                                                                                   Valeur de la métrique NER (nombre d'espèces rhéophiles)
#> 357                                                                                                                                                  Valeur de la métrique NEL (nombre d'espèces lithophiles)
#> 358                                                                                                                                                        Valeur de la métrique NTE (nombre total d'espèces)
#> 359                                                                                                                                                 Valeur de la métrique DIT (densité d'individus tolérants)
#> 360                                                                                                                                                 Valeur de la métrique DIO (densité d'individus omnivores)
#> 361                                                                                                                                              Valeur de la métrique DII (densité d'individus invertivores)
#> 362                                                                                                                                                    Valeur de la métrique DTI (densité totale d'individus)
#> 363                                                                                                                                                                                                  Note IPR
#> 364                                                                                                                                                                            Date d'exécution du calcul IPR
#> 365                                                                                                                                                                           Version utilisée pour le calcul
#> 366                                                                                                                    Altitude de la station de pêche. Le champ est obligatoire et de type numérique positif
#> 367                                                                                                                           Surface prospectée en m2. Le champ est obligatoire et de type numérique positif
#> 368                                                                                                         Superficie du bassin versant drainé en km2. Le champ est obligatoire et de type numérique positif
#> 369                                                                                                                         Distance à la source en km. Le champ est obligatoire et de type numérique positif
#> 370                                                                                                                    Largeur moyenne en eau en mètre. Le champ est obligatoire et de type numérique positif
#> 371                                                                                                                           Pente du cours d’eau en . Le champ est obligatoire et de type numérique positif
#> 372                                                                                                                        Profondeur moyenne en mètre. Le champ est obligatoire et de type numérique positif
#> 373                                                                                         Température moyenne interannuelle de l’air à la station en juillet. Le champ est obligatoire et de type numérique
#> 374                                                                                         Température moyenne interannuelle de l’air à la station en janvier. Le champ est obligatoire et de type numérique
#> 375                             Unité hydrographique selon la nomenclature sandre 694. Le champ est obligatoire. Seuls les codes des éléments de la nomenclature et H9 correspondant à la Corse sont acceptés
#> 376                                                                                                                                                                                     Numéro de l'opération
#> 377                                                                                                                                                                                              Zone de Huet
#> 378                                                                                                                                                                                                     Evapo
#> 379                                                                                                                                                                                                   Run off
#> 380                                                                                                                                                                                                     Débit
#> 381                                                                                                                                                                                                 Puissance
#> 382                                                                                                                                                                                                  Effectif
#> 383                                                                                                                                                                                                Taux de 0+
#> 384                                                                                                                                                                                          Seuil taux de 0+
#> 385                                                                                                                                                                                                  Ric util
#> 386                                                                                                                                 Métrique de richesse de tolérance à la qualité générale de l'eau observée
#> 387                                                                                                                         Métrique de richesse de tolérance à de faibles variations de température observée
#> 388                                                                                                                     Métrique de richesse de lieux de ponte préférentiellement en eaux stagnantes observée
#> 389                                                                                                                                           Métrique de richesse de régime alimentaire généraliste observée
#> 390                                                                                                                               Métrique de richesse d'intolérance à la qualité générale de l''eau observée
#> 391                                                                                                                         Métrique de richesse d'intolérance à de basses concentrations en oxygène observée
#> 392                                                                                                           Métrique de richesse du lieu de vie préférentiellement en eaux calmes voire stagnantes observée
#> 393                                                                                                                        Métrique d'abondance d''intolérance à de basses concentrations en oxygène observée
#> 394                                                                                                                               Métrique d'abondance d''intolérance à la dégradation de l''habitat observée
#> 395                                                                                                                       Métrique d'abondance de lieu de ponte préférentiellement en eaux courantes observée
#> 396                                                                                                                                         Métrique d'abondance en juvéniles de truites de l''année observée
#> 397                                                                                                                                Métrique de richesse de tolérance à la qualité générale de l'eau théorique
#> 398                                                                                                                        Métrique de richesse de tolérance à de faibles variations de température théorique
#> 399                                                                                                                    Métrique de richesse de lieux de ponte préférentiellement en eaux stagnantes théorique
#> 400                                                                                                                                          Métrique de richesse de régime alimentaire généraliste théorique
#> 401                                                                                                                              Métrique de richesse d'intolérance à la qualité générale de l''eau théorique
#> 402                                                                                                                        Métrique de richesse d'intolérance à de basses concentrations en oxygène théorique
#> 403                                                                                                          Métrique de richesse du lieu de vie préférentiellement en eaux calmes voire stagnantes théorique
#> 404                                                                                                                       Métrique d'abondance d''intolérance à de basses concentrations en oxygène théorique
#> 405                                                                                                                              Métrique d'abondance d''intolérance à la dégradation de l''habitat théorique
#> 406                                                                                                                      Métrique d'abondance de lieu de ponte préférentiellement en eaux courantes théorique
#> 407                                                                                                                                        Métrique d'abondance en juvéniles de truites de l''année théorique
#> 408                                                                                                                                          Métrique de richesse de tolérance à la qualité générale de l'eau
#> 409                                                                                                                                  Métrique de richesse de tolérance à de faibles variations de température
#> 410                                                                                                                              Métrique de richesse de lieux de ponte préférentiellement en eaux stagnantes
#> 411                                                                                                                                                    Métrique de richesse de régime alimentaire généraliste
#> 412                                                                                                                                        Métrique de richesse d'intolérance à la qualité générale de l''eau
#> 413                                                                                                                                  Métrique de richesse d'intolérance à de basses concentrations en oxygène
#> 414                                                                                                                    Métrique de richesse du lieu de vie préférentiellement en eaux calmes voire stagnantes
#> 415                                                                                                                                 Métrique d'abondance d''intolérance à de basses concentrations en oxygène
#> 416                                                                                                                                        Métrique d'abondance d''intolérance à la dégradation de l''habitat
#> 417                                                                                                                                Métrique d'abondance de lieu de ponte préférentiellement en eaux courantes
#> 418                                                                                                                                                  Métrique d'abondance en juvéniles de truites de l''année
#> 419                                                                                                                                                                                    Résultat d'indice IPR+
#> 420                                                                                                                                                                                  Identifiant de la classe
#> 421                                                                                                                                                                                Date d'éxecution du calcul
#> 422                                                                                                                                                                           Version utilisée pour le calcul
#> 423                                                                     Typologie des régimes hydrologiques. Le champ est obligatoire et seules les modalités reg_ng,reg_pn, reg_pm, et reg_pf sont acceptées
#> 424                                                                                                         Superficie du bassin versant drainé en km2. Le champ est obligatoire et de type numérique positif
#> 425                 Grand type de formation géologique dominante sur le bassin versant amont. Le champ est obligatoire et seules les modalités c et s sont acceptées respectivement pour calcaire et siliceux
#> 426                                                                                                                    Largeur moyenne en eau en mètre. Le champ est obligatoire et de type numérique positif
#> 427                                                                                                                 Pente du cours d’eau en pour mille. Le champ est obligatoire et de type numérique positif
#> 428                                                                      Stratégie d’échantillonnage. Le champ est obligatoire et seules les modalités COMP pour les pêches complètes ou AUTRE sont acceptées
#> 429                                                          Unité hydrographique selon la nomenclature sandre 694. Le champ est obligatoire et seuls les codes des éléments de la nomenclature sont acceptés
#> 430                       Température moyenne interannuelle en degrés Celsius (période des 9 années précédant le prélèvement) de l’air du bassin versant amont. Le champ est obligatoire et de type numérique
#> 431                                       Précipitation moyenne interannuelle en mm (période des 9 années précédant le prélèvement)sur le bassin versant amont. Le champ est obligatoire et de type numérique
#> 432                        Amplitude thermique interannuelle maximale en degrés Celsius (période des 9 années précédant le prélèvement) de l’air de la station. Le champ est obligatoire et de type numérique
#> 433                                         Température moyenne interannuelle de l’année (période des 9 années précédant le prélèvement) de l’air à la station. Le champ est obligatoire et de type numérique
#> 434                                                                                                                                                                                     Numéro de l'opération
#> 435                                                                                                                                                                                                  Objectif
#> 436                                                                                                                                                                              ID de log de la modification
#> 437                                                                                                                                                                                     Numéro de l'opération
#> 438                                                                                                                                                                                   Date de la modification
#> 439                                                                                                                                                                Utilisateur responsable de la modification
#> 440                                                                                                                                                                Intervenant responsable de la modification
#> 441                                                                                                                                                                      Etat d'avancement après modification
#> 442                                                                                                                                                                Niveau de qualification après modification
#> 443                                                                                                                                          Intervenant opérateur de pêche de l'opération après modification
#> 444                                                                                                                                               Intervenant commanditaire de l'opération après modification
#> 445                                                                                                                                            Intervenant expert technique de l'opération après modification
#> 446                                                                                                                                                      Libellé de la modification effectuée sur l'opération
#> 447                                                                                                                                                                                                       Lot
#> 448                                                                                                                                                                                        Type de pathologie
#> 449                                                                                                                                                                                         Fraction analysée
#> 450                                                                                                                                                                                                Importance
#> 451                                                                                                                                                                                                   Poisson
#> 452                                                                                                                                                                                        Type de pathologie
#> 453                                                                                                                                                                                         Fraction analysée
#> 454                                                                                                                                                                               Importance de la pathologie
#> 455                                                                                                                                                                                               Identifiant
#> 456                                                                                                                                                                              Point de prélèvement associé
#> 457                                                                                                                                                                                       Type d'illustration
#> 458                                                                                                                                                                                            Nom du fichier
#> 459                                                                                                                                                                                      Type MIME du fichier
#> 460                                                                                                                                                                               Taille du fichier en octets
#> 461                                                                                                                                                       Image principale du point utilisée dans les exports
#> 462                                                                                                                                                                       Utilisateur ayant ajouté le fichier
#> 463                                                                                                                                                                                   Date d'ajout du fichier
#> 464                                                                                                                                                             Numéro de l'opération (identifiant de l''IPR)
#> 465                                                                                                                                                                                   Identifiant de l'espèce
#> 466                                                                                                                                              Valeur de probabilité de présence de l'espèce (entre 0 et 1)
#> 467                                                                                                                                      Nombre de poissons du taxon transmis au SEEE pour le calcul de l'IPR
#> 468                                                                                                                                                                  Numéro de l'opération (identifiant IPR+)
#> 469                                                                                                                                                                                   Identifiant de l'espèce
#> 470                                                                                                                                              Valeur de probabilité de présence de l'espèce (entre 0 et 1)
#> 471                                                                                                                                                                                                    Profil
#> 472                                                                                                                                                                                                     Droit
#> 473                                                                                                                                                                                               Identifiant
#> 474                                                                                                                                                                                                   Libellé
#> 475                                                                                                                                                                                         Ordre d'affichage
#> 476                                                                                                                                                                                               Identifiant
#> 477                                                                                                                                                                                          Code de l’agence
#> 478                                                                                                                                                                                       Libellé de l’agence
#> 479                                                                                                                                                                                               Identifiant
#> 480                                                                                                                                                                                            Libelle Sandre
#> 481                                                                                                                                                                                         Ordre d'affichage
#> 482                                                                                                                                                                                               Code Sandre
#> 483                                                                                                                                                                                               Identifiant
#> 484                                                                                                                                                                                                   Libellé
#> 485                                                                                                                                                                                         Ordre d'affichage
#> 486                                                                                                                                                                                               Identifiant
#> 487                                                                                                                                                                                            Libelle Sandre
#> 488                                                                                                                                                                                         Ordre d'affichage
#> 489                                                                                                                                                                                               Code Sandre
#> 490                                                                                                                                                                                               Identifiant
#> 491                                                                                                                                                                                                   Libellé
#> 492                                                                                                                                                                                               Code Sandre
#> 493                                                                                                                                                                                            Libelle Sandre
#> 494                                                                                                                                                                                         Ordre d'affichage
#> 495                                                                                                                                                                                               Identifiant
#> 496                                                                                                                                                                                                      Code
#> 497                                                                                                                                                                                                   Libellé
#> 498                                                                                                                                                                                         Ordre d'affichage
#> 499                                                                                                                                                                                               Identifiant
#> 500                                                                                                                                                                                            Libellé Sandre
#> 501                                                                                                                                                                                               Code Sandre
#> 502                                                                                                                                                                                         Ordre d'affichage
#> 503                                                                                                                     Flag permettant de savoir si l'entité hydrographique est à l''état "Validé" ou "Gelé"
#> 504                                                                                                                                                                                               Identifiant
#> 505                                                                                                                                                                                                   Libellé
#> 506                                                                                                                                                                                         Ordre d'affichage
#> 507                                                                                                                                                                                               Identifiant
#> 508                                                                                                                                                                                                   Libellé
#> 509                                                                                                                                                                                         Ordre d'affichage
#> 510                                                                                                                                                                           Statut du fabricant de matériel
#> 511                                                                                                                                                                                               Identifiant
#> 512                                                                                                                                                                                                   Libellé
#> 513                                                                                                                                                                                         Ordre d'affichage
#> 514                                                                                                                                                                                               Code Sandre
#> 515                                                                                                                                                                                            Libelle Sandre
#> 516                                                                                                                                                                                               Identifiant
#> 517                                                                                                                                                                                                 Code Wama
#> 518                                                                                                                                                                                                   Libellé
#> 519                                                                                                                                                                                         Ordre d'affichage
#> 520                                                                                                                                                                                               Identifiant
#> 521                                                                                                                                                                                               Code Sandre
#> 522                                                                                                                                                                                            Libellé Sandre
#> 523                                                                                                                                                                                                   Libellé
#> 524                                                                                                                                                                                         Ordre d'affichage
#> 525                                                                                                                                                                          Code de l’ancien fra_code_sandre
#> 526                                                                                                                                                                                               Identifiant
#> 527                                                                                                                                                                                                   Libellé
#> 528                                                                                                                                                                                         Ordre d'affichage
#> 529                                                                                                                                                                                               Code Sandre
#> 530                                                                                                                                                                                            Libellé Sandre
#> 531                                                                                                                                                                                               Identifiant
#> 532                                                                                                                                                                                                   Libellé
#> 533                                                                                                                                                                                         Ordre d'affichage
#> 534                                                                                                                                                                                               Identifiant
#> 535                                                                                                                                                                                               Code Sandre
#> 536                                                                                                                                                                                            Libellé Sandre
#> 537                                                                                                                                                                                         Ordre d'affichage
#> 538                                                                                                 Booléen permettant de savoir s'il faut afficher ou pas l''intervenant dans les combobox de l''application
#> 539                                                                                                                               Flag permettant de savoir si l'intervenant est à l''état "Validé" ou "Gelé"
#> 540                                                                                                                                                                             Libellé intervenant dans Aspe
#> 541                                                                                                                                                                                               Identifiant
#> 542                                                                                                                                                                                                   Libellé
#> 543                                                                                                                                                                                         Ordre d'affichage
#> 544                                                                                                                                                                                               Identifiant
#> 545                                                                                                                                                                                                   Libellé
#> 546                                                                                                                                                                                         Ordre d'affichage
#> 547                                                                                                                                                                                               Identifiant
#> 548                                                                                                                                                                                                   Libellé
#> 549                                                                                                                                                                                         Ordre d'affichage
#> 550                                                                                                                                                                                               Identifiant
#> 551                                                                                                                                                                                                   Libellé
#> 552                                                                                                                                                                                         Ordre d'affichage
#> 553                                                                                                                                                                                               Identifiant
#> 554                                                                                                                                                                                                   Libellé
#> 555                                                                                                                                                                                         Ordre d'affichage
#> 556                                                                                                                                                                                               Identifiant
#> 557                                                                                                                                                                                     Fabricant du matériel
#> 558                                                                                                                                                                                                   Libellé
#> 559                                                                                                                                                                                         Ordre d'affichage
#> 560                                                                                                                                                                              Statut du modèle de matériel
#> 561                                                                                                                                                                                               Identifiant
#> 562                                                                                                                                                                                                   Libellé
#> 563                                                                                                                                                                                         Ordre d'affichage
#> 564                                                                                                                                                                                               Identifiant
#> 565                                                                                                                                                                                                   Libellé
#> 566                                                                                                                                                                                         Ordre d'affichage
#> 567                                                                                                                                                                                               Code Sandre
#> 568                                                                                                                                                                                            Libellé Sandre
#> 569                                                                                                                                                                                               Identifiant
#> 570                                                                                                                                                                     Méta-réseau représenté par l'objectif
#> 571                                                                                                                                                                                                   Libellé
#> 572                                                                                                                                                                                         Ordre d'affichage
#> 573                                                                                                                                 Flag permettant de caractériser la nécessité de calculer l'indicateur IPR
#> 574                                                                                                                                                                                               Identifiant
#> 575                                                                                                                                                                                                   Libellé
#> 576                                                                                                                                                                                         Ordre d'affichage
#> 577                                                                                                                                                                                               Code Sandre
#> 578                                                                                                                                                                                            Libellé Sandre
#> 579                                                                                                                                                                                               Identifiant
#> 580                                                                                                                                                                                                   Libellé
#> 581                                                                                                                                                                                               Code Sandre
#> 582                                                                                                                                                                                            Libelle Sandre
#> 583                                                                                                                                                                                         Ordre d'affichage
#> 584                                                                                                                                                                                               Identifiant
#> 585                                                                                                                                                                                               Code Sandre
#> 586                                                                                                                                                                                            Libellé Sandre
#> 587                                                                                                                                                                                                   Libellé
#> 588                                                                                                                                                                                         Ordre d'affichage
#> 589                                                                                                                                                                                               Identifiant
#> 590                                                                                                                                                                                                   Libellé
#> 591                                                                                                                                                                                         Ordre d'affichage
#> 592                                                                                                                                                                                               Code Sandre
#> 593                                                                                                                                                                                            Libellé Sandre
#> 594                                                                                                                                                                                               Identifiant
#> 595                                                                                                                                                                                               Code Sandre
#> 596                                                                                                                                                                                            Libelle Sandre
#> 597                                                                                                                                                                                         Ordre d'affichage
#> 598                                                                                                                                                                                               Identifiant
#> 599                                                                                                                                                                                                   Libellé
#> 600                                                                                                                                                                                         Ordre d'affichage
#> 601                                                                                                                                                                                               Identifiant
#> 602                                                                                                                                                                                                  Acronyme
#> 603                                                                                                                                                                                                   Libellé
#> 604                                                                                                                                                                                         Ordre d'affichage
#> 605                                                                                                                                                    Identifiant de l'espèce pour les protocole mono-espèce
#> 606                                                                                                                                                                                               Identifiant
#> 607                                                                                                                                                                                                   Libellé
#> 608                                                                                                                                                                                         Ordre d'affichage
#> 609                                                                                                                                                                                               Identifiant
#> 610                                                                                                                                                                                                   Libellé
#> 611                                                                                                                                                                                         Ordre d'affichage
#> 612                                                                                                                                                                                               Identifiant
#> 613                                                                                                                                                                                                   Libellé
#> 614                                                                                                                                                                                         Ordre d'affichage
#> 615                                                                                                                                                                                               Identifiant
#> 616                                                                                                                                                                                                   Libellé
#> 617                                                                                                                                                                                         Ordre d'affichage
#> 618                                                                                                                                                                                               Identifiant
#> 619                                                                                                                                                                                               Code Sandre
#> 620                                                                                                                                                                                            Libellé Sandre
#> 621                                                                                                                                                                                         Ordre d'affichage
#> 622                                                                                                                                                                                               Identifiant
#> 623                                                                                                                                                                                                   Libellé
#> 624                                                                                                                                                                                         Ordre d'affichage
#> 625                                                                                                                                                                                               Code Sandre
#> 626                                                                                                                                                                                            Libellé Sandre
#> 627                                                                                                                                                                                               Identifiant
#> 628                                                                                                                                                                                                   Libellé
#> 629                                                                                                                                                                                               Code Sandre
#> 630                                                                                                                                                                                            Libelle Sandre
#> 631                                                                                                                                                                                         Ordre d'affichage
#> 632                                                                                                                                                                                               Identifiant
#> 633                                                                                                                                                                                                   Libellé
#> 634                                                                                                                                                                                         Ordre d'affichage
#> 635                                                                                                                                                                                               Identifiant
#> 636                                                                                                                                                                                            Libellé Sandre
#> 637                                                                                                                                                                                         Ordre d'affichage
#> 638                                                                                                                                                                                               Code Sandre
#> 639                                                                                                                                                                                               Identifiant
#> 640                                                                                                                                                                                                   Libellé
#> 641                                                                                                                                                                                         Ordre d'affichage
#> 642                                                                                                                                                                                               Identifiant
#> 643                                                                                                                                                                                                   Libellé
#> 644                                                                                                                                                                                         Ordre d'affichage
#> 645                                                                                                                                                                                               Code Sandre
#> 646                                                                                                                                                                                            Libellé Sandre
#> 647                                                                                                                                                                                               Identifiant
#> 648                                                                                                                                                                                                   Libellé
#> 649                                                                                                                                                                                         Ordre d'affichage
#> 650                                                                                                                                                                                               Code Sandre
#> 651                                                                                                                                                                                            Libellé Sandre
#> 652                                                                                                                                                                                               Identifiant
#> 653                                                                                                                                                                                                   Libellé
#> 654                                                                                                                                                                                         Ordre d'affichage
#> 655                                                                                                                                                                                               Identifiant
#> 656                                                                                                                                                                                                   Libellé
#> 657                                                                                                                                                                                         Ordre d'affichage
#> 658                                                                                                                                                                                               Identifiant
#> 659                                                                                                                                                                                                 Code Wama
#> 660                                                                                                                                                                                                   Libellé
#> 661                                                                                                                                                                                         Ordre d'affichage
#> 662                                                                                                                                                                                               Identifiant
#> 663                                                                                                                                                                                                   Libellé
#> 664                                                                                                                                                                                         Ordre d'affichage
#> 665                                                                                                                                                                                               Code Sandre
#> 666                                                                                                                                                                                            Libellé Sandre
#> 667                                                                                                                                                                                               Identifiant
#> 668                                                                                                                                                                                                   Libellé
#> 669                                                                                                                                                                                         Ordre d'affichage
#> 670                                                                                                                                                                                               Identifiant
#> 671                                                                                                                                                                                               Code Sandre
#> 672                                                                                                                                                                                            Libellé Sandre
#> 673                                                                                                                                                                                                   Libellé
#> 674                                                                                                                                                                                         Ordre d'affichage
#> 675                                                                                                                                                                           Code EPSG du type de projection
#> 676                                                                                                                                                                                               Identifiant
#> 677                                                                                                                                                                                                   Libellé
#> 678                                                                                                                                                                                         Ordre d'affichage
#> 679                                                                                                                                                                                               Identifiant
#> 680                                                                                                                                                                                                   Libellé
#> 681                                                                                                                                                                                         Ordre d'affichage
#> 682                                                                                                                                                                                               Identifiant
#> 683                                                                                                                                                                                                   Libellé
#> 684                                                                                                                                                                                         Ordre d'affichage
#> 685                                                                                                                                                                                   Code INSEE de la région
#> 686                                                                                                                                                                                      Libellé de la région
#> 687                                                                                                                                                                                         Ordre d'affichage
#> 688                                                                                                                                                                                               Identifiant
#> 689                                                                                                                                                                                 Structure de rattachement
#> 690                                                                                                                                                                                                       Nom
#> 691                                                                                                                                                                                                    Prénom
#> 692                                                                                                                                                                                                    E-mail
#> 693                                                                                                                                                                                           Actif / Inactif
#> 694                                                                                                                                                                             Identifiant de la table Droit
#> 695                                                                                                                                                                       Identifiant de la table Utilisateur
#> 696                                                                                                                                       Identifiant unique du traitement. Récupérée depuis trace traitement
#> 697                                                                                                                                    Numéro de poste de la base WAMA. Récupéré depuis trace_traitement_base
#> 698                                                                                                                                                                           Identifiant WAMA de l’opération
#> 699                                                                                                                                           Nom de la table de WAMA contenant le champ responsable du rejet
#> 700                                                                                                                                                                    Nom de la colonne responsable du rejet
#> 701                                                                                                                                 Code de la règle de gestion ou de qualité de données responsable du rejet
#> 702                                                                                                                                                                                  Raison du rejet en clair
#> 703                                                                                                                                                                               Valeur ayant causé le rejet
#> 704                                                                                                                                                                          Identifiant unique du traitement
#> 705                                                                                                                                                                      Date et heure de début du traitement
#> 706                                                                                                                                                                        Date et heure de fin du traitement
#> 707                                                                                                                                                  Login Windows de l'itilisateur ayant lancé le traitement
#> 708                                                                                                                                                                Résultat du traitement (réussite ou échec)
#> 709                                                                                                                                                          Raison de l’échec. Reste vide en cas de réussite
#> 710                                                                                                                                       Identifiant unique du traitement. Récupérée depuis trace traitement
#> 711                                                                                                   Numéro de poste de la base de données. Récupéré depuis la clonne poste WAMA de la table wama_parametres
#> 712                                                                                                                  base_nom"'Nom de la base récupéré depuis la colonne nom_base de la table wama_parametres
#> 713                                                                                                                                                           Date et heure de début du traitement de la base
#> 714                                                                                                                                                             Date et heure de fin du traitement de la base
#> 715                                                                                                                                                                Résultat du traitement (réussite ou échec)
#> 716                                                                                                                                                          Raison de l’échec. Reste vide en cas de réussite
#> 717                                                                                                                                                   Nombre d’opérations dans la base en début de traitement
#> 718                                                                                                                                                                   Nombre d’opérations intégrées dans ASPE
#> 719                                                                                                                                                                              Nombre d’opérations rejetées
#> 720                                          Correspond au contenu de la colonne fm_code de la table Famille dans WAMA. Ce code correspond aux deux derniers caractères du nom de colonne des attributs libXX
#> 721                                                                                                                             Correspond au contenu de la colonne li_id_famille de la table libelle de WAMA
#> 722                                                                                                                                  Correspond au contenu de la colonne li_code de la table libelle de WAMA.
#> 723                                                                                                                                Correspond au contenu de la colonne id_libelle de la table libelle de WAMA
#> 724                                                                                                                                    Correspond au contenu de la colonne li_nom de la table libelle de WAMA
#> 725                                                                                                                                               Contient le nom de la table de référence ASPE corespondante
#> 726                                                                                                       Correspond au contenu de la colonne de clé primaire de la table indiquée dans la colonne précédente
#> 727                                                                                                                       Correspond au contenu de la colonne de libelle de la table indiquée dans Table ASPE
#> 728                                                                                                                       Correspond au contenu de la colonne id_listema de la table ListeMateriel dans WAMA.
#> 729                                                                                                                             Correspond au contenu de la colonne lm_nom de la table ListeMateriel de WAMA.
#> 730                                                                                                                            Correspond au contenu de la colonne lm_code de la table ListeMateriel de WAMA.
#> 731                                                                                                                         Correspond au contenu de la colonne lm_typemat de la table ListeMateriel de WAMA.
#> 732                                                                                                                                                                Indique quelle table correspond dans ASPE.
#> 733                                                                                 Correspond à la colonne mom_id de la table ref_modele_materiel ou à la colonne fam_id de la table ref_fabricant_materiel.
#> 734                                                                                                                           Correspond au contenu de la colonne mom_fam_id de la tavle_ref_modele_materiel.
#> 735                                                           Correspond au contenu de la colonne mom_libelle de la table ref_modele materiel ou à la colonne fam_libelle de la table ref_fabricant_materiel.
#> 736                                                              Nom convivial de la base de données. Le contenu de cette colonne apparaitra dans les fichiers journaux et les fichiers de rejets et d’erreur
#> 737                                                                                                         Nom du fichier physique de la base de données. Il est utilisé pour établir la chaine de connexion
#> 738                                               Nom du répertoire du système de fichier Windows dans lequel est stocké le fichier de la base de données. Il est utilisé pour établir la chaine de connexion
#> 739                                                                                                             Vrai pour que la base soit intégrée, faux pour que cette table soit ignorée par le traitement
#> 740                                                                                                                           Le numéro de poste WAMA. Cette donnée est intégrée dans la base de données ASPE
#> 741                                                               Code de l’opérateur de pêche. Cette donnée est intégrée dans la base de données ASPE. Elle doit être un code intervenant valable dans ASPE.
#> 742                                                                                      Booléen determinant si l'on doit nettoyer l''ensemble de la base de donnée cible ASPE avant chaque reprise de donnée
```
