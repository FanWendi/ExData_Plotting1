data <- read.table("household_power_consumption.txt", header = TRUE, sep=";", na.strings = "?")
subsetData <-  subset(data, data$Date=="1/2/2007" | data$Date =="2/2/2007")
date <- as.Date(data$Date, "%d/%m/%Y")

png(file = "plot1.png")
hist(as.numeric(subsetData$Global_active_power), col = "red", 
     main = "Global Active Power", xlab = "Global Active Power (kilowatts)",
     ylab = "Frequency")
dev.off()