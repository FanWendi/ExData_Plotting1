data <- read.table("household_power_consumption.txt", header = TRUE, sep=";", na.strings = "?")
subsetData <-  subset(data, data$Date=="1/2/2007" | data$Date =="2/2/2007")
time <- strptime(paste(subsetData$Date, subsetData$Time), "%d/%m/%Y %H:%M:%S")

png(file = "plot4.png")
par(mfrow= c(2,2))

plot(time, as.numeric(subsetData$Global_active_power), col = "black", xlab = "",
     ylab = "Global Active Power", type = "l")

plot(time, as.numeric(subsetData$Voltage), col = "black", xlab = "datetime",
     ylab = "Voltage", type = "l")

plot(time, as.numeric(subsetData$Sub_metering_1), col = "black", xlab = "",
     ylab = "Energy sub metering", type = "l")
lines(time, as.numeric(subsetData$Sub_metering_2), col = "red")
lines(time, as.numeric(subsetData$Sub_metering_3), col = "blue")
legend("topright", legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), 
       col = c("black", "red", "blue"), lty=1)

plot(time, as.numeric(subsetData$Global_reactive_power), col = "black", 
     xlab = "datetime", ylab = "Global_reactive_power", type = "l")

dev.off()