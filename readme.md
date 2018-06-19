## wordcloud2

[![CRAN](https://www.r-pkg.org/badges/version/wordcloud2)](https://cran.r-project.org/package=wordcloud2)
![Downloads](https://cranlogs.r-pkg.org/badges/wordcloud2)
[![Build status](https://ci.appveyor.com/api/projects/status/wj5afxb1v42h8oui?svg=true)](https://ci.appveyor.com/project/lchiffon/wordcloud2)

R interface to wordcloud for data visualization.
Timdream's [wordcloud2.js](https://github.com/timdream/wordcloud2.js) is used in this package.

## contributors


- [JacobXPX](https://github.com/JacobXPX)
- [AdamSpannbauer](https://github.com/JacobXPX)
- [ekstroem](https://github.com/ekstroem)
- [timelyportfolio](https://github.com/timelyportfolio)
- [AdeelK93](https://github.com/AdeelK93)



### Original description

#### Installation

```
devtools::install_github("lchiffon/wordcloud2")
```
knitr and shiny is support in wordcloud2 package.

#### Example

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


#### Chinese version
```
## Sys.setlocale("LC_CTYPE","eng")
wordcloud2(demoFreqC, size = 2, fontFamily = "微软雅黑",
           color = "random-light", backgroundColor = "grey")
```

![1](examples/img/4.png)

#### Example of successfully deploying interactivate clickable wordcloud with special shape on R-shiny

Thanks [JacobXPX](https://github.com/JacobXPX)'s contribution to this feature:

```
devtools::install_github("JacobXPX/wordcloud2")
# Same as:
# devtools::install_github("lchiffon/wordcloud2")
library(shiny)
library(wordcloud2)
library(tm)

shinyApp(
  ui = shinyUI(fluidPage(
    mainPanel(
      wordcloud2Output("wordcloud", clickedWordInputId = "selected_word")
    ),
    
    sidebarPanel(
      textOutput("selected_var")
    )
  )),
  server = shinyServer(function(input, output) {
    figPath = system.file("examples/t.png",package = "wordcloud2")
    wordcloud_plot <- wordcloud2(data = demoFreq, figPath = figPath, size = 0.6,color = "blue")
    output$wordcloud  <- renderWordcloud2(wordcloud_plot)
    output$selected_var <- renderText({ 
      paste("You have selected", input$selected_word)
    })
  })
)
```

run the above code and click refresh, it will work.

![1](examples/img/sample.png)
