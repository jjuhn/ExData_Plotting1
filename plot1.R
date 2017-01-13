# plot1.R
url <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
dest <- "./power.zip"
extData <- "./data"

downloadZip <- function(url, dest){
  if (!file.exists(dest)){
    download.file(url, dest, method="curl")
  }
  else{
    message("File exists")
  }
}

unzipData <- function(zipFile, extData){
  if (!file.exists(extData)){
    unzip(zipFile, exdir=extData)
  }
  else{
    message("directory exists")
  }
  return (list.files(extData, recursive=TRUE))
  
}


downloadZip(url, dest)
unzipData(dest, extData)
path <- "./data/household_power_consumption.txt"

library(data.table)
data <- fread(path, na.strings="?")
data$Date <- as.Date(data$Date, format="%d/%m/%Y")
selected <- data[data$Date > as.Date("2007-01-31") & data$Date < as.Date("2007-02-03")]

png("plot1.png", width=480, height=480)
hist(selected$Global_active_power, main="Global Active Power", xlab="Global Active Power (kilowatts)", col="red")
dev.off()





