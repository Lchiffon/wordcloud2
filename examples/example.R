library(REmap)
data = data.frame(iconv(chinaIphone$V1,from="GBK",to = "UTF-8"),chinaIphone$V2)
wordcloud2(data,fontWeight = "bold")
system.time({
  wordcloud(c(letters, LETTERS, 0:9), seq(1, 1000, len = 62))
})
system.time({
wordcloud2(data.frame(c(letters, LETTERS, 0:9), seq(1, 1000, len = 62)))
  })


if(require(tm)){

  ##### 			from character 		#####
  wordcloud(
    "Many years ago the great British explorer George Mallory, who
    was to die on Mount Everest, was asked why did he want to climb
    it. He said, \"Because it is there.\"

    Well, space is there, and we're going to climb it, and the
    moon and the planets are there, and new hopes for knowledge
    and peace are there. And, therefore, as we set sail we ask
    God's blessing on the most hazardous and dangerous and greatest
    adventure on which man has ever embarked.",
    ,random.order=FALSE)

  ## Not run:
  data(crude)
  crude <- tm_map(crude, removePunctuation)
  crude <- tm_map(crude, function(x)removeWords(x,stopwords()))

  ##### 			from corpus 		#####
  wordcloud(crude)


  ##### 		from frequency counts 	#####
  tdm <- TermDocumentMatrix(crude)
  m <- as.matrix(tdm)
  v <- sort(rowSums(m),decreasing=TRUE)
  d <- data.frame(word = names(v),freq=v)

  wordcloud(d$word,d$freq)

  #A bigger cloud with a minimum frequency of 2
  wordcloud(d$word,d$freq,c(8,.3),2)

  #Now lets try it with frequent words plotted first
  wordcloud(d$word,d$freq,c(8,.5),2,,FALSE,.1)

  ##### 			with colors 		#####
  if(require(RColorBrewer)){

    pal <- brewer.pal(9,"BuGn")
    pal <- pal[-(1:4)]
    wordcloud(d$word,d$freq,c(8,.3),2,,FALSE,,.15,pal)


    pal <- brewer.pal(6,"Dark2")
    pal <- pal[-(1)]
    wordcloud(d$word,d$freq,c(8,.3),2,,TRUE,,.15,pal)

    #random colors
    wordcloud(d$word,d$freq,c(8,.3),2,,TRUE,TRUE,.15,pal)
  }
  ##### 			with font 			#####

  wordcloud(d$word,d$freq,c(8,.3),2,,TRUE,,.15,pal,
            vfont=c("gothic english","plain"))

  wordcloud(d$word,d$freq,c(8,.3),2,100,TRUE,,.15,pal,vfont=c("script","plain"))

  wordcloud(d$word,d$freq,c(8,.3),2,100,TRUE,,.15,pal,vfont=c("serif","plain"))

  ## End(Not run)
}


wordcloud2(d,weightFactor = 5)
