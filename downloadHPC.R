downloadHPC <- function(dataFile) {
  if(!file.exists("./data")) {
    dir.create("./data")
  }
  if(!file.exists("./data/household_power_consumption.txt")) {
    fileUrl <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
    download.file(fileUrl,destfile="./data/household_power_consumption.zip",method="curl")
    unzip("./data/household_power_consumption.zip", exdir="./data")
  }
  temporaryFile <- "./data/household_power_consumption.txt"
  temp <- read.table(temporaryFile, na.string="?", sep=";", comment.char="", nrows=5, header=TRUE)
  classes <- sapply(temp, class)
  temp <- read.table(temporaryFile, na.string="?", sep=";", comment.char="", header=TRUE, colClasses = classes)
  temp <- temp[temp$Date=="1/2/2007" | temp$Date=="2/2/2007", ]
  write.table(temp, dataFile, sep=",", row.names=FALSE, quote=FALSE)
}