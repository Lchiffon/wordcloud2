##' Change the themes of wordcloud2
##'
##' @description
##' Function for Creating wordcloud theme
##'
##'
##' @param e1  wordcloud2 object
##' @param e2  wordcloud2 themes
##' @export
##' @method + wordcloud2
##' @examples
##' wc = wordcloud2(demoFreq)
##'
##' wc + WCtheme(1)
##' wc + WCtheme(2)
##' wc + WCtheme(3)
##' wc + WCtheme(2) + WCtheme(3)
`+.wordcloud2` = function(e1, e2){
  if(e2$class == 1){
    e1$x$minRotation = -pi/2
    e1$x$maxRotation = -pi/2
  }else if (e2$class ==2){
    e1$x$minRotation = -pi/6
    e1$x$maxRotation = -pi/6
    e1$x$rotateRatio = 1
  }else if (e2$class == 3){
    e1$x$color = "random-light"
    e1$x$backgroundColor = "grey"
  }
  return(e1)
}

