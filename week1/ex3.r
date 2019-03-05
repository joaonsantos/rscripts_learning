#!/usr/bin/env Rscript
#
# 3. Download the Excel spreadsheet on Natural Gas Aquisition Program here:
# https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2FDATA.gov_NGAP.xlsx 
# Read rows 18-23 and columns 7-15 into R and assign the result to a variable called:
# dat
# What is the value of:
# sum(dat$Zip*dat$Ext,na.rm=T)

main <- function(){
  library(dplyr)
  library(xlsx)

  fileUrl <- "https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2FDATA.gov_NGAP.xlsx"
  download.file(fileUrl, "gov_gas_data.xlsx", "curl")

  dat <- read.xlsx("gov_gas_data.xlsx", header=TRUE, sheetIndex=1, startRow=18, endRow=23)
  df <- as_tibble(dat)
  dat <- select(df, 7:15)

  result <- sum(dat$Zip*dat$Ext,na.rm=T)

  sprintf("The asked value is %d.", result)
}

main()
