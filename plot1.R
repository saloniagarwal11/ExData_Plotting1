data_frame <- read.csv("household_power_consumption.txt", header=T, sep=';', na.strings="?")

data_1 <- subset(data_frame, Date %in% c("1/2/2007","2/2/2007"))
data_1$Date <- as.Date(data_1$Date, format="%d/%m/%Y")

hist(data_1$Global_active_power, main="Global Active Power",xlab="Global Active Power (kilowatts)", ylab="Frequency", col="Red")
dev.copy(png, file="plot1.png", height=480, width=480)
