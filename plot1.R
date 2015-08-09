
# Read the file to a data frame
file <- 'household_power_consumption.txt'
df <- read.csv(file, header=TRUE, sep =';', na.strings = '?')

# Load subset of the interesting dates into a smaller data frame
# using dates as factors
dates <- c("1/2/2007", "2/2/2007")
df2 <- df[df$Date %in% dates,]

# Open png device
png("plot1.png", width=480, height=480, units="px")

# Create basic plot
hist(df2$Global_active_power, col="red", 
  main="Global Active Power",
  xlab="Global Active Power (kilowatts)")

# Save to file
dev.off()