# Exploratory Data Analysis - Class Assignment 1 - Plot 4
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

## 4 figures arranged in 2 rows and 2 columns
## cex controls the size of the axis labels and the numbers on the axes
## mgp controls the distance of the text from the axes
## mar sets margins on each graph so that all axis labels are visible and graphs have appropriate separation
par(mfcol=c(2,2),mar=c(4,4,1,1),cex.axis=.75,cex.lab=.75,mgp=c(2,.5, 0))

## Create first plot
## Histogram of Global Active Power (in kilowatts)
    with(working_table,plot(DateTime,Global_active_power,type="l",xlab="",ylab="Global Active Power"))

## Create second plot
## Plot of energy sub-metering values
    plot(working_table$DateTime,working_table$Sub_metering_1,type="l",xlab="",ylab="Energy sub metering")
         lines(working_table$DateTime,working_table$Sub_metering_2,col="red")
         lines(working_table$DateTime,working_table$Sub_metering_3,col="blue")
         legend('topright',names(working_table)[7:9],lty=1,col=c('black','red','blue'),bty='n',cex=.5)

## Create third plot
## Plot of Voltage
    plot(working_table$DateTime,working_table$Voltage,type="l",xlab="datetime",ylab="Voltage")

## Create fourth plot
## Plot of global reactive power
    plot(working_table$DateTime,working_table$Global_reactive_power,xlab="datetime",type="l",ylab="Global_reactive_power")

## Copy chart to PNG file
    dev.copy(png, file = "plot4.png",width=480,height=480) 
    dev.off()