# Exploratory Data Analysis - Class Assignment 1 - Plot 2
# 
# Author: pmarkt
###############################################################################

## Download data (zipped file) from the specified URL
    url <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
    download.file(url,destfile="./exdata%2Fdata%2Fhousehold_power_consumption.zip")

## Create a sub directory to contain the various directories and files from the zip file
    if (!file.exists("data"))   {
        dir.create("data")
    }
## Unzip the file into the "data" directory
    unzip ("./exdata%2Fdata%2Fhousehold_power_consumption.zip",exdir = "./data")

## Read in the dataset
    hold_table <- read.table("./data/household_power_consumption.txt",sep=";",header=TRUE,stringsAsFactors=FALSE,na.strings="?")
## Select a subset of data where date is 2/1/2007 or 2/2/2007
    working_table <- hold_table[hold_table$Date=="1/2/2007" | hold_table$Date=="2/2/2007",]
## Convert Date and Time from character to a datetime format  
    working_table$DateTime <- as.POSIXct(paste(working_table$Date,working_table$Time),format="%d/%m/%Y %H:%M:%S")  

## Create Plot 2
## Histogram of Global Active Power (in kilowatts)
    with(working_table,plot(DateTime,Global_active_power,type="l",xlab="",ylab="Global Active Power (kilowatts)"))

## Copy chart to PNG file
    dev.copy(png, file = "plot2.png",width=480,height=480) 
    dev.off()