server <- function(input,output, session){
  
  data <- reactive({
    x <- df  
  })
  output$mymap <- renderLeaflet({
    df <- data()
    #ddf <- df[which(df$price>=input$bins[0]&&df$price<=input$bins[1])]
    df <- filter(df, price >=input$price[1])
    df <- filter(df, price <=input$price[2])
    df <- filter(df, number_of_reviews >= input$number_of_reviews[1])
    df <- filter(df, number_of_reviews <= input$number_of_reviews[2])
    
    df <- filter(df, accommodates >= input$accommodates[1])
    df <- filter(df, accommodates <= input$accommodates[2])
    # print(input$housetype)
    # print(c("all",levels(factor(df$property_type))))
    if (input$housetype != "all"){
    df <- filter(df, property_type == input$housetype)}
    if (input$colorby == "property_type"){
      pal <- colorFactor("Set3", df[[input$colorby]])
    }
    else{
      if (input$colorby == "price"){
        price_bin <- c(0,50,100,150,200,250,300,350,400,450,500,9000)
        pal <- colorBin(c("#fa9fb5","#f768a1","#dd3497","#ae017e","#7a0177","#49006a"),
                        bins = price_bin)
      }
      else{
        pal <- colorBin(c("#fa9fb5","#f768a1","#dd3497","#ae017e","#7a0177","#49006a"), 
                        df[[input$colorby]], 6)
      }
    }
    
    v = input$colorby
    getColor <- function(df) {
      sapply(df$v, function(v) {
        m = max(df$v)
        
        if(v <= integer(m/5)) {
          "blue"
        } else if((v <= integer(2*m/5)) & (v > integer(m/5))) {
          "green"
        } else if((v > integer(3*m/5)) & (v <= integer(2*m/5))) {
          "yellow"
        } else if((v <= integer(4*m/5)) & (v > integer(3*m/5))) {
          "orange"
        } else {
          "red"
        }})
    }
    
    icons <- awesomeIcons(
      icon = 'ios-close',
      iconColor = 'black',
      library = 'ion',
      markerColor = getColor(df$v)
    )
    
    m <- leaflet(data = df) %>%
          addTiles() %>%
          addCircles(~longitude, ~latitude, radius=40, layerId=~zipcode,
                 stroke=FALSE, fillOpacity=0.7, color = pal(df[[input$colorby]])) %>% 
      addLegend("bottomright", pal=pal, values=df[[input$colorby]],title=input$colorby,
                      layerId="colorLegend") %>% 
      setView(lng = -122.412, lat = 37.7525, zoom = 12) %>%
        addAwesomeMarkers(~longitude, ~latitude, label = ~zipcode,
                          icon=icons, clusterOptions = markerClusterOptions(),
                          popup = paste("price $", df$price, df$property_type, sep="\n"))
          # addMarkers(lng = ~longitude,
          #            lat = ~latitude,
          #            popup = paste("price", df$price))
    #m
      })
  output$dist <- renderPlot({
    df <- data()
    df <- filter(df, price >=input$price[1])
    df <- filter(df, price <=input$price[2])
    df <- filter(df, number_of_reviews >= input$number_of_reviews[1])
    df <- filter(df, number_of_reviews <= input$number_of_reviews[2])
    if (input$housetype != "all"){
      df <- filter(df, property_type == input$housetype)}
    if (input$host_identity_verified != "all"){
      df <- filter(df, host_identity_verified == input$host_identity_verified)}
    if (input$colorby == "property_type"){
      counts <- table(df[[input$colorby]])
      ggplot(df)+geom_bar(aes(x=df[[input$colorby]],fill = df[[input$colorby]]))+
        theme(axis.title.x=element_blank(),
              #axis.text.x=element_blank(),
              axis.ticks.x=element_blank(),
              axis.title.y=element_blank(),
              axis.text.y=element_blank(),
              axis.ticks.y=element_blank(),
              legend.position="none") +
        labs(x="", y="")+ggtitle(input$colorby)
      #barplot(counts, 
       #       main=input$colorby,
        #      ylab="Number of Listings",
         #     xlab="Type",
          #    col='lightblue')
    }
    else{
      input_type = df[[input$colorby]]
      ggplot(df, aes(x=input_type)) + 
        geom_density() +
        scale_x_continuous(limits = c(min(input_type), max(input_type)))+
        geom_density(color="darkblue", fill="lightblue") +
        theme(axis.title.x=element_blank(),
              #axis.text.x=element_blank(),
              axis.ticks.x=element_blank(),
              axis.title.y=element_blank(),
              axis.text.y=element_blank(),
              axis.ticks.y=element_blank()) +
        labs(x="", y="")+ggtitle(input$colorby)
      
      #hist(df[[input$colorby]],
       #    main=input$colorby,
        #   xlab=input$colorby,
         #  col='lightblue')
          
    }
  })
  # pal <- colorBin("viridis", df$price, 20, pretty = FALSE)
  # leafletProxy("mymap", data = df) %>%
  #   clearShapes() %>%
  #   addCircles(~longitude, ~latitude, radius=100, layerId=~zipcode,
  #              stroke=FALSE, fillOpacity=0.4, fillColor=pal(df$price), 
  #              popup = paste("price", df$price)) %>%
  #   addLegend("bottomleft", pal=pal, values=df$price,
  #             layerId="colorLegend") 
  #%>%
    #addPopups(~longitude, ~latitude, paste("price", df$price))
}
