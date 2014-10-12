## Plot4 file for Course Project 1 for Exploratory Data Analysis Coursera Course
## Riley Price
## Assumes that unzipped data files from the UCI Electric Power Consumption set are in the same directory

main <- function() {
  table1 <- read.csv("household_power_consumption.txt", header=TRUE, sep=";", na.strings=c("?"))
  table2 <- rbind(subset(table, table$Date == "1/2/2007"), subset(table, table$Date == "2/2/2007"))
  datetime <- strptime(paste(table2$Date, table2$Time, sep=","), format="%d/%m/%Y,%H:%M:%S")
  table3 <- cbind(table2, datetime)
  
  png(file = "plot4.png")
  par(mfrow = c(2, 2), mar = c(4, 4, 2, 1), oma = c(0, 0, 2, 0))
  plot(table3$datetime, table3$Global_active_power, type="l", xlab = "", ylab="Global Active Power (kilowatts)")
  plot(table3$datetime, table3$Voltage, type="l", xlab = "datetime", ylab = "Voltage")
  plot(table3$datetime, table3$Sub_metering_1, type="l", xlab = "", ylab = "Energy sub metering")
  points(table3$datetime, table3$Sub_metering_2, col="red", type="l")
  points(table3$datetime, table3$Sub_metering_3, col="blue", type="l")
  legend("topright", pch=1, col = c("black", "red", "blue"), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
  plot(table3$datetime, table3$Global_reactive_power, type="l", xlab = "datetime", ylab="Global_reactive_power")
}

main()