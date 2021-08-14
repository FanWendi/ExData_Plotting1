data <- read.table("household_power_consumption.txt", header = TRUE, sep=";", na.strings = "?")
subsetData <-  subset(data, data$Date=="1/2/2007" | data$Date =="2/2/2007")
time <- strptime(paste(subsetData$Date, subsetData$Time), "%d/%m/%Y %H:%M:%S")

png(file = "plot3.png")
plot(time, as.numeric(subsetData$Sub_metering_1), type = "l", ylab="Energy Submetering", 
     xlab="", col = "black")
lines(time, as.numeric(subsetData$Sub_metering_2), col = "red")
lines(time, as.numeric(subsetData$Sub_metering_3), col = "blue")
legend("topright", legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), 
       lty=1, col=c("black", "red", "blue"))
dev.off()