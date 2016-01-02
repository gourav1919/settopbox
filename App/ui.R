library(shiny)


shinyUI(fluidPage(
  
  # Application title
  titlePanel("Variable Separable Relative Ratings"),
  
  fluidRow(
    
    column(3,
           selectInput("select1", label = h3("Rating Of :"), 
                       choices = list("Genre" = "Genre", "Age" = "Viewer.Age.Range",
                                      "Gender" = "Viewer.Gender","State"="State",
                                      "Customer Since"="Customer.Joining.Year","DVR Model"="DVR.Model",
                                       "Live Or Recorded"="Live.Recorded","Program"="Name.y",
                                        "Channel"="Channel","Airing Day"="AirirngDay",
                                      "Airing Time"="AiringTime","Duration of Program"="Duration"), selected = 1)),
    column(3,
           selectInput("select2", label = h3("with respect to"), 
                       choices = list("Genre" = "Genre", "Age" = "Viewer.Age.Range",
                                      "Gender" = "Viewer.Gender","State"="State",
                                      "Customer Since"="Customer.Joining.Year","DVR Model"="DVR.Model",
                                      "Live Or Recorded"="Live.Recorded","Program"="Name.y",
                                      "Channel"="Channel","Airing Day"="AiringDay",
                                      "Airing Time"="AiringTime","Duration of Program"="Duration"), selected = 2))
    
  ),
 
    mainPanel(
      plotOutput("distPlot"),
      uiOutput("Controls")
    )
  )
)