# dependencies of this script
list.of.packages <- c('tseries', 'TSA', 'ggplot2', 'fpp2')

# load all dependent packages
lapply(list.of.packages, require, character.only = TRUE)

# load data
elec_df <- read.table("./data/StatsSA_Electricity_GWh.csv", sep = ",", 
                      header = TRUE, fileEncoding="UTF-8-BOM", 
                      stringsAsFactors = FALSE, row.names = 'Month')

# create time series object
elec_ts <- ts(elec_df[, 1], start = c(2010, 1), frequency = 12)

# split the data into the model and validation sets
elec_first <- window(elec_ts, start = c(2010, 1), end = c(2014, 12))
elec_second <- window(elec_ts, start = c(2015, 1), end = c(2019, 12))