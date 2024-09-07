# server.

server <- function(input, output, session) {

  letter1 <- letter_server("L1")
  letter2 <- letter_server("L2")
  letter3 <- letter_server("L3")
  letter4 <- letter_server("L4")
  letter5 <- letter_server("L5")

  output$eligible_words <- shiny::renderUI({

    eligible <- filter_words(
      words = words,
      letters = list(
        l1 = letter1(),
        l2 = letter2(),
        l3 = letter3(),
        l4 = letter4(),
        l5 = letter5()
      )
    )

    words <- shiny::HTML(
      paste0(
        "<h4>Your Word:</h4>",
        paste0(eligible, collapse = "<br>")
      )
    )

    return(words)
  })
}
