library(dplyr)

library(graphics)

library(grDevices)

data <- read.table("household_power_consumption.txt", header = TRUE, sep = ";", stringsAsFactors = FALSE)

str(data)

data$Date <- as.Date(data$Date, "%d/%m/%Y")

a <- as.Date("2007-02-01", "%Y-%m-%d")

b <- as.Date("2007-02-02", "%Y-%m-%d")

data2 <- filter(data, a <= Date & Date <= b)

test <- filter(data2, Date!= a)

test2 <- filter(test, Date!= b)

data2$Time <- strptime(data2$Time, "%H:%M:%S")

data2$Global_active_power <- as.numeric(data2$Global_active_power)

png(filename = "plot2.png", width = 480, height = 480)

data2$Time[1441:2880] <- data2$Time[1441:2880] + 86400

data2$Time <- data2$Time - 345600

plot(data2$Time, data2$Global_active_power, type = "l", xlab = "", ylab = "Global Active Power (kilowatts)",)

dev.off()