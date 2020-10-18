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

## Plot 2
with(y, {
  plot(Global_active_power~datetime, type="l",
       ylab="Global Active Power (kilowatts)", xlab="")
})