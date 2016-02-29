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
png("plot3.png", width = 480, height = 480)

plot(date_time, subDat$Sub_metering_1, type = "l", xlab = "", ylab = "Energy sub metering")
lines(date_time, subDat$Sub_metering_2, type = "l", col = "red")
lines(date_time, subDat$Sub_metering_3, type = "l", col = "blue")

# add legend
legend("topright", lty = 1, 
       col = c("black", "red", "blue"), 
       legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
dev.off()
