library(shiny)

ui <- fluidPage(
  tags$h1('NANA'),
  tags$img(src='https://search.pstatic.net/common/?src=http%3A%2F%2Fblogfiles.naver.net%2FMjAyMjA4MTFfMjMw%2FMDAxNjYwMTYxNzkwMTY3.N6eD9fuhbjz66kn7U2uzF24TUleJARv0mfKgPqIPv7gg.nyDH01DsV4xDDK2WGyooKYkq45T9w6I9fkJs45mRJiMg.JPEG.10angelf%2FIMG_1250.JPG&type=sc960_832'),
  selectInput('dataset', label='Dataset', choices = c('iris','mtcars','state.x77')),
  verbatimTextOutput('summary'),
  tableOutput('table') # 이까지 해 줘야 데이터셋 정보 뜸
)

# 2가지 역할
server <- function(input, output){
  dataset <- reactive({
    get(input$dataset, 'package:datasets')
    })
  output$summary <- renderPrint({
    summary(dataset())
  }) 
  output$table <- renderTable({
    cat(input$dataset,'\n')
    head(dataset(), 5)
  })
}
shinyApp(ui, server)












