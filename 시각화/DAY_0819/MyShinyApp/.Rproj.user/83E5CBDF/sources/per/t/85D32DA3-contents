library(plotly)
library(ggplot2)

df <- data.frame(
  x = c(1,2,3,4), 
  y = c(1,2,3,4), 
  f = c(1,2,3,4)
)

p <- ggplot(df, aes(x, y)) +
  geom_point(aes(frame = f))

ggplotly(p)


data(sleep)
sleep %>%
  plot_ly() %>%
  add_trace(x=~ID,y=~extra,type='bar') %>%
  layout(title='Bar Plot', xaxis=list(title='Species'),
         yaxis=list(tilte='Frequency'))


penguins |>
  plot_ly(x=~bill_length_mm, y=~bill_depth_mm, name=~species,
          hovertext=~island, hoverInfo='x+y+name+text')

# x축 gdpPercap, y축 lifeExp
# hover는 국가, 인구 나타나도록
library(gapminder)
str(gapminder)
subset(gapminder,year==2007) %>%
  plot_ly(x=~gdpPercap, y=~lifeExp, name=~country,
          hovertext=~pop, hoverInfo='name+text')








