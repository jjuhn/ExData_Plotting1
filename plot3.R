path <- "./data/household_power_consumption.txt"

library(data.table)
data <- fread(path, na.strings="?")
data$Date <- as.Date(data$Date, format="%d/%m/%Y")
selected <- data[data$Date > as.Date("2007-01-31") & data$Date < as.Date("2007-02-03")]

# 3.
png("plot3.png", width=480, height=480)
selected$DateTime <- as.POSIXct(paste(selected$Date, selected$Time), format="%Y-%m-%d %H:%M:%S")

plot(x=selected$DateTime, y=selected$Sub_metering_1, type="l", xlab="", ylab="Energy sub metering")
lines(x=selected$DateTime, y=selected$Sub_metering_2, type="l", col="red")
lines(x=selected$DateTime, y=selected$Sub_metering_3, type="l", col="blue")
legend("topright",c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),bty="l",lty=1:1, col=c("black","red","blue"),lwd=1,cex=0.9)
dev.off()
