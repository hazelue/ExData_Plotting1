#plot 3 sub_metering


#extract data
power <- data.table::fread(input = "household_power_consumption.txt", na.strings="?")

#prepare data
power[, Global_active_power := lapply(.SD, as.numeric), .SDcols = c("Global_active_power")]

#filter
power[, DateTime := as.POSIXct(paste(Date, Time), format = "%d/%m/%Y %H:%M:%S")]
power <- power[(DateTime >= "2007-02-01") & (DateTime < "2007-02-03")]

#plot and save as a png file
plot(power[, DateTime], power[, Sub_metering_1], type="l", xlab="", ylab="Energy sub metering")
lines(power[, DateTime], power[, Sub_metering_2],col="red")
lines(power[, DateTime], power[, Sub_metering_3],col="blue")
legend("topright", col=c("black","red","blue"), c("Sub_metering_1","Sub_metering_2", "Sub_metering_3"),lty=c(1,1), lwd=c(1,1))
png("plot3.png", width=480, height=480)
dev.off()