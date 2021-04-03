data_frame <- read.csv("household_power_consumption.txt", header=T, sep=';', na.strings="?")
data_1 <- subset(data_frame, Date %in% c("1/2/2007","2/2/2007"))
data_1$Date <- as.Date(data_1$Date, format="%d/%m/%Y")
datetime <- paste(as.Date(data_1$Date), data_1$Time)
data_1$Datetime <- as.POSIXct(datetime)

## Plot 2
with(data_1, {
       plot(Global_active_power~Datetime, type="l",
       ylab="Global Active Power (kilowatts)", xlab="")
              })

dev.copy(png, file="plot2.png", height=480, width=480)
