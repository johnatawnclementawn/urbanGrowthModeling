library(tidyverse)
library(tidycensus)
library(sf)

setwd("C:/Users/henry/Documents/Penn/Spring 2022/CPLN675_LandUseEnvModeling/HW5")
census_api_key("b984db6b084601048019e6f7f64f500a87b01b80", overwrite = TRUE)

acs_vars = c("B01001_001")
counties = c("Adams", "Arapahoe", "Boulder", "Broomfield", "Denver", "Clear Creek", "Douglas", "Gilpin", "Jefferson")

acs_09 <- get_acs(geography = "tract", 
                  state = "Colorado",
                  county = counties,
                  variables = acs_vars, 
                  year = 2009, 
                  output = "wide",
                  geometry = TRUE)

acs_19 <- get_acs(geography = "tract", 
                  state = "Colorado",
                  county = counties,
                  variables = acs_vars, 
                  year = 2019, 
                  output = "wide",
                  geometry = TRUE)

write_sf(acs_09, "drcog.shp")

ggplot(data = acs_09) +
  geom_sf()
