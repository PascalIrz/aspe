test_that("mef_ajouter_ambiance works", {

  passerelle <- mef_creer_passerelle()

  object <- passerelle %>%
    mef_ajouter_ambiance()

  # the output df has same nb of rows but more variables than the initial df
  testthat::expect_identical(nrow(passerelle),
                             nrow(object))

  testthat::expect_gt(length(object),
                      length(passerelle))

})
