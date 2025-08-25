test_that("mef_pivoter_var_env works", {

  df <- operation_ipr %>%
    mutate(distance_mer = NA) %>%
                select(ope_id = opi_ope_id,
                       distance_mer,
                       starts_with("opi_param")) %>%
    rename(temp_janvier = opi_param_tjanvier) %>%
    select(-opi_param_bassin) %>%
    mef_pivoter_var_env()

  # the output df has same less rows than the initial df
  testthat::expect_contains(names(df),
                      "valeur_parametre")
})
