path <- "./data/household_power_consumption.txt"

library(data.table)
data <- fread(path, na.strings="?")
data$Date <- as.Date(data$Date, format="%d/%m/%Y")
selected <- data[data$Date > as.Date("2007-01-31") & data$Date < as.Date("2007-02-03")]

png("plot2.png", width=480, height=480)
selected$DateTime <- as.POSIXct(paste(selected$Date, selected$Time), format="%Y-%m-%d %H:%M:%S")
plot(x=selected$DateTime, y=selected$Global_active_power, type="l", ylab="Global Active Power (Kilowatts)", xlab="")
dev.off()
