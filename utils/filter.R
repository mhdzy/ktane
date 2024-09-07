#' filter_words
#'
#' @importFrom tibble tibble
#' @importFrom dplyr filter
filter_words <- function(words, letters) {
  # broken-down words
  suppressMessages(
    bdown <- lapply(words, \(x) strsplit(x, "")[[1]]) |>
      dplyr::bind_cols() |>
      t() |>
      tibble::as_tibble()
  )

  filtered <- c()

  is_empty_letters <- lapply(letters, nchar) |> unlist() |> { \(x) !x }() |> which()

  if (length(is_empty_letters)) {
    message("replacing letters with alphabet: ", is_empty_letters)
    for (l in is_empty_letters) {
      letters[[l]] <- base::letters
    }
  }

  ldown <- lapply(letters, \(x) strsplit(x, "") |> unlist())

  bdown <- bdown |>
    dplyr::filter(
      V1 %in% ldown$l1 &
        V2 %in% ldown$l2 &
        V3 %in% ldown$l3 &
        V4 %in% ldown$l4 &
        V5 %in% ldown$l5
    ) |>
    apply(1, FUN = \(x) paste0(x, collapse = ""))

  print(bdown)

  return(bdown)
}
