# TNMD Hackathon Theme 2 - Open Data - ACT Air quality monitoring data

## Key links

[Air Quality Monitoring Data @ data.gov.au](https://data.gov.au/dataset/ds-act-https%3A%2F%2Fwww.data.act.gov.au%2Fapi%2Fviews%2F94a5-zqnn/details?q)

[Information on ACT Air quality monitoring including "live" monitoring](https://www.health.act.gov.au/about-our-health-system/population-health/environmental-monitoring/monitoring-and-regulating-air)

## Some description of data. (it's very rough maybe we can make a pretty table)

The raw Air_Quality_Monitoring_Data.csv contains the following columns:

 1) "Name"- Location of sensor, 3 unique values- "Florey", "Monash", "Civic"
 2) "GPS"
 3) "DateTime" - Start date: "2012-01-01 07:00:00 AEDT", End date: "2022-07-28 13:00:00 AEST"
 4) "NO2"
 5) "O3_1hr"
 6) "O3_4hr"
 7) "O3_8hr"
 8) "CO"
 9) "PM10.1.hr" 
10) "PM2.5.1.hr"
11) "PM10"
12) "PM2.5"
13) "AQI_CO"
14) "AQI_NO2"
15) "AQI_O3_1hr"
16) "AQI_O3_4hr"
17) "AQI_O3_8hr"
18) "AQI_PM10"
19) "AQI_PM2.5"
20) "AQI_Site"
21) "Date": Date in  dd/ month/ YYYY
22) "Time" : Time mostly HH:MM but some different formats in there



Data Cleaning:

Dates: removed duplicate date times, added missing date times to complete time series



