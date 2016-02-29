# read data (txt)
dat <- read.table("household_power_consumption.txt", 
           header = TRUE, 
           sep = ";",
           na.strings = "?",
           strip.white = TRUE,
           stringsAsFactors = FALSE)
# get the subset data (only 2 days)
subDat <- subset(dat, dat$Date == "1/2/2007" | dat$Date == "2/2/2007")

# png
png("plot1.png", width = 480, height = 480)

# plot
hist(subDat$Global_active_power, 
     col = "red", 
     xlab = "Global Active Power (kilowatts)", 
     main = "Global Active Power")

# close device
dev.off()
