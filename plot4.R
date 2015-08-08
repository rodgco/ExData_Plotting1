source("downloadHPC.R")

dataFile <- "./data/household_power_consumption_new.txt"

if(!file.exists(dataFile)){
  downloadHPC(dataFile)
}

hpc <- read.table(dataFile, header=TRUE, sep=",")
hpc$date_time <- strptime(paste(hpc$Date, hpc$Time), format = "%d/%m/%Y %H:%M:%S")

png(file='plot4.png', width=480, height=480, units='px')
par(mfrow=c(2,2))
# Plot 1
plot(hpc$date_time, hpc$Global_active_power, ylab='Global Active Power', xlab='', type='l')
# Plot 2
plot(hpc$date_time, hpc$Voltage, xlab='datetime', ylab='Voltage', type='l')
# Plot 3
plot(hpc$date_time, hpc$Sub_metering_1, type='l', col= 'black', xlab='', ylab='Energy Sub Metering')
lines(hpc$date_time, hpc$Sub_metering_2, col='red')
lines(hpc$date_time, hpc$Sub_metering_3, col='blue')
legend('topright', legend=c('Sub_metering_1','Sub_metering_2','Sub_metering_3'), col=c('black','red','blue'), lty='solid')
# Plot 4
plot(hpc$date_time, hpc$Global_reactive_power, xlab='datetime', ylab='Global_reactive_power', type='l')
dev.off()
