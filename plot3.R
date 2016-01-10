#Reading data
fileData <- read.table("household_power_consumption.txt", header = TRUE, sep = ";", stringsAsFactors=FALSE, dec=".")

#subsetting data for dates 2007-02-01 and 2007-02-02
dataSubset <- fileData[fileData$Date %in% c("1/2/2007","2/2/2007") ,]


#x-axis data
dateTime <- strptime(paste(dataSubset$Date, dataSubset$Time, sep=" "), "%d/%m/%Y %H:%M:%S")

#y-axis data
globalActivePower <- as.numeric(dataSubset$Global_active_power)
sub_Metering_1 <- as.numeric(dataSubset$Sub_metering_1)
sub_Metering_2 <- as.numeric(dataSubset$Sub_metering_2)
sub_Metering_3 <- as.numeric(dataSubset$Sub_metering_3)

#Open png graphic decice
png("plot3.png", width=480, height=480)
plot(dateTime, sub_Metering_1, type="l", ylab="Energy Submetering", xlab="")
lines(dateTime, sub_Metering_2, type="l", col="red")
lines(dateTime, sub_Metering_3, type="l", col="blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=1, lwd=2.5, col=c("black", "red", "blue"))

#Closing png graphic device
dev.off()