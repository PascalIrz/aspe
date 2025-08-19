test_that("mef_ajouter_abs works", {

  my_opes <- operation %>%
    slice(1:5) %>%
    pull(ope_id)

  data <- mef_creer_passerelle() %>%
    filter(ope_id %in% my_opes) %>%
    mef_ajouter_lots() %>%
    mef_ajouter_ope_date() %>%
    group_by(ope_id, esp_code_alternatif, annee) %>%
    summarise(lop_effectif = sum(lop_effectif, na.rm = TRUE), .groups = 'drop')

  out <- data %>%
    mef_ajouter_abs(var_id = ope_id,
                    var_taxon = esp_code_alternatif,
                    var_effectif = lop_effectif)

  expect_gt(nrow(out), nrow(data))


})
