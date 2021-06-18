gg_density_env_esp <- function(df, espece, parametres = NA, quantile_max = 0.99,
                               log = c('surface_bv', 'distance_source', 'pente'))

{

  if (is.na(parametres))
  {
    parametres <- df %>%
      pull(parametre) %>%
      unique() %>%
      as.character
  }

  gg_density_env_pres_abs <- function(parametre, df, espece)

  {
    data <- df %>%
      filter(esp_code_alternatif == espece,
             parametre == !!parametre)  # force l'évaluation en premier lieu / synonymie

    x_max <- data %>%
      pull(valeur_parametre) %>%
      quantile(probs = c(quantile_max))

    plot <-
      ggplot(data = data,
             aes(x = valeur_parametre,
                 fill = presence)) +
      geom_density(alpha = 0.3) +
      labs(x = parametre,
           y = "Densité",
           title = espece,
           fill = "") +
      scale_x_continuous(limits = c(NA, x_max)) +
      # scale_fill_discrete(name = "",
      #                     labels = c("Absence", "Présence")) +
      scale_fill_manual(values = c(coul_contrast[1], coul_contrast[2]))

    if(!!parametre %in% log) {
      plot <- plot + scale_x_log10()
    }

    plot


  }



  map(.x = parametres,
      .f = gg_density_env_pres_abs,
      df = df,
      espece = espece)
}
