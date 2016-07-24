##' Plot wordcloud2 in shiny
##'
##' @description
##' Function for plotting wordcloud2 in shiny
##'
##' @usage
##' wordcloud2Output(outputId, width = "100\%", height = "400px")
##' renderWordcloud2(expr, env = parent.frame(), quoted = FALSE)
##'
##' @param outputId output variable to read from
##' @param width,height Must be a valid CSS unit (like \code{"100\%"},
##'   \code{"400px"}, \code{"auto"}) or a number, which will be coerced to a
##'   string and have \code{"px"} appended.
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
##' @examples
##' if(require(shiny)){
##'
##'   library(wordcloud2)
##'   # Global variables can go here
##'   n <- 1
##'
##'   # Define the UI
##'   ui <- bootstrapPage(
##'      numericInput('size', 'Size of wordcloud', n),
##'     wordcloud2Output('wordcloud2')
##'   )
##'
##'
##'   # Define the server code
##'   server <- function(input, output) {
##'      output$wordcloud2 <- renderWordcloud2({
##'      # wordcloud2(demoFreqC, size=input$size)
##'        wordcloud2(demoFreq, size=input$size)
##'      })
##'   }
##'   # Return a Shiny app object
##'   # Sys.setlocale("LC_CTYPE","chs") #if you use Chinese character
##'   ## Do not Run!
##'   shinyApp(ui = ui, server = server)
##'   }
##' @name wordcloud2-shiny
NULL


#' @rdname wordcloud2-shiny
#' @export
wordcloud2Output <- function(outputId, width = "100%", height = "400px") {
  htmlwidgets::shinyWidgetOutput(outputId, "wordcloud2", width, height, package = "wordcloud2")
}

#' @rdname wordcloud2-shiny
#' @export
renderWordcloud2 <- function(expr, env = parent.frame(), quoted = FALSE) {
  if (!quoted) { expr <- substitute(expr) } # force quoted
  htmlwidgets::shinyRenderWidget(expr, wordcloud2Output, env, quoted = TRUE)
}
