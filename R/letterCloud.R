#' Create wordcloud with the shape of a word
#'
#' @description
#' Function for Creating wordcloud with the shape of a word
#'
#' @usage
#' letterCloud(data, word, wordSize = 0, letterFont = NULL, ...)
#'
#' @param data   A data frame including word and freq in each column
#' @param word  A word to create shape for wordcloud.
#' @param wordSize Parameter of the size of the word.
#' @param letterFont Letter font
#' @param ...  Other parameters for wordcloud.
#' @importFrom grDevices dev.off png
#' @importFrom graphics par plot.new strwidth text
#' @importFrom graphics par plot.new strwidth text
#' @examples
#' library(wordcloud2)
#'
#' letterCloud(demoFreq,"R")
#' @export
letterCloud = function(data, word, wordSize = 0,
                       letterFont = NULL,...){
  fileid = paste('ID', format(Sys.time(), "%Y%m%d%H%M%S"),
                 round(proc.time()[3]*100), sep="_")
  figDir = paste0(tempdir(),"/",fileid,".png")

  # word = "COS"
  if(nchar(word)==1){
    ofCex = -25
  }else if(nchar(word)==2){
    ofCex = -10
  }else{
    ofCex = -1
  }
  png(filename = figDir,width = 800,height = 600)
  offset = par(mar = par()$mar)
  op = par(mar = c(0,0,0,0))
  plot.new()

  text(0.5, 0.5, word, font = 2, family = letterFont,
       cex = 1/strwidth(word) + ofCex + wordSize)

  dev.off()
  par(offset)

  wordcloud2(data,figPath = figDir,...)

}
