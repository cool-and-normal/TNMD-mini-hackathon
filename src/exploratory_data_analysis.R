#preamble
rm(list=ls()) # clear vars
cat("\014") # clear console
library(tidyverse)
library(lubridate)
library(ggplot2)
library(tsibble)
library(feasts)
library(here)


#setwd("C:\\Users\\Yamni\\Desktop\\TNMD-mini-hackathon\\air_quality_data")


#read data
data<-read.csv(here::here("air_quality_data", "Air_Quality_Monitoring_Data.csv"))

#data cleaning

#Quick eyeballing looks like the data is hourly for the three different locations that we have.
#Going to split up the Date Time column and create some order.
data<- data %>% 
      mutate(DateTime2= dmy_hms(DateTime, tz= "Australia/ACT")) %>% #Thanks Mark!
  arrange(DateTime2)

# Creating three different datasets for each of the three locations as they seem to start at different times

# Some initial exploratory code
#data_monash<- data%>% filter(Name=="Monash") 
#tried converting to tsibble but it looks like there are duplicated values. Looking at these
#duplicates_df<- duplicates(data_monash%>% drop_na()) #this generates a df that has 22 rows 50 of them on 13/07/2022 at 6PM and 2 at 28/07/2022 at 7pm.
# As a general rule, I am going to only select unique rows.

data_monash<- data %>% 
  filter(Name=="Monash") %>% 
  distinct(DateTime2, .keep_all=TRUE) %>% # This is an inbuilt R function. Not sure which value it actually chooses.
  drop_na(DateTime2) %>% 
  as_tsibble(index=DateTime2, key= Name) %>% 
  fill_gaps()

data_civic<- data%>% 
  filter(Name=="Civic") %>% 
  distinct(DateTime2, .keep_all=TRUE) %>% 
  drop_na(DateTime2) %>% 
  as_tsibble(index=DateTime2, key= Name) %>% 
  fill_gaps()

data_florey<- data%>%
  filter(Name=="Florey") %>% 
  distinct(DateTime2, .keep_all=TRUE) %>% 
  drop_na(DateTime2) %>% 
  as_tsibble(index=DateTime2, key= Name) %>% 
  fill_gaps()

data_clean<- bind_rows(data_monash, data_civic, data_florey) # This is a clean time series - all dates/times from the start to end date are covered.
#Where there are missing dates, there are now NAs. 


#### EDA ####
first_date<- min(data_clean$DateTime2)
last_date<- max(data_clean$DateTime2)


AQI_data<-data_clean %>% 
  group_by(Name) %>% 
  summarise(mean_AQI_site= mean(AQI_Site))


#generate a basic TS plot

AQI_data %>% autoplot(mean_AQI_site)

#data_clean$time<-format(as.POSIXct(data_clean$DateTime2), format = "%H:%M:%S")

#AQI_daily<- data_clean %>% 
#  group_by(time) %>% 
#  summarise(mean_AQI_site=mean(AQI_Site)) %>% 
# ggplot(aes(x=time, y= mean_AQI_site, group= DateTime2))+
#  geom_line()

