plot3 <- function(){
  
  ##download and load in data
  fileURL <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
  download.file(url = fileURL, destfile = "./data.zip")
  unzip(zipfile = "./data.zip")
  data <- read.table(file = "./household_power_consumption.txt", sep = ";", header = TRUE)
  
  ##change formats to help graph
  
  data$Date <- as.Date(data$Date, format = "%d/%m/%Y")
  data2 <- data[((data$Date == as.Date("2007/02/01")) | (data$Date == as.Date("2007/02/02"))),]
  data2$Global_active_power <- as.numeric(as.character((data2$Global_active_power)))
  data2$dateTime <- strptime(x = paste(data2$Date, data2$Time, sep = " "), format = "%Y-%m-%d %H:%M:%S")
  
  ##plot
  with(data2, plot(x = dateTime, y = as.numeric(as.character(Sub_metering_1)), type = "n", xlab = "", ylab = "Energy Sub Metering"))
  with(data2, points(x = dateTime, y = as.numeric(as.character(Sub_metering_1)), type = "l", col = "black"))
  with(data2, points(x = dateTime, y = as.numeric(as.character(Sub_metering_2)), type = "l", col = "red"))
  with(data2, points(x = dateTime, y = as.numeric(as.character(Sub_metering_3)), type = "l", col = "blue"))
  legend("topright", lty = c(1,1), col = c("black", "blue","red"), legend = c("Sub Meter 1", "Sub Meter 2", "Sub Meter 3"), cex = 0.75 )
  
  ##make png
  dev.copy(device = png, file = "plot3.png", height = 480, width = 480)
  dev.off()

}