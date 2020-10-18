library(dplyr)
library(lubridate)

# Set working directory
setwd(paste(getwd(), "/exdata_data_household_power_consumption", sep = ""))


# read file
x <- read.table("household_power_consumption.txt", sep = ";", header = TRUE)
y <- filter(x, Date == "1/2/2007" | Date == "2/2/2007")

# convert classes
y$Date <- as.Date(y$Date, format = "%d/%m/%Y")
y$Global_active_power <- as.numeric(y$Global_active_power)
y$Sub_metering_1 <- as.numeric(y$Sub_metering_1)
y$Sub_metering_2 <- as.numeric(y$Sub_metering_2)
y$Sub_metering_3 <- as.numeric(y$Sub_metering_3)
y$Voltage <- as.numeric(y$Voltage)
y$Global_reactive_power <- as.numeric(y$Global_reactive_power)

# create graph 1 & save to plot1
## hist(y$Global_active_power, xlab = "Global Active Power (kilowatts)", col = "red", main = "Global Active Power")
## dev.copy(png, file = "plot1.png")
## dev.off()