setwd("C:/.../Exploratory-Data-Analysis") ##set working directory

fileUrl <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip" ##assign file url to handle
download.file(fileUrl, destfile = "./exdata-data-household_power_consumption.zip") ##download file and designate destination

unzip("./exdata-data-household_power_consumption.zip") ##unzip file in working directory

mydata = read.table("household_power_consumption.txt", header=TRUE, sep = ";", na.strings = "?") ## read txt file with header, separate data by semicolon, nas are identified as "?" symbol 

subdata <- subset(mydata, mydata$Date == "1/2/2007"| mydata$Date == "2/2/2007") ##subset data by first date OR second date

library(graphics) ##plotting functions for the "base" graphing systems, including plot, hist, boxplot and many others.
library(grDevices) ##contains all the code implementing the various graphics devices, including X11, PDF, PostScript, PNG, etc.

png(file="plot3.png", bg="transparent") ##open png file

dates <- subdata$Date ##assign date column to dates
times <- subdata$Time ##assign time column to times
timedate <- paste(dates, times) ## assign timedate to combined dates and times vectors
fortimedate <- strptime(timedate, "%d/%m/%Y %H:%M:%S") ##format timedate and assign to fortimedate
subdata$Time = fortimedate ##change time column to fortimedate
with(subdata, plot(Time, Sub_metering_1, ylab = "Energy sub metering", xlab = "", type="l")) ##plot Time on x-axis (not named), Energy sub metering 1 on y-axis (named), and in line style
with(subdata, points(Time, Sub_metering_2, ylab = "Energy sub metering", xlab = "", type="l", col = "red")) ##plot Time on x-axis (not named), Energy sub metering 2 on y-axis (named), and in line style, color red
with(subdata, points(Time, Sub_metering_3, ylab = "Energy sub metering", xlab = "", type="l", col = "blue")) ##plot Time on x-axis (not named), Energy sub metering 3 on y-axis (named), and in line style, color blue
legend("topright", lty = 1, col = c("black", "red", "blue"), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3")) ##create legend in top right, line style, color and text

dev.off() ##close png