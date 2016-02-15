source("downloadHPC.R")

dataFile <- "./data/household_power_consumption_new.txt"

if(!file.exists(dataFile)){
  downloadHPC(dataFile)
}

hpc <- read.table(dataFile, header=TRUE, sep=",")
hpc$date_time <- strptime(paste(hpc$Date, hpc$Time), format = "%d/%m/%Y %H:%M:%S")

png(file='plot3.png', width=480, height=480, units='px')
plot(hpc$date_time, hpc$Sub_metering_1,type='l', col= 'black', xlab='', ylab='Energy Sub Metering')
lines(hpc$date_time, hpc$Sub_metering_2, col='red')
lines(hpc$date_time, hpc$Sub_metering_3, col='blue')
legend('topright', legend=c('Sub_metering_1','Sub_metering_2','Sub_metering_3'), col=c('black','red','blue'), lty='solid')
dev.off()