#plot1 global active power

#extract data from the file
powerGlobal<-data.table::fread(input = "household_power_consumption.txt",na.strings="?")

#prepare data
powerGlobal[, Global_active_power := lapply(.SD, as.numeric), .SDcols = c("Global_active_power")]
powerGlobal[, Date := lapply(.SD, as.Date, "%d/%m/%Y"), .SDcols = c("Date")]

#filter data
powerGlobal <- powerGlobal[(Date <= "2007-02-02") & (Date >= "2007-02-01")]

#make a plot and save in a png file
png("plot1.png",width = 480, height = 480, units = "px")
hist(powerGlobal[,Global_active_power],main = "Global Active Power", xlab = "Global Active Power(kilowatts)", ylab ="Frequency",col="red")
dev.off

