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

  ##### 			from character 		####

  ## Not run:
  data(crude)
  crude <- tm_map(crude, removePunctuation)
  crude <- tm_map(crude, function(x)removeWords(x,stopwords()))

  ##### 			from corpus 		#####



  ##### 		from frequency counts 	#####
  tdm <- TermDocumentMatrix(crude)
  m <- as.matrix(tdm)
  v <- sort(rowSums(m),decreasing=TRUE)
  d <- data.frame(word = names(v),freq=v)
}


wordcloud2(d,weightFactor = 5)
