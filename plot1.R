##plot1.R
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
#It will show a histogram for Global Active Power (Kw) between 2007-02-01 to 2007-02-02
#It will then plot this in a file called plot1.png stored in the same directory
#
# - It will read the file 
# - Convert the Date column to a Date type, 
# - Filter to the dates 2007-02-01 to 2007-02-02
# - Convert the Global_active_power column into a numeric
# - Plot a histogram to the screen
# - Open a PNG file called plot1.png with 480x480 pixels
# - Plot a histogram to the PNG file


#setwd("~/rdata/ExpDataAnal-Proj1/exdata-data-household_power_consumption")
library(dplyr)
data <- read.table("household_power_consumption.txt", header=TRUE, na.strings="?", sep=";",
                   colClasses="character")
data$Date <- as.Date(data$Date, "%d/%m/%Y")
data_f <- filter(data, Date>="2007-02-01", Date<="2007-02-02")

data_f$Global_active_power <- as.numeric(data_f$Global_active_power)
hist(data_f$Global_active_power, xlab="Global Active Power (kilowatts)", 
       col="red", main="Global Active Power")
png(filename="plot1.png", width=480, height=480)
hist(data_f$Global_active_power, xlab="Global Active Power (kilowatts)", 
     col="red", main="Global Active Power")
dev.off()