test_that("mef_creer_passerelle works", {

  misc_charger_donnees_test()

  passerelle <- mef_creer_passerelle()

  testthat::expect_identical(names(passerelle),
                             c("sta_id", "pop_id", "ope_id", "pre_id", "lop_id"))
})
