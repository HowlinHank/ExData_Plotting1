##plot3.R
##Created by: HowlinHank
##Creation date: 2015-7-7

#set the working directory to where you have downloaded the Electric power consumption from
#the UCI Machine Learning Repository
#https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip
#unzip the file first, it is rather large

#data is a semicolon delimited text file with a header.
#the data appears to be a continuous set of readings every minute

##USAGE
#
#Set working directory to where household_power_consumption.txt is stored
#Source this file
#It will show the Energy sub metering used vs time between 2007-02-01 to 2007-02-02
#It will then plot this in a file called plot3.png stored in the same directory
#
# - It will read the file 
# - A new column is formed called timect which is the POSIXct time from the Date and Time cols.
# - Filter to the dates 2007-02-01 to 2007-02-02
# - Plot a histogram to the screen
# - Open a PNG file called plot3.png with 480x480 pixels
# - Plot a histogram to the PNG file


#setwd("~/rdata/ExpDataAnal-Proj1/exdata-data-household_power_consumption")
library(dplyr)
data <- read.table("household_power_consumption.txt", header=TRUE, na.strings="?", sep=";",
                   colClasses="character")

#Need to convert to a time format so that we can filter them next
#You can not mutate a POSIXlt so need to convert to POSIXct
data <-mutate(data, timect= as.POSIXct(strptime(paste(Date, Time, sep=" "),"%d/%m/%Y %H:%M:%S")))
data_f <- filter(data, timect>=as.POSIXct("2007-02-01 00:00:00"), 
                 timect<as.POSIXct("2007-02-03 00:00:00"))

with(data_f, plot(timect, Sub_metering_1, xlab="", ylab="Energy sub metering",
                  type="n"))

with(data_f, points(timect, Sub_metering_1, type="l"))
with(data_f, points(timect, Sub_metering_2, type="l", col="red"))
with(data_f, points(timect, Sub_metering_3, type="l", col="blue"))
legend("topright", lty, lwd=1, col = c("black", "red", "blue"),
      legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
png(filename="plot3.png", width=480, height=480)
with(data_f, plot(timect, Sub_metering_1, xlab="", ylab="Energy sub metering",
                  type="n"))

with(data_f, points(timect, Sub_metering_1, type="l"))
with(data_f, points(timect, Sub_metering_2, type="l", col="red"))
with(data_f, points(timect, Sub_metering_3, type="l", col="blue"))
legend("topright", lty, lwd=1, col = c("black", "red", "blue"),
       legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
dev.off()