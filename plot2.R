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
png("plot2.png", width = 480, height = 480)

plot(date_time, subDat$Global_active_power, 
     type="l", xlab="", ylab="Global Active Power (kilowatts)")

# close device
dev.off()