library(shiny)
library(gapminder)
library(ggplot2)

ui <- pageWithSidebar(
  headerPanel(
    h1('우리는 요리사곰 조입니다: 나령, 영효, 남광, 혜리')
  ),
  sidebarPanel(
    selectInput('year','몇 년도를 보여 드릴까요?',seq(1952,2007,5))
  ),
  mainPanel(
    h3('해당 연도의 GDP 대비 기대수명 그래프입니다.'),
    plotOutput('distPlot')
  )
)
  
server <- function(input, output){
  output$distPlot <- renderPlot({
    # ggplot2로 그래프를 그려 보세요
    ggplot(subset(gapminder, year==input$year), aes(x=gdpPercap, y= lifeExp))+
      geom_point(aes(color=continent))+
      scale_x_log10()+ geom_smooth()
  })
}

shinyApp(ui = ui, server = server)
