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
png("plot4.png", width=480, height=480, units="px")

# Set 2 rows 2 cols
par(mfrow = c(2,2))

# Upper left
plot(df2$DateTime, df2$Global_active_power, type="n",
     xlab="", 
     ylab="Global Active Power")

lines(df2$DateTime, df2$Global_active_power)

# Upper right
plot(df2$DateTime, df2$Voltage, type="n",
     xlab="datetime", 
     ylab="Voltage")

lines(df2$DateTime, df2$Voltage)

# Lower left
plot(df2$DateTime, df2$Sub_metering_1, type="n",
     xlab="", 
     ylab="Energy sub metering")

lines(df2$DateTime, df2$Sub_metering_1, col="black")
lines(df2$DateTime, df2$Sub_metering_2, col="red")
lines(df2$DateTime, df2$Sub_metering_3, col="blue")

legend("topright",
       legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),
       bty="n",
       lty=1,
       lwd=2.5,
       col=c("black", "red", "blue"))

# Lower right
plot(df2$DateTime, df2$Global_reactive_power, type="n",
     xlab="datetime", 
     ylab="Global_reactive_power")

lines(df2$DateTime, df2$Global_reactive_power)

# Save to file
dev.off()
