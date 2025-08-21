test_that("mef_ajouter_ipr works", {

  passerelle <- mef_creer_passerelle()

  object <- passerelle %>%
    mef_ajouter_ipr()

  # the output df has same nb of rows but more variables than the initial df
  testthat::expect_contains(names(object),
                            "ipr")

  testthat::expect_gt(length(object),
                      length(passerelle))
})
