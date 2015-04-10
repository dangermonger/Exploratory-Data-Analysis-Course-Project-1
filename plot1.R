setwd("C:/.../Exploratory-Data-Analysis") ##set working directory

fileUrl <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip" ##assign file url to handle
download.file(fileUrl, destfile = "./exdata-data-household_power_consumption.zip") ##download file and designate destination

unzip("./exdata-data-household_power_consumption.zip") ##unzip file in working directory

mydata = read.table("household_power_consumption.txt", header=TRUE, sep = ";", na.strings = "?") ## read txt file with header, separate data by semicolon, nas are identified as "?" symbol 

subdata <- subset(mydata, mydata$Date == "1/2/2007"| mydata$Date == "2/2/2007") ##subset data by first date OR second date

library(graphics) ##plotting functions for the "base" graphing systems, including plot, hist, boxplot and many others.
library(grDevices) ##contains all the code implementing the various graphics devices, including X11, PDF, PostScript, PNG, etc.

png(file="plot1.png", bg="transparent") ##open png file

hist(subdata$Global_active_power, main = "Global Active Power", xlab = "Global Active Power (kilowatts)", col = "red") ##populate png file with histogram, rename title and labels, color red

dev.off() ##close png