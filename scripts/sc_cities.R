# Download: Cities Eviction Data for South Carolina
# Supplier: Eviction Lab at Princeton University(https://evictionlab.org/)
# https://data-downloads.evictionlab.org/

# Author: Usman Khaliq
# Version: 2020-01-29

# Libraries
library(tidyverse)
library(here)

# Parameters

url_data <- "https://eviction-lab-data-downloads.s3.amazonaws.com/SC/cities.csv"
path_raw_data <- "data-raw/sc_cities.csv"
rds_file_path <- "data/sc_cities.rds"

vars_select <-
  cols_only(
    `GEOID` = col_double(),
    `year` = col_double(),
    `name` = col_character(),
    `evictions` = col_double()
  )

vars_rename <- c(
  geoid = "GEOID"
)
#===============================================================================


url_data %>%
  vroom::vroom(col_types = vars_select) %>%
  rename(!!! vars_rename) %>%
  filter(year == 2016) %>%
  write_rds(
    path = here::here(rds_file_path),
    compress = "gz"
    )

download.file(
  url_data,
  destfile = here::here(path_raw_data),
  method = "libcurl"
  )
