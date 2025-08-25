test_that("misc_nom_dernier_fichier works", {

  object <- misc_nom_dernier_fichier(repertoire = "data", pattern = ".rda")

  testthat::expect_type(object, "character")

})
