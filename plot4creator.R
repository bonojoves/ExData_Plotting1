library(dplyr)
library(lubridate)

# Set working directory
setwd(paste(getwd(), "/exdata_data_household_power_consumption", sep = ""))


# read file
x <- read.csv("household_power_consumption.txt", sep = ";", header = TRUE, na.strings = "?", check.names = FALSE, stringsAsFactors = FALSE, comment.char = "", quote = '\"')
y <- filter(x, Date == "1/2/2007" | Date == "2/2/2007")

y$Date <- as.Date(y$Date, format = "%d/%m/%Y")
datetime <- paste(as.Date(y$Date), y$Time)
y$datetime <- as.POSIXct(datetime)

## Plot 4 2x2
par(mfcol = c(2, 2))

## global active power
with(y, {
  plot(Global_active_power~datetime, type = "l", ylab = "Global Active Power", xlab = "")
})

## Energy sub metering
with(y, {
  plot(Sub_metering_1~datetime, type="l",
       ylab="Global Active Power (kilowatts)", xlab="")
  lines(Sub_metering_2~datetime, col = "red")
  lines(Sub_metering_3~datetime, col = "blue")
  legend("topright", lty = 1, lwd = 1, col = c("black", "red", "blue"), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
})


## voltage
with(y, {
  plot(Voltage~datetime, type = "l", ylab = "Voltage", xlab = "datetime")
})

## global reactive power
with(y, {
  plot(Global_reactive_power~datetime, type = "l", ylab = "Global_reactive_power", xlab = "datetime")
})
