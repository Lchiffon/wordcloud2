## wordcloud2
R interface to wordcloud for data visualization.
Timdream's [wordcloud2.js](https://github.com/timdream/wordcloud2.js) is used in this package.

### Installation

```
devtools::install_github("lchiffon/wordcloud2")
```
knitr and shiny is support in wordcloud2 package.

### Example

```
library(wordcloud2)
wordcloud2(demoFreq, size = 1,shape = 'star')
```

![1](examples/img/1.png)


```
wordcloud2(demoFreq, size = 2, minRotation = -pi/2, maxRotation = -pi/2)
```

![1](examples/img/2.png)


```
wordcloud2(demoFreq, size = 2, minRotation = -pi/6, maxRotation = -pi/6,
  rotateRatio = 1)
```

![1](examples/img/3.png)


### Chinese version
```
wordcloud2(demoFreqC, size = 2, fontFamily = "微软雅黑",
           color = "random-light", backgroundColor = "grey")
```

![1](examples/img/4.png)

