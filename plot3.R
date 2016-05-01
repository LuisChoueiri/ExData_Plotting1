

library(dplyr)

Data <- read.table("household_power_consumption.txt", header= T, sep = ";")

Data <- mutate(Data, Date= as.Date(Date, format= "%d/%m/%Y"))

SubData <- Data[Data$Date == "2007-02-01" | Data$Date == "2007-02-02",]

SubData <- mutate(SubData, Global_active_power= as.numeric(as.character(Global_active_power)))

SubData <- mutate(SubData, DOW= as.factor(weekdays(Date)))

SubData <- mutate(SubData, Sub_metering_1= as.integer(as.character(Sub_metering_1)))
SubData <- mutate(SubData, Sub_metering_2= as.integer(as.character(Sub_metering_2)))

par(mfrow= c(1,1))
plot(SubData[,7], type = "l", ylab = "Energy sub metering", xlab= "", xaxt="n",yaxt="n")
lines(SubData[,8],  col="red")
lines(SubData[,9],  col="blue")
legend("topright", legend = colnames(SubData[,7:9]), lty = c(1,1), col = c("black","red", "blue"), xjust=1)
axis(2,c(0, 10,20,30))
axis(1,c(0, 1441,2880),labels = c("Thu","Fri","Sat"))

dev.copy(png, "plot3.png")
dev.off()

