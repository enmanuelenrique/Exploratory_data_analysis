
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
png(filename = "plot2.png")
with(hpc, plot(Date_time, Global_active_power, type = "l", xlab = "", ylab = "Global Active Power (kilowatts)"))
dev.off()