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

# Open png device
png("plot2.png", width=480, height=480, units="px")

# Create basic plot
plot(df2$DateTime, df2$Global_active_power, type="n",
     xlab="", 
     ylab="Global Active Power (kilowatts)")

lines(df2$DateTime, df2$Global_active_power)

# Save to file
dev.off()
