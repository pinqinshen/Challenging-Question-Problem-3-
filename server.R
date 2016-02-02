library(shiny)

if(!require(quantmod))
{
  stop("Please Install quantmod package")
}

require_symbol <- function(symbol,envir=parent.frame()){
  if(is.null(envir[[symbol]])){
    envir[[symbol]] <- getSymbols(symbol,auto.assign=FALSE)
  }
  envir[[symbol]]
}

shinyServer(function(input,output){
  symbol_env  <- new.env()
  make_chart  <- function(symbol){
    symbol_data <- require_symbol(symbol,symbol_env)
    #TA_STR <- paste0()
    chartSeries(symbol_data,
                name=symbol,
                type=input$chart_type,
                subset=paste("last",input$time_num,input$time_unit),
                #log.scale=input$log_y,
                theme="white")
  }
  
  output$plot_1 <- renderPlot({make_chart(input$stock1)})
  output$plot_2 <- renderPlot({make_chart(input$stock2)})
  output$plot_3 <- renderPlot({make_chart(input$stock3)})
  output$plot_4 <- renderPlot({make_chart(input$stock4)})
  output$plot_5 <- renderPlot({make_chart(input$stock5)})
})
  

