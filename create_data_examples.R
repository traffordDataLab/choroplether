# Create the Choroplether example files used on-load and in the documentation
# 2023-06-07 James Austin

library(tidyverse) ; library(jsonlite)

# Create the CSV data from the Census 2021 population estimates for Greater Manchester authorities
df <- read_csv("https://www.trafforddatalab.io/open_data/census2021/population/2021_population_by_sex_la_gm.csv") %>%
    filter(indicator == "All persons") %>%
    mutate(indicator = "Census 2021 population estimates: all usual residents") %>%
    write_csv("data_example.csv")

# Now convert the same data to JSON format
df_json <- df %>%
    toJSON(pretty = TRUE) %>%
    cat(file = "data_example.json") # using cat to save the output rather than write_json as this results in a nicer formatted file (write_json inserts "\n" rather than newline characters)
