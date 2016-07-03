
## Reads data into R
hpc <- read.table("household_power_consumption.txt", na.strings = "?", sep = ";", header = TRUE)
## load necesary packages
library(lubridate); library(dplyr)
## convert Date column in to a "date" class
## and filter the first 2 days of february
hpc[,1] <- dmy(hpc$Date)
hpc <- filter(hpc, Date >= "2007-02-01" & Date <= "2007-02-02")
## creates the plot
png(filename = "plot1.png")
hist(hpc$Global_active_power, xlab = "Global active power (kilowatts", col = "red", main = "Global Active Power")
dev.off()