#!/usr/bin/env Rscript
#
# 4. Read the XML data on Baltimore restaurants from here:
# https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2Frestaurants.xml 
# How many restaurants have zipcode 21231?

main <- function(){
  library(dplyr)
  library(XML)

  fileUrl <- "https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2Frestaurants.xml"
  download.file(fileUrl, "restaurant_data.xlsx", "curl")

  doc <- xmlTreeParse("restaurant_data.xml", useInternal=TRUE)
  rootNode <- xmlRoot(doc)
  zipcode_list <- xpathSApply(rootNode, "//zipcode[text()='21231']", xmlValue)

  result <- length(zipcode_list)

  sprintf("There are %d restaurants with zipcode 21321.", result)
}

main()
