source("downloadHPC.R")

dataFile <- "./data/household_power_consumption_new.txt"

if(!file.exists(dataFile)){
  downloadHPC(dataFile)
}

hpc <- read.table(dataFile, header=TRUE, sep=",")
hpc$date_time <- strptime(paste(hpc$Date, hpc$Time), format = "%d/%m/%Y %H:%M:%S")

png(file="plot2.png", width=480, height=480, units='px')
plot(hpc$date_time, hpc$Global_active_power, ylab='Global Active Power (kilowatts)', xlab='', type='l')
dev.off()