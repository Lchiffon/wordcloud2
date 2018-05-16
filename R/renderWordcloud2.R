##' Plot wordcloud2 in shiny
##'
##' @description
##' Function for plotting wordcloud2 in shiny
##'
##' @usage
##' wordcloud2Output(outputId, width = "100\%", height = "400px",
##'                  clickedWordInputId = paste0(outputId, "_clicked"))
##' renderWordcloud2(expr, env = parent.frame(), quoted = FALSE)
##'
##' @param outputId output variable to read from
##' @param width,height Must be a valid CSS unit (like \code{"100\%"},
##'   \code{"400px"}, \code{"auto"}) or a number, which will be coerced to a
##'   string and have \code{"px"} appended.
##' @param clickedWordInputId The input id to assign the value (see details) of the clicked word.
##' Defaults to \code{outputId_clicked} and can be referenced in the server as \code{input$outputId_clicked}.
##' @param expr An expression that generates a networkD3 graph
##' @param env The environment in which to evaluate \code{expr}.
##' @param quoted Is \code{expr} a quoted expression (with \code{quote()})? This
##'   is useful if you want to save an expression in a variable.
##'
##'
##' @details
##' Use renderWordcloud2 to render an wordcloud2 object and use wordcloud2Output
##' output an wordcloud2 object. See more details in shiny package.
##'
##' The value assigned to the associated \code{clickedWordInputId} will be of the form \code{word:freq}.
##' This will be the same value as shown in the hover information (example: \code{super:32}).
##'
##' @name wordcloud2-shiny
NULL

getClickedWord <- function(cloudOutputId, inputId) {
  #ARGUMENTS
  #       - cloudOutputId: string; outputId of wordcloud2 obj being rendered (should be identical to the value passed to wordcloud2Output)
  #       -       inputId: string; inputId of word clicked on (ie you will reference in server the word by input$inputId)
  #OUPUT
  #       - referencing input in server will return a string of form word:freq (same as hover info shown in wordcloud; ie 'super:32')
  shiny::tags$script(shiny::HTML(
      "$(document).on('click', '#canvas', function() {",
      'word = document.getElementById("wcSpan").innerHTML;',
      "Shiny.onInputChange('selected_word', word);",
    "});"
  ))
}

#' @rdname wordcloud2-shiny
#' @export
wordcloud2Output <- function(outputId, width = "100%", height = "400px", clickedWordInputId=paste0(outputId,"_clicked")) {
  widget_out <- htmlwidgets::shinyWidgetOutput(outputId, "wordcloud2", width, height, package = "wordcloud2")

  shiny::div(getClickedWord(outputId, clickedWordInputId), widget_out)
}

#' @rdname wordcloud2-shiny
#' @export
renderWordcloud2 <- function(expr, env = parent.frame(), quoted = FALSE) {
  if (!quoted) { expr <- substitute(expr) } # force quoted
  htmlwidgets::shinyRenderWidget(expr, wordcloud2Output, env, quoted = TRUE)
}
