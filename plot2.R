#Reading data
fileData <- read.table("household_power_consumption.txt", header = TRUE, sep = ";", stringsAsFactors=FALSE, dec=".")

#subsetting data for dates 2007-02-01 and 2007-02-02
dataSubset <- fileData[fileData$Date %in% c("1/2/2007","2/2/2007") ,]

#X-axis data
dateTime <- strptime(paste(dataSubset$Date, dataSubset$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 

#y-axis data
globalActivePower <- as.numeric(dataSubset$Global_active_power)

#Open png graphic decice
png("plot2.png", width=480, height=480)
plot(dateTime, globalActivePower, type="l", xlab="", ylab="Global Active Power (kilowatts)")

#Closing png graphic device
dev.off()