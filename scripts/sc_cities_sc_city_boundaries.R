# Script that joins the Eviction Data for South Carolina cities with the City Boundaries

# Author: Usman Khaliq
# Version: 2020-01-30

# Libraries
library(tidyverse)

# Parameters
path_sc_cities <- "data/sc_cities.rds"
path_sc_city_boundaries <- "data/sc_city_boundaries.rds"
rds_file_path <- "data/sc_cities_sc_city_boundaries.rds"
#===============================================================================

# Code

read_rds(here::here(path_sc_cities)) %>%
  left_join(
    read_rds(here::here(path_sc_city_boundaries)),
    by = c("geoid" = "city_id")
    ) %>%
  select(-city_name) %>%
  write_rds(
    path = here::here(rds_file_path),
    compress = "gz"
    )
