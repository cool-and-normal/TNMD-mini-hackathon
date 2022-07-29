# TNMD Hackathon Theme 2 - Open Data - ACT Air quality monitoring data

## Introduction

The ACT government is required to report on air quality to monitor compliance with NEPC standards (National Environmental Protection Council). In addition to providing live information from air quality monitoring stations and publishing the data in annual reports, archival data is available through the Australian Govenrment's open data portal: [data.gov.au](https://data.gov.au/dataset/ds-act-https%3A%2F%2Fwww.data.act.gov.au%2Fapi%2Fviews%2F94a5-zqnn/details?q) 

This dataset has the potential to allow users to look more closely into specific events than would be possible using the year-long time series that are published. However the data is described as unverified - meaning that it has undergone minimal or no quality assurance checks. Additionally, there is no summary of what is contained in the dataset.

## Aim

This document will complement the ACT air quality dataset by providing a summary of the contents and range of the data and basic information about the data quality. It also contains some example visualisations focussing on adverse Air Quality events triggered by bushfires to show the potential value of the open access dataset

## Dataset summary

Air quality is recorded at 3 sites across the ACT at the top of each hour, the data availability varies by site and for some data items is missing for long periods of time. 

| Site name | Coordinates | Data Availability|
|---|---|---|
|Civic (Central Canberra)|(-35.285399, 149.131536)|Since Jan 2012|
|Florey (North Canberra)|(-35.220606, 149.0435)|Since Feb 2014|
|Monash (South Canberra)|(-35.418302, 149.094018)|Since Jan 2012|

At time of writing the most recent data was for 2022-07-28 13:00:00 AEST

## Data items

|Data item name|Description/unit|
|---|---|
|Name|Location of sensor|
|GPS|Latitude and longitude|
|DateTime|dd/mm/yyyy hh:mm|
|NO2|NO2 concentration averaged over 1 hour in ppm|
|O3_1hr|O3 concentration averaged over 1 hours in ppm|
|O3_4hr|O3 concentration averaged over 4 hours in ppm|
|O3_8hr|O3 concentration averaged over 8 hours in ppm|
|CO|NO2 concentration averaged over 8 hours in ppm|
|PM10.1.hr|P10 particulates averaged over 1 hour in ug/m^3|
|PM2.5.1.h|P2.5 particulates averaged over 1 hour in ug/m^3|
|PM10|P10 particulates averaged over 24 hours in ug/m^3|
|PM2.5|P2.5 particulates averaged over 24 hours in ug/m^3|
|AQI_CO|CO component of Air Quality Index|
|AQI_NO2|NO2 component of Air Quality Index|
|AQI_O3_1hr|1 hour O3 component of Air Quality Index|
|AQI_O3_4hr|4 hour O3 component of Air Quality Index|
|AQI_O3_8hr|8 hour O3 component of Air Quality Index|
|AQI_PM10|component of Air Quality Index|
|AQI_PM2.5|component of Air Quality Index|
|AQI_Site|Overall Air quality index for the measurement site|
|Date|Date in  dd/ month/ YYYY|
|Time||
|Time mostly HH:MM||


### Data Cleaning steps

Removed duplicate date times, and added missing date times to complete time series

## Data quality

Duplicate rows

Missing records

## Case study visualisations

## Key links

[Air Quality Monitoring Data @ data.gov.au](https://data.gov.au/dataset/ds-act-https%3A%2F%2Fwww.data.act.gov.au%2Fapi%2Fviews%2F94a5-zqnn/details?q)

[Information on ACT Air quality monitoring including "live" monitoring](https://www.health.act.gov.au/about-our-health-system/population-health/environmental-monitoring/monitoring-and-regulating-air)


[ACT Air Quality reports](https://www.accesscanberra.act.gov.au/s/article/air-pollution-tab-related-resources)


[Description of the Air Quality Index calculation (AQI)](https://www.health.act.gov.au/about-our-health-system/population-health/environmental-monitoring/air-quality/measuring-air)







