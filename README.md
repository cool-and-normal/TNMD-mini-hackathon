# TNMD Hackathon Theme 2 - Open Data - ACT Air quality monitoring data

## Introduction

The ACT government is required to report on air quality to monitor compliance with NEPC standards (National Environmental Protection Council). In addition to providing live information from air quality monitoring stations and publishing the data in annual reports, archival data is available through the Australian Govenrment's open data portal: [data.gov.au](https://data.gov.au/dataset/ds-act-https%3A%2F%2Fwww.data.act.gov.au%2Fapi%2Fviews%2F94a5-zqnn/details?q) 

This dataset has the potential to allow users to look more closely into specific events than would be possible using the year-long time series that are published. However the data is described as unverified - meaning that it has undergone minimal or no quality assurance checks. Additionally, there is no summary of what is contained in the dataset.

## Aim

This document will complement the ACT air quality dataset by providing a summary of the contents and range of the data and basic information about the data quality. It also contains some example visualisations focussing on adverse Air Quality events triggered by bushfires to show the potential value of the open access dataset

## Dataset summary

Air quality is recorded at 3 sites blah blah
Table 3 rows data
Site name (location) - coordinates - data available from this date

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

## Data quality

Some issues observed with the original dataset were:

- The reference period of the data was not provided upfront.
- The dataset was not sorted in any particular order. Given the time series nature of the data it would be useful to sort it by location and time.
- There are missing observations, most notably the latter part of 2012 and all of 2013.
- Duplicate records for the same location and time with different observation measurements. It would be useful to have information on why duplicates occur to inform which observations should be used.

Duplicate rows

Missing records

## Case study visualisations


## Key links

[Air Quality Monitoring Data @ data.gov.au](https://data.gov.au/dataset/ds-act-https%3A%2F%2Fwww.data.act.gov.au%2Fapi%2Fviews%2F94a5-zqnn/details?q)

[Information on ACT Air quality monitoring including "live" monitoring](https://www.health.act.gov.au/about-our-health-system/population-health/environmental-monitoring/monitoring-and-regulating-air)


[ACT Air Quality reports](https://www.accesscanberra.act.gov.au/s/article/air-pollution-tab-related-resources)


[Description of the Air Quality Index calculation (AQI)](https://www.health.act.gov.au/about-our-health-system/population-health/environmental-monitoring/air-quality/measuring-air)







