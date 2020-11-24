# dependencies of this script
list.of.packages <- c('dplyr', 'magrittr')

# install packages if not already installed
for (package in list.of.packages){
  if (!require(package)) install.packages(package); 
}

# load all dependent packages
lapply(list.of.packages, require, character.only = TRUE)

# set working directory and load the data
setwd("C:/Users/gouws/Google Drive/UNISA/HRSTA82 - Research Project in Statistics/Research Project/SARIMA_forecasts")
elec_df <- read.table("./data/StatsSA_Electricity_GWh.csv", sep = ",", header = TRUE, fileEncoding="UTF-8-BOM", stringsAsFactors = FALSE)

elec_df %<>% mutate(Month=as.Date(paste("01", substr(Month, 3, 10), sep = ""), format="%d%m%Y"))
