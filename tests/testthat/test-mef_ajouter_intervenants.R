test_that("mef_ajouter_intervenants works", {

  passerelle <- mef_creer_passerelle()

  object <- passerelle %>%
    mef_ajouter_intervenants()

  # the output df has same nb of rows but more variables than the initial df
  testthat::expect_contains(names(object),
                            "operateur_peche")

  testthat::expect_gt(length(object),
                      length(passerelle))
})
