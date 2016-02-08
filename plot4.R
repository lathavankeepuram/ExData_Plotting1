

## R code  for plot4

## Get the Data

		setwd("~/CourseraDataScience/ExplorationofData/Week1Assignment")

		if(!file.exists("./data")){dir.create("./data")}

		fileUrl <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"

		download.file(fileUrl,destfile="./data/Dataset.zip") 
    
	## Unzipping the file

		unzip(zipfile ="./data/Dataset.zip",exdir="./data")

## Reading whole file

		mainfile <- read.table("./data/household_power_consumption.txt", header=TRUE,sep=";", stringsAsFactors=FALSE,dec=".",na.strings = "?")


## Converting Date column from character to Date datatype

		mainfile$Date <- as.Date(mainfile$Date, format="%d/%m/%Y")

## Subsetting it to only data from 2 days

		subsetfile <- mainfile[(mainfile$Date=="2007-02-01") | (mainfile$Date=="2007-02-02"),]

## Remove mainfile from memory

		rm(mainfile)

## Creating Datetime variable

		DateTime <- paste(as.Date(subsetfile$Date), subsetfile$Time)

		subsetfile$Datetime <- as.POSIXct(DateTime)


## Handling data types 

		subsetfile$Global_active_power <- as.numeric(as.character(subsetfile$Global_active_power))

		subsetfile$Global_reactive_power <- as.numeric(as.character(subsetfile$Global_reactive_power))

		subsetfile$Voltage <- as.numeric(as.character(subsetfile$Voltage))

		subsetfile$Sub_metering_1 <- as.numeric(as.character(subsetfile$Sub_metering_1))

		subsetfile$Sub_metering_2 <- as.numeric(as.character(subsetfile$Sub_metering_2))

		subsetfile$Sub_metering_3 <- as.numeric(as.character(subsetfile$Sub_metering_3))

		
## PLOT 4
		
		par(mar =c(4,4,3,2))

		par(mfrow = c(2,2))

		plot(subsetfile$Datetime,subsetfile$Global_active_power, type="l",ylab="Global Active Power", xlab="")

		plot(subsetfile$Datetime,subsetfile$Voltage, type="l", ylab="Voltage", xlab="datetime")

		plot(subsetfile$Datetime, subsetfile$Sub_metering_1, type="l", ylab="Energy Submetering", xlab="")

		lines(subsetfile$Datetime, subsetfile$Sub_metering_2, type="l", col="red")

		lines(subsetfile$Datetime, subsetfile$Sub_metering_3, type="l", col="blue")

		legend("top", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty= 1, lwd=2, col=c("black", "red", "blue"), cex=0.70, bty = "n")

		plot(subsetfile$Datetime,subsetfile$Global_reactive_power, type="l", ylab="Global_reactive_power", xlab="datetime")

		dev.copy(png, file="plot4.png")

		dev.off()
    