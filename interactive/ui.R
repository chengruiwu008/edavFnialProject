dirui <- fluidPage(
  titlePanel("Airbnb Listing"),
  
  # fluidrow layout ----
  fluidRow(
    
    # first 3 column for input ----
    column(3,
           wellPanel(
             # Input: Slider for the number of bins ----
             selectInput(inputId = "colorby",
                         label = "Color by",
                         c("price","number_of_reviews","property_type","review_scores_rating","accommodates"),
                         selected = "price"),
             plotOutput("dist",height=150),
             sliderInput(inputId = "price",
                         label = "Price range:",
                         min = min(df$price),
                         max = max(df$price),
                         value = c(min(df$price),max(df$price))),
      
             sliderInput(inputId = "number_of_reviews",
                         label = "number_of_reviews:",
                         min = min(df$number_of_reviews),
                         max = max(df$number_of_reviews),
                         value = c(min(df$number_of_reviews),max(df$number_of_reviews))),
    
             sliderInput(inputId = "review_scores_rating",
                         label = "review_scores_rating:",
                         min = min(df$review_scores_rating),
                         max = max(df$review_scores_rating),
                         value = c(min(df$review_scores_rating),max(df$review_scores_rating))),
             
             sliderInput(inputId = "accommodates",
                         label = "accommodates:",
                         min = min(df$accommodates),
                         max = max(df$accommodates),
                         value = c(min(df$accommodates),max(df$accommodates))),
             
             selectInput(inputId = "housetype",
                         label = "housetpye",
                         c("all",levels(factor(df$property_type))),
                         selected = "all"),
             
             selectInput(inputId = "host_identity_verified",
                         label = "host_identity_verified",
                         c("all",c("t","f")),
                         selected = "all")
             
             )
           
           
    ),
    
    
     # for displaying outputs ----
     column(9,
      
      # Output: Histogram ----
      # plotOutput(outputId = "distPlot"),
      
      leafletOutput("mymap",width = "100%", height = 650)
      
    )
    # absolutePanel(id = "controls", class = "panel panel-default", fixed = TRUE,
    #               draggable = TRUE, top = 60, left = "auto", right = 20, bottom = "auto",
    #               width = 300, height = "auto",
    #                
    #               )
)
)
