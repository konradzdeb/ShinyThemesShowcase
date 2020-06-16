#' The application User-Interface
#'
#' @param request Internal parameter for `{shiny}`.
#'     DO NOT REMOVE.
#' @import shiny
#' @noRd
app_ui <- function(request) {
  tagList(
    # Leave this function for adding external resources
    golem_add_external_resources(),
    # List the first level UI elements here
    material_page(
      title = "Material Design",
      primary_theme_color = "#2c7891",
      secondary_theme_color = "red",
      material_side_nav(
        fixed = TRUE,
        # Place side-nav tabs within side-nav
        material_side_nav_tabs(
          side_nav_tabs = c(
            "Example Side-Nav Tab 1" = "example_side_nav_tab_1",
            "Example Side-Nav Tab 2" = "example_side_nav_tab_2"
          ),
          icons = c("cast", "insert_chart")
        )
      ),
      # Define side-nav tab content
      material_side_nav_tab_content(
        side_nav_tab_id = "example_side_nav_tab_1",
        tags$h1("First Side-Nav Tab Content")
      ),
      material_side_nav_tab_content(
        side_nav_tab_id = "example_side_nav_tab_2",
        tags$h1("Second Side-Nav Tab Content")
      )
    )
  )
}

#' Add external Resources to the Application
#'
#' This function is internally used to add external
#' resources inside the Shiny application.
#'
#' @import shiny
#' @importFrom golem add_resource_path activate_js favicon bundle_resources
#' @noRd
golem_add_external_resources <- function(){

  add_resource_path(
    'www', app_sys('app/www')
  )

  tags$head(
    favicon(),
    bundle_resources(
      path = app_sys('app/www'),
      app_title = 'MaterialDesign'
    )
    # Add here other external resources
    # for example, you can add shinyalert::useShinyalert()
  )
}

