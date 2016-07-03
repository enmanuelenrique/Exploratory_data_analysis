
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
png(filename = "plot4.png")
## set the parameters for 2 row and 2 columns of plots
par(mfrow = c(2,2))
## plots the first plot
with(hpc, plot(Date_time, Global_active_power, type = "l", xlab = "", ylab = "Global Active Power (kilowatts)"))
## plots the second plot
with(hpc, plot(Date_time, Voltage, type = "l", xlab = "datetime", ylab = "Voltage"))
#plots the 3rd plot
plot(hpc$Date_time, hpc$Sub_metering_1, type = "n", xlab = "", ylab = "Energy sub metering")
points(hpc$Date_time, hpc$Sub_metering_1, type = "l")
points(hpc$Date_time, hpc$Sub_metering_2, type = "l", col = "red")
points(hpc$Date_time, hpc$Sub_metering_3, type = "l", col = "blue")
legend("topright", c("Sub_matering_1","Sub_matering_2", "Sub_matering_3"), lty = 1, col = c("black", "red", "blue"), bty = "n", cex = 0.8)
##plots the 4th and last plot
with(hpc, plot(Date_time, Global_reactive_power, type = "l", xlab = "datetime", ylab = "Global_reactive_power"))
dev.off()