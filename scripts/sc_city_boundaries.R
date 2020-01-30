# Download: SC City boundaries Data
# Supplier: Eviction Lab at Princeton University(https://evictionlab.org/)

# Author: Usman Khaliq
# Version: 2020-01-29

# Libraries
library(tidyverse)


# Parameters
url_data <- "https://eviction-lab-data-downloads.s3.amazonaws.com/SC/cities.geojson"
path_raw_data <- "data-raw/sc_city_boundaries.geojson"
rds_file_path <- "data/sc_city_boundaries.rds"

#===============================================================================

# Code

url_data %>%
  sf::read_sf(as_tibble = TRUE) %>%
  select(
    city_id = `GEOID`,
    city_name = `n`,
    geometry
  ) %>%
  mutate(city_id = as.double(city_id)) %>%
  write_rds(
    path = here::here(rds_file_path),
    compress = "gz"
    )

download.file(
  url_data,
  destfile = here::here(path_raw_data),
  method = "libcurl"
  )

