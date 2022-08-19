library(shiny)
library(gapminder)
library(ggplot2)

ui <- fluidPage(
  tags$h1('갭마인더 따라 해 보기'),
  tags$h3('그림 그리기'),
  plotOutput('plot',click='plot_click'),
  tags$h3('사용자 클릭에 반응하기'),
  tableOutput('data')
  
)
server <- function(input, output){
  output$plot <- renderPlot({
    ggplot(subset(gapminder, year==2007), aes(x=gdpPercap, y= lifeExp))+
      geom_point(aes(color=continent))+
      scale_x_log10()+ geom_smooth()
  })
  output$data <- renderTable({
    req(input$plot_click)
    nearPoints(gapminder, input$plot_click)
  })  
}

shinyApp(ui = ui, server = server)
