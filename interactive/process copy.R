df = read.csv('clean_listing.csv', stringsAsFactors = F)

# df <- tidyr::separate(data = df,
#                       col = location.1,
#                       into = c("Latitude", "Longitude"),
#                       sep = ","
#                       remove = FALSE)

# df_reduce <- df[sample(1:length(df$id),1000),]
saveRDS(df, "./df.rds")
