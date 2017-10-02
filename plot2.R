plot2 <- function(){
  
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
  
  
  
  
  ## create graph
  plot(x = data2$dateTime, y = data2$Global_active_power, type = "l" , xlab = "", ylab = "Global Active Power (kilowatts)")
  
  ##create png
  dev.copy(device = png, file = "plot2.png", height = 480, width = 480)
  dev.off()
  
  
  
}