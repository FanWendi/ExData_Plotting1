data <- read.table("household_power_consumption.txt", header = TRUE, sep=";", na.strings = "?")
subsetData <-  subset(data, data$Date=="1/2/2007" | data$Date =="2/2/2007")
time <- strptime(paste(subsetData$Date, subsetData$Time), "%d/%m/%Y %H:%M:%S")

png(file = "plot2.png")
plot(time, as.numeric(subsetData$Global_active_power), type="l", 
     xlab="", ylab="Global Active Power (kilowatts)")
dev.off()