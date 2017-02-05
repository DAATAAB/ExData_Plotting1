## Reading the Data

data <- read.table("household_power_consumption.txt", header = TRUE, sep = ";", dec = ".", na.strings = "?")
electro <- data

electro$Date <- as.Date(electro$Date, "%d/%m/%Y")
electro_sub <- subset(electro, Date >= "2007-02-01" & Date <= "2007-02-02")
electro_sub$datetime <- paste(electro_sub$Date, electro_sub$Time)
electro_sub$datetime <- strptime(electro_sub$datetime, format = "%Y-%m-%d %H:%M:%S")

## 2nd png

png(filename = "plot2.png",  width = 480, height = 480)

plot(electro_sub$datetime, electro_sub$Global_active_power, 
     type = "l", xlab = "", ylab = "Global Active Power (kilowatts)")

dev.off()

## End