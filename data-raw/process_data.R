
library(readr)
library(dplyr)

dat <- read_csv("session_06/app_structure/data-raw/weatherAUS.csv")

dat %>%
  janitor::clean_names() %>%
  group_by(year = lubridate::year(date), location) %>%
  summarise(
    across(
      min_temp:sunshine,
      list(mean = mean, median = median),
      na.rm = TRUE
    ),
    .groups = "drop"
  ) %>%
  mutate(
    across(year, as.integer),
    across(location, as.factor)
  ) %>%
  arrange(location, year) %>%
  saveRDS("session_06/app_structure/app/data/weather_data.rds")
