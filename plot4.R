# read data (txt)
dat <- read.table("household_power_consumption.txt", 
                  header = TRUE, 
                  sep = ";",
                  na.strings = "?",
                  strip.white = TRUE,
                  stringsAsFactors = FALSE)
# get the subset data (only 2 days)
subDat <- subset(dat, dat$Date == "1/2/2007" | dat$Date == "2/2/2007")

# combine date and time
timeCombine <- paste(subDat$Date, subDat$Time)
#head(timeCombine)
date_time <- strptime(timeCombine, "%d/%m/%Y %H:%M:%S")

# png
png("plot4.png", width = 480, height = 480)

# drawn plot by row
par(mfrow = c(2,2))

# plot Global_active_power
plot(date_time, subDat$Global_active_power, type = "l", xlab = "", ylab = "Global Active Power")

# plot Voltage
plot(date_time, subDat$Voltage, type = "l", xlab = "datetime", ylab = "Voltage")

# plot Sub_metering 1:3
plot(date_time, subDat$Sub_metering_1, type = "l", xlab = "", ylab = "Energy sub metering")
lines(date_time, subDat$Sub_metering_2, type = "l", col = "red")
lines(date_time, subDat$Sub_metering_3, type = "l", col = "blue")

# plot Global_reactive_power
plot(date_time, subDat$Global_reactive_power, type = "l", xlab = "datetime", ylab = "Global_reactive_power")

dev.off()