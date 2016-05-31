#' @import htmlwidgets
#' @export
# data = data.frame(name=c("New","Old"),
#                   freq=c(100,30))
wordcloud2 <- function(data,size=NULL, weightFactor=NULL) {
  dataOut <- data
  # create a list that contains the settings
  if(is.null(weightFactor)){
    weightFactor = 100/max(data[,2])
  }
  settings <- list(
    weightFactor = weightFactor,
    backgroundColor = 'white'
  )
  # pass the data and settings using 'x'
  x <- list(
    list = dataOut,
    settings = settings
  )
  # create the widget
  htmlwidgets::createWidget("wordcloud2", x, width = size[1], height = size[2])
}

#'
#' #' @export
#' sigmaOutput <- function(outputId, width = "100%", height = "400px") {
#'   htmlwidgets::shinyWidgetOutput(outputId, "sigma", width, height, package = "sigma")
#' }
#' #' @export
#' renderSigma <- function(expr, env = parent.frame(), quoted = FALSE) {
#' if (!quoted) { expr <- substitute(expr) } # force quoted
#' htmlwidgets::shinyRenderWidget(expr, sigmaOutput, env, quoted = TRUE)
#' }
