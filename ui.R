# ui.R

ui <- shiny::fluidPage(
  shiny::column(
    width = 4L,
    shiny::br(),
    letter_ui("L1"),
    letter_ui("L2"),
    letter_ui("L3"),
    letter_ui("L4"),
    letter_ui("L5")
  ),
  shiny::column(
    width = 8L,
    shiny::br(),
    shiny::uiOutput(
      outputId = "eligible_words"
    )
  )
)
