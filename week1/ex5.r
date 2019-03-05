#!/usr/bin/env Rscript
#
# 5. The American Community Survey distributes downloadable data about United States
# communities. Download the 2006 microdata survey about housing for the state of 
# Idaho using download.file() from here: 
# https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2Fss06pid.csv
# using the fread() command load the data into an R object
# DT
# Calculate the average value of the variable pwgtp15
main <- function(){
  library(dplyr)
  library(data.table)

  fileUrl <- "https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2Fss06pid.csv"
  download.file(fileUrl, "survey_data.csv", "curl")

  DT <- fread("survey_data.csv")
  mean <- mean(DT$pwgtp15,by=DT$SEX)
# time <- system.time(mean(DT$pwgtp15,by=DT$SEX))

  sprintf("The asked average is %f.", mean)
}

main()
