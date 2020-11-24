# dependencies of this script
list.of.packages <- c('xts')

# load all dependent packages
lapply(list.of.packages, require, character.only = TRUE)

# load data
elec_df <- read.table("./data/StatsSA_Electricity_GWh.csv", sep = ",", 
                      header = TRUE, fileEncoding="UTF-8-BOM", 
                      stringsAsFactors = FALSE, row.names = 'Month')

# remove 'MO' from index and prepend 01 as a default day to enable conversion to date
rownames(elec_df) <- paste("01", substr(rownames(elec_df), 3, 10), sep = "")

# convert to xts object
elec_xts <- xts(elec_df, order.by = as.Date(rownames(elec_df), format="%d%m%Y"))