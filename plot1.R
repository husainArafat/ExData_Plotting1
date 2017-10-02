plot1 <- function(){
  
  ##download and load in data
  fileURL <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
  download.file(url = fileURL, destfile = "./data.zip")
  unzip(zipfile = "./data.zip")
  data <- read.table(file = "./household_power_consumption.txt", sep = ";", header = TRUE)
  
  ##change formats to help graph
  
  data$Date <- as.Date(data$Date, format = "%d/%m/%Y")
  data2 <- data[((data$Date == as.Date("2007/02/01")) | (data$Date == as.Date("2007/02/02"))),]
  data2$Global_active_power <- as.numeric(as.character((data2$Global_active_power)))
  
  ##create graph
  hist(data2$Global_active_power, col = "red", main = "Global Active Power", xlab = "Global Active Power (kilowatts)")
  dev.copy(device = png, file = "plot1.png", height = 480, width = 480)
  dev.off()
  
}