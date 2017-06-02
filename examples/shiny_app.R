library(shiny)
library(shinyjs)
library(wordcloud2)
if (!require(EBImage)) {
  source("https://bioconductor.org/biocLite.R")
  biocLite("EBImage")
}
library(EBImage)



clearn_canvas = 'shinyjs.clear = function() {
  var canvas=document.getElementById("canvas");
  var ctx=canvas.getContext("2d");
  ctx.clearRect(0, 0, canvas.width, canvas.height);
}'


ui <- shinyUI(fluidPage(
  tags$title('Live Wordcloud'),
  useShinyjs(),
  extendShinyjs(text = clearn_canvas),

  hr(),

  fluidRow(
    column(6, plotOutput('img')),
    column(6, wordcloud2Output("distPlot"))
  ),

  hr(),

  fluidRow(
    column(3, fileInput('img', 'Choose a image:')),
    column(3, selectInput('channel', label = 'Select Image channel:',
                          choices = c( 'grey', 'red', 'blue', 'green'),
                          selected = 'grey')),
    column(3, sliderInput("threshold", "Slide to choose threshold:",
                          min = 1, max = 256, value = 128)),
    column(3, actionButton('draw', 'Generate WordCloud', class="btn-info")),
    style="backgroud-color:grey"
  ),

  HTML('<div class="span footer navbar-inverse navbar-fixed-bottom" style="text-align:center;color:white">
       Powered by <a href="https://github.com/Lchiffon/wordcloud2">wordcloud2</a>
       </div>'
  )
  ))


server <- shinyServer(function(input, output) {

  read_img <- reactive({
    if (is.null(input$img$datapath)) {
      img_path = system.file('examples/t.png', package = 'wordcloud2')
      img_type <<- 'png'
    }else{
      img_path = input$img$datapath
      img_type <<- strsplit(input$img$type, '/')[[1]][2]
      if (img_type == 'jpg') img_type = 'jpeg'
    }
    img = readImage(img_path, type = img_type)
    channel(img, input$channel)
  })

  # convert image to binary image
  binary_img <- function() {
    img = read_img()
    img[img >= input$threshold / 255] = 1
    img[img < input$threshold / 255] = 0
    return(img)
  }

  output$img <- renderPlot({
    img <- binary_img()
    display(img, method='raster')
  })

  # clear canvas & save image
  prepare_shape <- eventReactive(input$draw, {
    js$clear()
    target_img <<- paste(tempdir(), img_type, sep='.')
    img <- binary_img()
    writeImage(img, target_img)
  })

  output$distPlot <- wordcloud2::renderWordcloud2({
    prepare_shape()
    wordcloud2(demoFreqC, figPath = target_img)
  })
})

# Run the application
shinyApp(ui = ui, server = server)
