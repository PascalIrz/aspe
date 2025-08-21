test_that("mef_ajouter_libelle_site works", {
  passerelle <- mef_creer_passerelle() %>%
    select(1:2) %>%
    distinct()

  object <- passerelle %>%
    mef_ajouter_libelle_site()

  testthat::expect_gt(length(object),
                      length(passerelle))
})
