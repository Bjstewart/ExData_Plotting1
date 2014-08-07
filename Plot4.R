UtilList <- read.table("household_power_consumption.txt",sep = ";", header = TRUE, na.strings = '?')
SelDates1 <- UtilList[UtilList[, 1] == "1/2/2007", ]
SelDates2 <- UtilList[UtilList[, 1] == "2/2/2007", ]
RelDates <- rbind(SelDates1, SelDates2)
RelDates$Date <- strptime(paste(RelDates$Date,RelDates$Time), "%d/%m/%Y %H:%M:%S")
par(mfrow=c(2,2))
plot(RelDates$Date, RelDates$Global_active_power, type ="l", xlab = "", ylab = "Global Active Power")
plot(RelDates$Date, RelDates$Voltage, type = "l", xlab = "datetime" , ylab = "Voltage")
with(RelDates, {plot(Date, Sub_metering_1, type = "l", xlab = "", ylab = "Energy sub metering")
                lines(Date, Sub_metering_2, type = "l", col = 'red')
                lines(Date, Sub_metering_3, type = "l", col = 'blue')
                legend("topright", lty = 1, col = c("black", "red", "blue"), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), cex = 0.5, xjust = 1, yjust = 0,text.width = 80000, y.intersp = 0.25, bty = "n")})
plot(RelDates$Date, RelDates$Global_reactive_power, type = "l", xlab = "datetime", ylab = "Global_reactive_power")
dev.copy(png,filename="plot4.png", width = 480, height = 480, units = "px")
dev.off()

