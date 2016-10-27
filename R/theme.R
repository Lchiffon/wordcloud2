##' Change the themes of wordcloud2
##'
##' @description
##' Function for Creating wordcloud theme
##'
##' @usage
##' WCtheme(class = 1)
##'
##' @param class  class for theme in wordcloud2
##'
##' @export
##' @examples
##' wc = wordcloud2(demoFreq)
##'
##' wc + WCtheme(1)
##' wc + WCtheme(2)
##' wc + WCtheme(3)
##' wc + WCtheme(2) + WCtheme(3)

WCtheme = function(class = 1){
  if(class == 1){
    return(list(class =1,
                minRotation = -pi/2,
                maxRotation = -pi/2))
  }else if (class ==2){
    return(list(class =2,
                minRotation = -pi/6,
                maxRotation = -pi/6,
                rotateRatio = 1))
  }else if (class == 3| class=='Dark'){
    return(list(class =3,
                color = "random-light",
                backgroundColor = "grey"))
  }else{
    stop("Out of themes~")
  }
}
