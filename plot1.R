source("downloadHPC.R")

dataFile <- "./data/household_power_consumption_new.txt"

if(!file.exists(dataFile)){
  downloadHPC(dataFile)
}

hpc <- read.table(dataFile, header=TRUE, sep=",")

png(file = "plot1.png", width=480, height=480, units='px')
hist(hpc$Global_active_power, main="Global Active Power", xlab="Global Active Power (kilowatts)", col="red")
dev.off()