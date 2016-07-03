
## Reads data into R
hpc <- read.table("household_power_consumption.txt", na.strings = "?", sep = ";", header = TRUE)
## load necesary packages
library(lubridate); library(dplyr)
## convert Date column in to a "date" class
## and filter the first 2 days of february
hpc[,1] <- dmy(hpc$Date)
hpc <- filter(hpc, Date >= "2007-02-01" & Date <= "2007-02-02")
## creates a combined date time column
hpc$Date_time <- ymd_hms(paste(hpc$Date, hpc$Time))
## creates the plot
png(filename = "plot3.png")
plot(hpc$Date_time, hpc$Sub_metering_1, type = "n", xlab = "", ylab = "Energy sub metering")
points(hpc$Date_time, hpc$Sub_metering_1, type = "l")
points(hpc$Date_time, hpc$Sub_metering_2, type = "l", col = "red")
points(hpc$Date_time, hpc$Sub_metering_3, type = "l", col = "blue")
legend("topright", c("Sub_matering_1","Sub_matering_2", "Sub_matering_3"), lty = 1, col = c("black", "red", "blue"))
dev.off()