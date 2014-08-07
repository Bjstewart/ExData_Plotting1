UtilList <- read.table("household_power_consumption.txt",sep = ";", header = TRUE, na.strings = '?')
SelDates1 <- UtilList[UtilList[, 1] == "1/2/2007", ]
SelDates2 <- UtilList[UtilList[, 1] == "2/2/2007", ]
RelDates <- rbind(SelDates1, SelDates2)
RelDates$Date <- strptime(paste(RelDates$Date,RelDates$Time), "%d/%m/%Y %H:%M:%S")
plot(RelDates$Date, RelDates$Global_active_power, type ="l", xlab = "", ylab = "Global Active Power(kilowatts)")
dev.copy(png,filename="plot2.png", width = 480, height = 480, units = "px")
dev.off()

