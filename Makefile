# Search path
VPATH = data data-raw eda reports scripts

# Processed data files
DATA = sc_cities.rds sc_cities_sc_city_boundaries.rds sc_city_boundaries.rds

# EDA studies
EDA = sc_cities.md

# Reports
REPORTS =

# All targets
all : $(DATA) $(EDA) $(REPORTS)

# Data dependencies
sc_cities.rds : sc_cities.csv
sc_city_boundaries.rds : sc_city_boundaries.geojson
sc_cities_sc_city_boundaries.rds : sc_cities.rds sc_city_boundaries.rds

# EDA study and report dependencies


# Pattern rules
%.rds : %.R
	Rscript $<
%.md : %.Rmd
	Rscript -e 'rmarkdown::render(input = "$<", output_options = list(html_preview = FALSE))'
