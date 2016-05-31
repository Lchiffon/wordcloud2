#' @import htmlwidgets
#' @export
# data = data.frame(name=c("New","Old"),
#                   freq=c(100,30))
wordcloud2 <- function(data, size = NULL,
                       fontFamily = '"Trebuchet MS", "Heiti TC", "Microsoft YaHei", "Arial Unicode MS", "Droid Fallback Sans", sans-serif',
                       fontWeight = 'normal',
                       color =  'random-dark',
                       minSize =  0,
                       weightFactor = NULL,
                       backgroundColor = "white",
                       gridSize =  0,
                       minRotation = -pi/4,
                       maxRotation = pi/4,
                       shuffle = TRUE,
                       rotateRatio = 0.4,
                       shape = 'circle',
                       ellipticity = 0.65,
                       drawMask = FALSE,
                       maskColor =  'rgba(255,0,0,0.3)',
                       maskGapWidth =  0.3

                       ) {
  if(class(data) =="table"){
    dataOut = data.frame(name = names(data),
                         freq = as.vector(data))
  }else{
    data = as.data.frame(data)
    dataOut = data[,1:2]
    names(dataOut) = c("name", "freq")
  }


  # create a list that contains the settings
  if(is.null(weightFactor)){
    weightFactor = 120/max(dataOut$freq)
  }
  settings <- list(
    fontFamily = fontFamily,
    fontWeight = fontWeight,
    color =  color,
    minSize =  minSize,
    weightFactor = weightFactor,
    backgroundColor = backgroundColor,
    gridSize =  gridSize,
    minRotation = minRotation,
    maxRotation = maxRotation,
    shuffle = shuffle,
    rotateRatio = rotateRatio,
    shape = shape,
    ellipticity = ellipticity,
    drawMask = drawMask,
    maskColor =  maskColor,
    maskGapWidth =  maskGapWidth
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
