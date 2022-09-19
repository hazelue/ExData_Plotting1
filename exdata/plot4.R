#plot 4

#extract data
power <- read.table("household_power_consumption.txt",skip=1,sep=";")
names(power) <- c("Date","Time","Global_active_power","Global_reactive_power","Voltage","Global_intensity","Sub_metering_1","Sub_metering_2","Sub_metering_3")
powertest <- subset(power,power$Date=="1/2/2007" | power$Date =="2/2/2007")

#prepare data
powertest$Date <- as.Date(powertest$Date, format = "%d/%m/%Y")
powertest$Time <- strptime(powertest$Time, format = "%H:%M:%S")
powertest[1441:2880,"Time"] <- format(powertest[1441:2880,"Time"], "2007-02-02 %H:%M:%S")
powertest[1:1440,"Time"] <- format(powertest[0:1440,"Time"], "2007-02-01 %H:%M:%S")

#plot
par(mfrow=c(2,2))
with(powertest,plot(powertest$Time,as.numeric(as.character(powertest$Global_active_power)),type="l",  xlab="",ylab="Global Active Power"))
with(powertest,plot(powertest$Time,as.numeric(as.character(powertest$Voltage)), type="l",xlab="datetime",ylab="Voltage"))
with(powertest,plot(powertest$Time,powertest$Sub_metering_1,type="n",xlab="",ylab="Energy sub metering"))
with(powertest,lines(Time,as.numeric(as.character(Sub_metering_1))))
with(powertest,lines(Time,as.numeric(as.character(Sub_metering_2)),col="red"))
with(powertest,lines(Time,as.numeric(as.character(Sub_metering_3)),col="blue"))
legend("topright", lty=1, col=c("black","red","blue"),legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"), cex = 0.6)
with(powertest,plot(powertest$Time,as.numeric(as.character(powertest$Global_reactive_power)),type="l",xlab="datetime",ylab="Global_reactive_power"))
png("plot4.png", width=480, height=480)
dev.off()
