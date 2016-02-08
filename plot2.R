

## R code  for plot2

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
		
## PLOT 2

		plot(subsetfile$Datetime,subsetfile$Global_active_power, type="l",ylab="Global Active Power (kilowatts)", xlab="")

		dev.copy(png, file="plot2.png", height=480, width=480)

		dev.off()
