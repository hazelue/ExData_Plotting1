#plot2

#extract data
power <- read.table("household_power_consumption.txt",skip = 1, sep = ";")
names(power) <- c("Date","Time","Global_active_power","Global_reactive_power","Voltage","Global_intensity","Sub_metering_1","Sub_metering_2","Sub_metering_3")
powertest <- subset(power,power$Date == "1/2/2007"|power$Date == "2/2/2007")

#prepare data
powertest$Date <- as.Date(powertest$Date, format = "%d/%m/%Y")
powertest$Time <- strptime(powertest$Time, format = "%H:%M:%S")
powertest[1441:2880,"Time"] <- format(powertest[1441:2880,"Time"], "2007-02-02 %H:%M:%S")
powertest[1:1440,"Time"] <- format(powertest[0:1440,"Time"], "2007-02-01 %H:%M:%S")
powertest$Global_active_power <- as.numeric(as.character(powertest$Global_active_power))


#plot and save
png("plot2.png",width = 480, height = 480, units = "px")
plot(powertest$Time,powertest$Global_active_power, type = "l", xlab="", ylab = "Global Active Power(kilowatts)")
title(main = "Global Active Power Vs Time")
dev.off