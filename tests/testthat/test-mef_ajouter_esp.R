test_that("mef_ajouter_esp works", {

  passerelle <- mef_creer_passerelle()

  object <- passerelle %>%
    mef_ajouter_lots() %>%
    mef_ajouter_esp()

  # the output df has same nb of rows but more variables than the initial df
  testthat::expect_contains(names(object),
                            "esp_code_alternatif")

  testthat::expect_gt(length(object),
                      length(passerelle))

})
