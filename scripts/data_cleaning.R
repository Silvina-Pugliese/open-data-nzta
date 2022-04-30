selected_data = raw_data %>%
  select(crashYear, crashSeverity, region, bicycle,
         carStationWagon, motorcycle, pedestrian)

unique_values = function(df){
  for (i in 1:length(df)){
    df[,i] %>%
      unique() %>%
      print()
  }
}

unique_values(selected_data)

# remove rows with unknown region
clean_data = selected_data %>%
  filter(region != "")

unique_values(clean_data)

# remove the word "region" from region names
clean_data$region <- gsub(" Region", "", clean_data$region)

unique_values(clean_data)

# correct regiona name "ManawatÅ«-Whanganui"
clean_data$region[clean_data$region == "ManawatÅ«-Whanganui"] = "Manawatu-Whanganui"

unique_values(clean_data)

names(clean_data) <- c("year", "severity", "region", "num_bikes",
                       "num_cars", "num_motorcycles", "num_pedestrian")