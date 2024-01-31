#'Graphique pour représenter l'évolution des effectifs de taxons au cours du
#'temps
#'
#'La fonction permet de visualiser la dynamique des taxons dans le peuplement
#'sur une station. Les taxons sont représentés par des points, proportionnels
#'aux effectifs capturés. Les protocoles utilisés sont également représentés. La
#'fonction nécessite que le dataframe "ref_espece" de la base ASPE soit chargé.
#'@param df Dataframe contenant les données des effectifs capturés pour les
#'  taxons.  Il doit contenir des variables "effectif" et "annee" ainsi qu'une
#'  variable permettant d'identifier la station ou le point de prélèvement. Il
#'  doit également contenir une variable 'pro_libelle' correspondant aux
#'  protocoles (à ajouter avec la \code{aspe::mef_ajouter_type_protocole()}).
#'@param var_id_sta Nom de la variable servant à identifier les stations ou
#'  points. Cette variable donnera les étiquettes du graphique.
#'@param var_especes Variable indiquant l'espèce ou le code espèce.
#'@param interactif Valeur logique: statique (FALSE) produit avec `ggplot2` ou
#'  interactif (TRUE) produit avec `ggiraph`.
#'@param largeur,hauteur Numériques. Dimensions des graphiques interactifs.
#'@param taxons_ipr Caractère. Indique comment distinguer sur le graphique les
#'  noms des espèces participant à l'IPR. Peut prendre les valeurs "bold",
#'  "italic", "bold.italic", ou par défaut "plain".
#'@param longueur_libelle Numérique. longueur maximale (en nombre de caractères)
#'  du titre du graphique
#'@param ... arguments passés à la fonction \code{ggiraph::opts_sizing()}
#'
#'@return Retourne une liste de graphiques pour les stations ou points,
#'  graphiques statiques `ggplot2` ou interactifs `ggiraph`.
#'@export
#'
#'@importFrom dplyr filter rowwise mutate ungroup pull select
#'@importFrom forcats fct_rev
#'@importFrom ggiraph geom_point_interactive girafe
#'@importFrom ggplot2 ggplot aes labs scale_x_continuous xlab scale_size unit
#'  theme geom_line scale_shape_manual scale_y_continuous expansion
#'  element_blank element_text element_rect
#'@importFrom ggtext element_markdown
#'@importFrom patchwork plot_layout
#'@importFrom purrr map
#'@importFrom shiny HTML
#'@importFrom stringr str_wrap
#'
#' @examples
#' \dontrun{
#'captures <- data %>%
#'  group_by(
#'    sta_id,
#'    pop_id,
#'    ope_id,
#'    ope_date,
#'    annee,
#'    esp_code_alternatif,
#'    ope_surface_calculee,
#'    pop_libelle
#'  ) %>%
#'  summarise(effectif = sum(lop_effectif, na.rm = TRUE)) %>%
#'  ungroup() %>%
#'  mef_ajouter_type_protocole() %>%
#'  filter(pro_libelle %in% c("Pêche complète à un ou plusieurs passages",
#'                            "Pêche partielle par points (grand milieu)",
#'                            "Pêche par ambiances",
#'                            "Pêche partielle sur berge"))
#'
#' id_sta_sel <- captures %>% filter(!is.na(sta_id)) %>% pull(sta_id) %>% unique() %>% sample(5)
#'
#' captures_sel <- captures %>% filter(sta_id %in% id_sta_sel)
#'
#' graph_interactif <- gg_temp_peuplement(captures_sel, interactif = T)
#' graph_interactif[[1]]
#'
#' graph_static <- gg_temp_peuplement(captures_sel, interactif = F)
#' graph_static[[1]]
#'
#' }

gg_temp_peuplement <- function(df,
                               var_id_sta,
                               var_libelle_sta,
                               var_especes = esp_code_alternatif,
                               interactif = FALSE,
                                largeur = 6,
                                hauteur = 5,
                                taxons_ipr = "plain",
                               longueur_libelle = 20,
                                ...)

{
  var_id_sta <- enquo(var_id_sta)
  var_libelle_sta <- enquo(var_libelle_sta)
  var_especes <- enquo(var_especes)

  # mise en forme des étiquettes inspirée de https://stackoverflow.com/a/57086284
  int_breaks <- function(x, n = 5){
    if (length(unique(x)) > 1) {
      pretty(x, n)[round(pretty(x, n), 1) %% 1 == 0]
    } else {
      round(unique(x)) + c(-1, 0, 1)
    }
  }

  int_limits <- function(x) {
    if (length(unique(x)) > 1) {
      range(x)
    } else {
      range(int_breaks(x))
    }
  }

  # fonction de création d'un graphique
  create_graph <- function(pop, df, interactive) {
    df_pop <- df %>%
      dplyr::filter(!!var_id_sta == pop) %>%
      dplyr::rowwise() %>%
      dplyr::mutate(
        hover = shiny::HTML(
          paste0("<b>", annee, "</b><br>",!!var_especes,": ", effectif, ' ind.')
        )
      ) %>%
      dplyr::ungroup() %>%
      dplyr::mutate(!!var_especes := forcats::fct_rev(!!var_especes))

    libelle <-
      df_pop %>%
      dplyr::pull(!!var_libelle_sta) %>%
      na.omit() %>%
      .[1] %>%
      stringr::str_wrap(longueur_libelle)


    df_protocole <-
      df_pop %>%
      dplyr::select(annee, !!var_libelle_sta, pro_libelle) %>%
      unique() %>%
      dplyr::mutate(Protocole = stringr::str_wrap(pro_libelle, 15)) %>%
      dplyr::mutate(hover2 = paste0("<b>", annee, "</b><br>", pro_libelle))


    gg_peuplement <-
      ggplot2::ggplot(
        data = df_pop,
        aes(x = annee,
            y = !!var_especes,
            size = ifelse(effectif == 0, NA, effectif))
      ) +
      ggiraph::geom_point_interactive(
        ggplot2::aes(x = annee,
                     y = !!var_especes,
                     tooltip = hover,
                     size = ifelse(effectif == 0, NA, effectif)),
        pch = 21,
        alpha = 0.7,
        fill = "#1B9E77"
      ) +
      ggplot2::labs(
        x = "Ann\u00e9es",
        y = "Taxons",
        title = libelle
      ) +
      ggplot2::scale_x_continuous(
        breaks = int_breaks,
        limits = int_limits
      ) +
      # ggplot2::scale_y_discrete(
      #   expand = ggplot2::expansion(mult = c(0.04, 0.03))
      # ) +
      ggplot2::scale_size(name = "Effectifs",
                          range = c(0.5, 7.5),
                          breaks=c(1, 10, 50, 100, 250, 500, 1000, 2500,5000),
                          limits = c(df_pop$effectif %>% min(),
                                     df_pop$effectif %>% max())

      ) +
      ggplot2::theme(
        axis.text.y = ggplot2::element_text(size = 8),
        panel.background = ggplot2::element_rect(fill='grey95'),
        #strip.text = element_text(size = 11,color="white",face = "bold"),
        strip.background = ggplot2::element_rect(color = "black", fill = "grey30"),
        legend.position = 'right',
        legend.text = ggplot2::element_text(size = 8),
        legend.title = ggplot2::element_text(size = 8),
        axis.text.x = ggplot2::element_text(angle = 0, hjust = 0.5, size=9)
      )

    esp_ipr <-
      ref_espece %>%
      dplyr::filter(esp_eligible_calcul_ipr == 't') %>%
      dplyr::pull(!!var_especes)

    manual_font <- ifelse(levels(df_pop %>% pull(!!var_especes)) %in% esp_ipr, yes = taxons_ipr, no = "plain")

    gg_peuplement <-
      gg_peuplement +
      ggplot2::theme(axis.text.y = ggtext::element_markdown(face = manual_font,size = 8))

    gg_proto <-
      ggplot2::ggplot(
        data = df_protocole,
        aes(x = annee, fill = Protocole)
      ) +
      ggplot2::geom_line(y = 0.5,group=0,alpha=0.5,lty=1,size=0.2) +
      ggiraph::geom_point_interactive(
        ggplot2::aes(x = annee, tooltip = hover2, group=annee, fill = Protocole, shape = Protocole),
        y = 0.5,
        alpha = 0.7,
        size = 2
      ) +
      ggplot2::scale_shape_manual(values = c(22, 23, 24, 25)) +
      ggplot2::scale_x_continuous(
        position = 'top',
        breaks = int_breaks,
        limits = int_limits
      ) +
      ggplot2::scale_y_continuous(
        expand = ggplot2::expansion(mult = c(0, 0))
      ) +
      ggplot2::xlab(NULL) +
      ggplot2::theme(
        panel.background = element_rect(fill = 'grey95'),
        strip.text = element_text(size = 11, color = "white", face = "bold"),
        strip.background = element_rect(color = "black", fill = "grey30"),
        legend.position = 'bottom',
        legend.text = element_text(size = 9),
        legend.title = element_text(size = 9),
        axis.text.x = element_text(angle = 0, hjust = 0.5, size = 9),
        axis.ticks = element_blank()
      )

    plot_comb <- ((gg_peuplement +
                     ggplot2::theme(plot.margin = ggplot2::unit(c(0, 0, -0.5, 0), "pt"),
                                    axis.text.x = element_blank(),
                                    #axis.ticks.x = element_blank(),
                                    axis.title.x = element_blank()) ) / gg_proto) +
      patchwork::plot_layout(heights = c(5, 0.2))

    if (interactive) {

      gg_proto <- gg_proto + ggplot2::theme(legend.position = 'none')

      plot_comb <- ((gg_peuplement +
                       ggplot2::theme(legend.position = 'none',
                                      plot.margin = unit(c(0, 0, -0.5, 0), "pt"),
                                      axis.text.x = ggplot2::element_blank(),
                                      #axis.ticks.x = element_blank(),
                                      axis.title.x = ggplot2::element_blank()) ) / gg_proto) +
        patchwork::plot_layout(heights = c(5, 0.2))

      ggiraph::girafe(
        ggobj = plot_comb,
        width_svg = largeur,
        height_svg = hauteur,
        options = list()
      )
    } else {
      plot_comb
    }
  }

  # application sur l'ensemble des points
  graphs <- df %>%
    dplyr::pull(!!var_id_sta) %>%
    unique() %>%
    purrr::map(
      .f = create_graph,
      df = df,
      interactive = interactif
    ) %>%
    set_names(unique(dplyr::pull(df, !!var_id_sta)))

  # sortie
  if (length(graphs) == 1) {
    graphs[[1]]
  } else {
    graphs
  }

}

