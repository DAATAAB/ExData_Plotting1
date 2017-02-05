library(chron)

## Reading the Data

data <- read.table("household_power_consumption.txt", header = TRUE, sep = ";", dec = ".", na.strings = "?")
electro <- data
electro$Date <- as.Date(electro$Date, "%d/%m/%Y")

electro_sub <- subset(electro, Date >= "2007-02-01" & Date <= "2007-02-02")
electro_sub$Time <- chron(time = electro_sub$Time)

## 1st png

png(filename = "plot1.png",  width = 480, height = 480)

hist(electro_sub$Global_active_power, col = "red", main = "Global Active Power", 
     xlab = "Global Active Power (kilowatts)", ylab = "Frequency")

dev.off()

## End