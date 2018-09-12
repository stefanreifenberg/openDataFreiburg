library(tidyverse)
library(ggradar)
library(scales)

# example 
mtcars %>%
  add_rownames( var = "group" ) %>%
  mutate_each(funs(rescale), -group) %>%
  tail(4) %>% select(1:10) -> mtcars_radar

ggradar(mtcars_radar) 


data <- read.csv("data_freiburg.csv", sep = ";")

data %>% 
  filter(Monat.Jahresdurchschnitt %in% c("Jahresdurchschnitt")) -> mean_climate



#names(temp_month) <- c("Year", "Month", "meanTemp")
