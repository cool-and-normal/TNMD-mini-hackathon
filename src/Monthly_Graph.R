library(readr)
library(dplyr)
library(lubridate)

#Import Data
data<-read_csv("Air_Quality_Monitoring_Data.csv", 
               col_types = cols(Date = col_date(format = "%d %B %Y"),DateTime = col_datetime(format = "%d/%m/%Y %H:%M:%S %p")))

data$month<-floor_date(data$Date, "month")

#Check how many areas exist
unique(data$Name)

#Check Missingness
colSums(is.na(data))


#Split data into areas
civic<-data[data$Name=='Civic',]
monash<-data[data$Name=='Monash',]
florey<-data[data$Name=='Florey',]


#Remove NAs for AQI_Site
civic<-civic[!is.na(civic$AQI_Site),]
monash<-monash[!is.na(monash$AQI_Site),]
florey<-florey[!is.na(florey$AQI_Site),]



#Compute monthly average of AQI_Site for each region
civic_monthly<-civic %>%
  group_by(month) %>%
  summarize(civic_AQI=mean(AQI_Site))

monash_monthly<-monash %>%
  group_by(month) %>%
  summarize(monash_AQI=mean(AQI_Site))

florey_monthly<-florey %>%
  group_by(month) %>%
  summarize(florey_AQI=mean(AQI_Site))

#Merge each region together
monthly<-merge(civic_monthly, monash_monthly)
monthly<-merge(monthly,florey_monthly)

#Plot each series
plot(monthly$month,monthly$civic_AQI, type='l', main='Average Monthly AQI', ylab='AQI', xlab='Date')
lines(monthly$month,monthly$monash_AQI, col='red')
lines(monthly$month,monthly$florey_AQI, col='blue')
legend('topleft', legend=c('Civic', 'Monash', 'Florey'), col=c('black', 'red', 'blue'), lty=1)
