library(shiny)

shinyUI(pageWithSidebar(
  headerPanel("Stock APP Alpha Version"),
  
  sidebarPanel(
    wellPanel(
      p(strong("Stock")),
      textInput(inputId="stock1",label="stock-1"),
      textInput(inputId="stock2",label="stock-2"),
      textInput(inputId="stock3",label="stock-3"),
      textInput(inputId="stock4",label="stock-4"),
      textInput(inputId="stock5",label="stock-5")),
    selectInput(inputId="chart_type",
                label="Figure",
                choices=c("Candel Stick"="candlesticks",
                          "Match Stick"="matchsticks",
                          "Bar"="bars",
                          "Line"="line")),
    wellPanel(
      p(strong("Date(Retrospective)")),
      sliderInput(inputId="time_num",
                  label="Time Count",
                  min=1,max=24,
                  step=1,value=6),
      selectInput(inputId="time_unit",
                  label="Time Unit",
                  choices=c("Day"="days",
                            "Week"="wekks",
                            "Month"="months",
                            "Year"="years"),
                  selected="Months"))
    #checkboxInput(inputId="log_y",label="log y axis",value=FALSE)
    ),
  mainPanel(
    conditionalPanel(condition="input.stock1",
                     br(),
                     div(plotOutput(outputId="plot_1"))),
    conditionalPanel(condition="input.stock2",
                     br(),
                     div(plotOutput(outputId="plot_2"))),
    conditionalPanel(condition="input.stock3",
                     br(),
                     div(plotOutput(outputId="plot_3"))),
    conditionalPanel(condition="input.stock4",
                     br(),
                     div(plotOutput(outputId="plot_4"))),
    conditionalPanel(condition="input.stock4",
                     br(),
                     div(plotOutput(outputId="plot_5")))
                     )))
