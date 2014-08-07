UtilList <- read.table("household_power_consumption.txt",sep = ";", header = TRUE, na.strings = '?')
SelDates1 <- UtilList[UtilList[, 1] == "1/2/2007", ]
SelDates2 <- UtilList[UtilList[, 1] == "2/2/2007", ]
RelDates <- rbind(SelDates1, SelDates2)
RelDates$Date <- strptime(paste(RelDates$Date,RelDates$Time), "%d/%m/%Y %H:%M:%S")
with(RelDates, plot(Date, Sub_metering_1, type = "l", xlab = "", ylab = "Energy sub metering"))
with(RelDates, lines(Date, Sub_metering_2, type = "l", col = 'red'))
with(RelDates, lines(Date, Sub_metering_3, type = "l", col = 'blue'))
legend("topright", lty = 1, col = c("black", "red", "blue"), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), cex = 0.75, xjust = 1, yjust = 0,text.width = 50000, y.intersp = 0.5)
dev.copy(png,filename="plot3.png", width = 480, height = 480, units = "px")
dev.off()

