## Reading the Data

data <- read.table("household_power_consumption.txt", header = TRUE, sep = ";", dec = ".", na.strings = "?")
electro <- data

electro$Date <- as.Date(electro$Date, "%d/%m/%Y")
electro_sub <- subset(electro, Date >= "2007-02-01" & Date <= "2007-02-02")
electro_sub$datetime <- paste(electro_sub$Date, electro_sub$Time)
electro_sub$datetime <- strptime(electro_sub$datetime, format = "%Y-%m-%d %H:%M:%S")

## 4th png

png(filename = "plot4.png",  width = 480, height = 480)

par(mfrow = c(2,2))

#1st plot

plot(electro_sub$datetime, electro_sub$Global_active_power, 
     type = "l", xlab = "", ylab = "Global Active Power (kilowatts)")


#2nd plot
plot(electro_sub$datetime, electro_sub$Voltage, 
     type = "l", xlab = "datetime", ylab = "Voltage")


#3th plot
plot( electro_sub$datetime, electro_sub$Sub_metering_1, 
      type="l", xlab = "", ylab = "Energy sub metering")

points(electro_sub$datetime, electro_sub$Sub_metering_2, type = "l", col = "red")
points(electro_sub$datetime, electro_sub$Sub_metering_3, type = "l", col = "blue")

legend("topright", pch = "", col = c("black", "red", "blue"), bty = "n", lty = 1, lwd = 2,
       legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))

#4th plot

plot(electro_sub$datetime, electro_sub$Global_reactive_power, 
     type = "l", xlab = "datetime", ylab = "Global_reactive_power")

dev.off()

#End