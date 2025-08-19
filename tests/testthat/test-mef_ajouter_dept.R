test_that(desc = "mef_ajouter_dept works", {
  df_init <- mef_creer_passerelle() %>%
    slice(1)

  df_final <- df_init %>%
    mef_ajouter_dept()

  expect_equal(1 + length(df_init), length(df_final))
  expect_equal(c(names(df_init), "dept"), names(df_final))
})

