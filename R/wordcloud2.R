##' Create wordcloud by wordcloud2.js
##'
##' @description
##' Function for Creating wordcloud by wordcloud2.js
##'
##' @usage
##' wordcloud2(data, size = 1, minSize = 0, gridSize =  0,
##'     fontFamily = 'Segoe UI', fontWeight = 'bold',
##'     color = 'random-dark', backgroundColor = "white",
##'     minRotation = -pi/4, maxRotation = pi/4, rotateRatio = 0.4,
##'     shape = 'circle', ellipticity = 0.65, figPath = NULL, widgetsize = NULL)
##'
##' @param data   A data frame including word and freq in each column
##' @param size   Font size, default is 1. The larger size means the bigger word.
##' @param minSize    A character string of the subtitle
##' @param gridSize  Size of the grid in pixels for marking the availability of the canvas
##' the larger the grid size, the bigger the gap between words.
##' @param fontFamily Font to use.
##' @param fontWeight Font weight to use, e.g. normal, bold or 600
##' @param color  color of the text, keyword 'random-dark' and 'random-light' can be used.
##' color vector is also supported in this param
##' @param backgroundColor Color of the background.
##' @param minRotation If the word should rotate, the minimum rotation
##' (in rad) the text should rotate.
##' @param maxRotation If the word should rotate, the maximum rotation (in rad) the text should rotate.
##' Set the two value equal to keep all text in one angle.
##' @param rotateRatio Probability for the word to rotate. Set the number to 1 to always rotate.
##' @param shape The shape of the "cloud" to draw. Can be a keyword present. Available presents are 'circle'
##'  (default), 'cardioid' (apple or heart shape curve, the most known polar equation),
##'  'diamond' (alias of square), 'triangle-forward', 'triangle', 'pentagon', and 'star'.
##' @param ellipticity degree of "flatness" of the shape wordcloud2.js should draw.
##' @param figPath The path to a figure used as a mask.
##' @param widgetsize size of the widgets
##'
##'
##' @examples
##'library(wordcloud2)
##'# Global variables can go here
##'
##'
##'
##' wordcloud2(demoFreq)
##' wordcloud2(demoFreq, size = 2)
##'
##' wordcloud2(demoFreq, size = 1,shape = 'pentagon')
##' wordcloud2(demoFreq, size = 1,shape = 'star')
##'
##' wordcloud2(demoFreq, size = 2,
##'            color = "random-light", backgroundColor = "grey")
##'
##' wordcloud2(demoFreq, size = 2, minRotation = -pi/2, maxRotation = -pi/2)
##' wordcloud2(demoFreq, size = 2, minRotation = -pi/6, maxRotation = -pi/6,
##'   rotateRatio = 1)
##' wordcloud2(demoFreq, size = 2, minRotation = -pi/6, maxRotation = pi/6,
##'   rotateRatio = 0.9)
##'
##' wordcloud2(demoFreqC, size = 2,
##'            color = "random-light", backgroundColor = "grey")
##' wordcloud2(demoFreqC, size = 2, minRotation = -pi/6, maxRotation = -pi/6,
##'   rotateRatio = 1)
##'
##' # Color Vector
##'
##' colorVec = rep(c('red', 'skyblue'), length.out=nrow(demoFreq))
##' wordcloud2(demoFreq, color = colorVec, fontWeight = "bold")
##'
##' wordcloud2(demoFreq,
##'   color = ifelse(demoFreq[, 2] > 20, 'red', 'skyblue'))



#' @import htmlwidgets
#' @export
# data = data.frame(name=c("New","Old"),
#                   freq=c(100,30))
wordcloud2 <- function(data,
                       size = 1,
                       fontFamily = 'Segoe UI',
                       fontWeight = 'bold',
                       color =  'random-dark',
                       minSize =  0,
                       backgroundColor = "white",
                       gridSize =  0,
                       minRotation = -pi/4,
                       maxRotation = pi/4,
                       shuffle = TRUE,
                       rotateRatio = 0.4,
                       shape = 'circle',
                       ellipticity = 0.65,
                       widgetsize = NULL,
                       figPath = NULL,
                       hoverFunction = NULL
                       ) {
  if(class(data) =="table"){
    dataOut = data.frame(name = names(data),
                         freq = as.vector(data))
  }else{
    data = as.data.frame(data)
    dataOut = data[,1:2]
    names(dataOut) = c("name", "freq")
  }



  if(!is.null(figPath)){
    if(!file.exists(figPath)){
    stop("cannot find fig in the figPath")
    }
    spPath = strsplit(figPath, "\\.")[[1]]
    len = length(spPath)
    figClass = spPath[len]

    if(!figClass %in% c("jpeg","jpg","png","bmp","gif")){
      stop("file should be a jpeg, jpg, png, bmp or gif file!")
    }

    base64 = base64enc::base64encode(figPath)
    base64 = paste0("data:image/",figClass ,";base64,",base64)

  }else{
    base64 = NULL
  }

  # create a list that contains the settings

  weightFactor = size * 180 / max(dataOut$freq)

  settings <- list(
    word = dataOut$name,
    freq = dataOut$freq,
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
    figBase64 = base64,
    hover = htmlwidgets::JS(hoverFunction)
  )


  chart = htmlwidgets::createWidget("wordcloud2", settings,
                            width = widgetsize[1],
                            height = widgetsize[2],
                            sizingPolicy = htmlwidgets::sizingPolicy(
                              viewer.padding = 0,
                              browser.padding = 0,
                              browser.fill = TRUE
                            ))


  chart
}




