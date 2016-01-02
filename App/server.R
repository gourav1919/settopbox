library(shiny)
source("STB.R")

shinyServer(function(input, output) {
  
    output$Controls <- renderUI({
    choice  <- (input$select2)
    
    selectInput("select3", "Choose Sub-Category",choices = list("choose"=levels(temp[,choice])))
    })
    output$distPlot <- renderPlot({
    x <- VSRR(input$select2,input$select1)
    x$compare <- rownames(x)
    k <- input$select3
    qplot(x$compare,x[,k],ylim=c(0,10),geom="density",size=2,col=x$compare,xlab=input$select1,ylab = "Rating",main=k)+theme(legend.position = "none",panel.background = element_blank(),axis.line=element_line(colour="black"))
    #qplot(x$compare, x[,k],ylim=c(0,10),geom = "point",col=x$compare)
    
  })
})