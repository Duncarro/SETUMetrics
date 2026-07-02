library(tidyverse)
library(jsonlite)

data <- fromJSON("data/raw/data.json")

data_split <- data |> 
  unnest(c(I1, I2, I3, I4, I5, I6, I7, I8, I9, I10, I11, I12, I13), names_sep ="-") 

#median dataset
data_median <- data_split |> 
  slice(seq(2, n(), by = 2))

#mean dataset 
data_mean <- data_split |> 
  slice(seq(1, n(), by = 2))


#formatting dataset
data_median <-  as_tibble(data_median) |> 
  select(-"agg_score")
data_mean <-  as_tibble(data_mean) |> 
  select(-"agg_score")




##Export dataset
write.csv(data_mean, "data/clean/data_mean.csv")
write.csv(data_median, "data/clean/data_median.csv")