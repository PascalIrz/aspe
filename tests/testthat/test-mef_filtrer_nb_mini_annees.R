test_that("mef_filtrer_nb_mini_annees works", {

  passerelle <- mef_creer_passerelle() %>%
    mef_ajouter_ope_date() %>%
    select(pop_id, annee) %>%
    distinct()

  object <- passerelle %>%
    mef_filtrer_nb_mini_annees(nb_mini_annees = 5,
                               var_id = "pop_id")

  # the output df has same less rows than the initial df
  testthat::expect_gt(nrow(passerelle),
                      nrow(object))

})
