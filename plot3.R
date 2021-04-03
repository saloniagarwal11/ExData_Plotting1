data_frame <- read.csv("household_power_consumption.txt", header=T, sep=';', na.strings="?", 
                      nrows=2075259, check.names=F, stringsAsFactors=F, comment.char="", quote='\"')
data_1 <- subset(data_frame, Date %in% c("1/2/2007","2/2/2007"))
data_1$Date <- as.Date(data_1$Date, format="%d/%m/%Y")
datetime <- paste(as.Date(data_1$Date), data_1$Time)
data_1$Datetime <- as.POSIXct(datetime)

with(data_1, {
  plot(Sub_metering_1~Datetime, type="n",
       ylab="Energy sub metering", xlab=" ")
  lines(Sub_metering_1~Datetime)
  lines(Sub_metering_2~Datetime,col='Red')
  lines(Sub_metering_3~Datetime,col='Blue')
})
legend("topright", col=c("black", "red", "blue"), lty=1, lwd=2, 
       legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
dev.copy(png, file="plot3.png", height=480, width=480)
