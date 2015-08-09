# If you run a different locale you need to do this to get
# correct abbreviations for weekdays on the x-axis
Sys.setlocale("LC_TIME", "English")

# Read the file to a data frame
file <- 'household_power_consumption.txt'
df <- read.csv(file, header=TRUE, sep =';', na.strings = '?')

# Load subset of the interesting dates into a smaller data frame
# using dates as factors
dates <- c("1/2/2007", "2/2/2007")
df2 <- df[df$Date %in% dates,]

# Convert Date and Time to POSIXlt time type
df2$DateTime <- strptime(paste(df2$Date, df2$Time, sep=' '), format='%d/%m/%Y %H:%M:%S')

# open png device
png("plot3.png", width=480, height=480, units="px")

# Create basic plot
plot(df2$DateTime, df2$Sub_metering_1, type="n",
     xlab="", 
     ylab="Energy sub metering")

lines(df2$DateTime, df2$Sub_metering_1, col="black")
lines(df2$DateTime, df2$Sub_metering_2, col="red")
lines(df2$DateTime, df2$Sub_metering_3, col="blue")

legend("topright",
      legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),
      lty=1,
      lwd=2.5,
      col=c("black", "red", "blue"))

# Save to file
dev.off()
