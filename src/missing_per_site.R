library(tidyverse)
library(lubridate)
library(tsibble)

data <- read.csv("C:/Users/Mark/Documents/git/TNMD-mini-hackathon/air_quality_data/Air_Quality_Monitoring_Data.csv")
data<- data %>% 
  mutate(DateTime2= dmy_hms(DateTime, tz= "Australia/ACT")) %>% #Thanks Mark!
  arrange(DateTime2)

# Overall count of NAs per variable
na_count <-sapply(data, function(y) sum(length(which(is.na(y)))))
na_count

# Missing data per site
data %>% group_by(Name) %>%
  summarise(pct_missing_DateTime2=100*mean(is.na(DateTime2)),
            pct_missing_NO2=100*mean(is.na(NO2)),
            pct_missing_CO=100*mean(is.na(CO)),
            pct_missing_O3_1hr=100*mean(is.na(O3_1hr)),
            pct_missing_O3_4hr=100*mean(is.na(O3_4hr)),
            pct_missing_O3_8hr=100*mean(is.na(O3_8hr)),
            pct_missing_PM10.1.hr=100*mean(is.na(PM10.1.hr)),
            pct_missing_PM2.5.1.hr=100*mean(is.na(PM2.5.1.hr)),
            pct_missing_PM10=100*mean(is.na(PM10)),
            pct_missing_PM2.5=100*mean(is.na(PM2.5)),
            pct_missing_AQI_CO=100*mean(is.na(AQI_CO)),
            pct_missing_AQI_NO2=100*mean(is.na(AQI_NO2)),
            pct_missing_AQI_03_1hr=100*mean(is.na(AQI_O3_1hr)),
            pct_missing_AQI_03_4hr=100*mean(is.na(AQI_O3_4hr)),
            pct_missing_AQI_03_8hr=100*mean(is.na(AQI_O3_8hr)),
            pct_missing_AQI_PM10=100*mean(is.na(AQI_PM10)),
            pct_missing_AQI_PM2.5=100*mean(is.na(AQI_PM2.5)),
            pct_missing_AQI_Site=100*mean(is.na(AQI_Site))
  ) %>% ungroup()