C:/Users/Scott/StoreJet/Documents/Academic Programs/Coursera/Data Science Specialization/Course 4 Exploratory Data Analysis/Project 1/exdata-data-household_power_consumption

setwd("./Academic Programs/Coursera/Data Science Specialization/Course 4 Exploratory Data Analysis/Project 1/exdata-data-household_power_consumption")

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

png(filename = "plot1.png", width = 480, height = 480)

hist(data2$Global_active_power, xlab = "Global Active Power (kilowatts)", ylab = "Frequency", col = "red", main = "Global Active Power")

dev.off()
