#Reading data
fileData <- read.table("household_power_consumption.txt", header = TRUE, sep = ";", stringsAsFactors=FALSE, dec=".")

#subsetting data for dates 2007-02-01 and 2007-02-02
dataSubset <- fileData[fileData$Date %in% c("1/2/2007","2/2/2007") ,]

#x-axis data
dateTime <- strptime(paste(dataSubset$Date, dataSubset$Time, sep=" "), "%d/%m/%Y %H:%M:%S")

#y-axes data
globalActivePower <- as.numeric(dataSubset$Global_active_power)
globalReactivePower <- as.numeric(dataSubset$Global_reactive_power)
voltage <- as.numeric(dataSubset$Voltage)
sub_Metering_1 <- as.numeric(dataSubset$Sub_metering_1)
sub_Metering_2 <- as.numeric(dataSubset$Sub_metering_2)
sub_Metering_3 <- as.numeric(dataSubset$Sub_metering_3)

#Open png graphic decice
png("plot4.png", width=480, height=480)
par(mfrow = c(2, 2)) 

plot(dateTime, globalActivePower, type="l", xlab="", ylab="Global Active Power", cex=0.2)

plot(dateTime, voltage, type="l", xlab="datetime", ylab="Voltage")

plot(dateTime, sub_Metering_1, type="l", ylab="Energy Submetering", xlab="")
lines(dateTime, sub_Metering_2, type="l", col="red")
lines(dateTime, sub_Metering_3, type="l", col="blue")

legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=, lwd=2.5, col=c("black", "red", "blue"), bty="o")

plot(dateTime, globalReactivePower, type="l", xlab="datetime", ylab="Global_reactive_power")

#Closing png graphic device
dev.off()