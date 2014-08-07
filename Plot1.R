UtilList <- read.table("household_power_consumption.txt",sep = ";", header = TRUE, na.strings = '?')
SelDates1 <- UtilList[UtilList[, 1] == "1/2/2007", ]
SelDates2 <- UtilList[UtilList[, 1] == "2/2/2007", ]
RelDates <- rbind(SelDates1, SelDates2)
RelDates[,1] <- as.Date(RelDates[,1])
 hist(RelDates$Global_active_power, col = "red", main = "Global Active Power", xlab = "Global Active Power (kilowatts)", ylim = c(0,  1200))
dev.copy(png,filename="plot1.png", width = 480, height = 480, units = "px")
dev.off()
