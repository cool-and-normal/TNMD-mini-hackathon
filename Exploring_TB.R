library(readr)
library(dplyr)


#Import Data
data<-read_csv("Air_Quality_Monitoring_Data.csv", 
         col_types = cols(Date = col_date(format = "%d %B %Y"),DateTime = col_datetime(format = "%d/%m/%Y %H:%M:%S %p")))

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

#Compute daily average of AQI_Site for each region
civic_daily<-civic %>%
  group_by(Date) %>%
  summarize(civic_AQI=mean(AQI_Site))

monash_daily<-monash %>%
  group_by(Date) %>%
  summarize(monash_AQI=mean(AQI_Site))

florey_daily<-florey %>%
  group_by(Date) %>%
  summarize(florey_AQI=mean(AQI_Site))

#Merge each region together
daily<-merge(civic_daily, monash_daily)
daily<-merge(daily,florey_daily)

#Plot each series
plot(daily$Date[1:1740],daily$civic_AQI[1:1740], type='l', main='Average Daily AQI', ylab='AQI', xlab='Date')
lines(daily$Date[1:1740],daily$monash_AQI[1:1740], col='red')
lines(daily$Date[1:1740],daily$florey_AQI[1:1740], col='green')
legend('topleft', legend=c('Civic', 'Monash', 'Florey'), col=c('black', 'red', 'green'), lty=1)
