library(tidyverse)
library(lubridate)

df <- read_csv("C:/Users/Mark/Documents/git/TNMD-mini-hackathon/air_quality_data/Air_Quality_Monitoring_Data.csv")
df <- df %>% mutate(DateTime2= dmy_hms(DateTime, tz="Australia/ACT"))

# NA counts
na_count <-sapply(df, function(y) sum(length(which(is.na(y)))))

# Bad plots
ggplot(df, aes(x=DateTime2,y=NO2, colour = Name)) + geom_point()
ggplot(df, aes(x=DateTime2,y=CO, colour = Name)) + geom_point()