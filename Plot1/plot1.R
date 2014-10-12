## Plot1 file for Course Project 1 for Exploratory Data Analysis Coursera Course
## Riley Price
## Assumes that unzipped data files from the UCI Electric Power Consumption set are in the same directory
main <- function() {
  ## Loads data into variable called table3
  table1 <- read.csv("household_power_consumption.txt", header=TRUE, sep=";", na.strings=c("?"))
  table2 <- rbind(subset(table, table$Date == "1/2/2007"), subset(table, table$Date == "2/2/2007"))
  datetime <- strptime(paste(table2$Date, table2$Time, sep=","), format="%d/%m/%Y,%H:%M:%S")
  table3 <- cbind(table2, datetime)
  
  ## Generates graph
  png(file="plot1.png")
  with(table3, hist(Global_active_power, freq=TRUE, col="red", main="Global Active Power", xlab = "Global Active Power (kilowatts)"))
  dev.off()
}

## Runs program 
main()