EDA on Eviction Data from South Carolina’s Cities
================
Usman Khaliq
2020-01-29

  - [Section 1](#section-1)

``` r
# Libraries
library(tidyverse)

# Parameters

#===============================================================================
dataset_link <- "/data/sc_cities.rds"
# Code
```

## Section 1

In this analysis, we would like to find out the city in South Carolina
which had the most evictions.

First, let’s read the data about the evictions from cities in South
Carolina.

``` r
city_dataset <- read_rds(here::here(dataset_link))
glimpse(city_dataset)
```

    ## Observations: 397
    ## Variables: 4
    ## $ geoid     <dbl> 4500100, 4500550, 4500775, 4500955, 4501360, 4501450, 45018…
    ## $ year      <dbl> 2016, 2016, 2016, 2016, 2016, 2016, 2016, 2016, 2016, 2016,…
    ## $ name      <chr> "Abbeville", "Aiken", "Alcolu", "Allendale", "Anderson", "A…
    ## $ evictions <dbl> 57.53, 465.05, 4.28, 24.17, 641.77, 66.57, 0.14, NA, 15.04,…

``` r
city_dataset %>% 
  arrange(desc(evictions)) %>% 
  top_n(1, evictions)
```

    ## # A tibble: 1 x 4
    ##     geoid  year name             evictions
    ##     <dbl> <dbl> <chr>                <dbl>
    ## 1 4550875  2016 North Charleston     3660.

The city of North Charleston in South Carolina had the most evictions,
at 3660.
