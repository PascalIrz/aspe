test_that("mef_ajouter_lots works", {

  # misc_charger_donnees_test()

  passerelle <- mef_creer_passerelle()

  passerelle2 <- passerelle %>%
    mef_ajouter_lots()

  object <- setdiff(names(passerelle2),
                    names(passerelle))

  testthat::expect_identical(object,
                             c("tyl_id", "tlo_id", "lop_effectif", "esp_code_alternatif"))
})
