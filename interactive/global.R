library(shiny)
library(leaflet)
library(dplyr)
library(ggplot2)

#df <- readRDS("./df.rds")
df = read.csv('clean_listing.csv', stringsAsFactors = F)
#df[is.na(df)]<- 0
df$accommodates = as.numeric(as.character(df$accommodates))
df[is.na(df)]<- 0
df <- filter(df, !property_type == "181")
df <- filter(df, !property_type == "")
#df$review_scores_rating <- 
