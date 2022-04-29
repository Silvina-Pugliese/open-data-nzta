library(httr)
library(jsonlite)
library(dplyr)

query_url = " "

query_data = httr::GET(query_url)

query_json = httr::content(query_data, as = 'text')

data_list = jsonlite::fromJSON(query_json)

glimpse(data_list$features)

df = data_list$features$attributes

df_geo = data_list$features$geometry
