test_that("mef_colo_ext_pops works", {

  passerelle <- mef_creer_passerelle()

  object <- passerelle %>%
    mef_ajouter_lots() %>%
    mef_ajouter_ope_date() %>%
    mef_ajouter_libelle() %>%
    mef_ajouter_type_protocole() %>%
    group_by(annee,
             esp_code_alternatif,
             pop_id,
             pop_libelle,
             pro_libelle) %>%
    summarise(lop_effectif = sum(lop_effectif, na.rm = TRUE)) %>%
    ungroup() %>%
    droplevels() %>%
    mef_colo_ext_pops()

  # the output df has same nb of rows but more variables than the initial df
  testthat::expect_contains(names(object),
                            "col_ext")

  testthat::expect_equal(length(object),
                      9)
})
