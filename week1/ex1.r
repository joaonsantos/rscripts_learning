#!/usr/bin/env Rscript
#
# 1. The American Community Survey distributes downloadable data 
# about United States communities. Download the 2006 microdata survey 
# about housing for the state of Idaho using download.file() from here:
#
# https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2Fss06hid.csv
#
# and load the data into R. The code book, describing the variable names is here:
#
# https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2FPUMSDataDict06.pdf
#
# How many properties are worth $1,000,000 or more?

main <- function(){
  library(dplyr)
  fileUrl <- "https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2Fss06hid.csv"

  download.file(fileUrl, "american_community_survey.csv", "curl")

  dat <- read.csv("american_community_survey.csv", header=TRUE)
  df <- as_tibble(dat)
  property_val <- select(df, VAL)

  properties_with_wanted_val <- filter(property_val, VAL == 24)
  result <- summarize(properties_with_wanted_val, n())
  result <- as.numeric(result)

  sprintf("There are %d properties worth more than $1.000.000.", result)
}

main()
