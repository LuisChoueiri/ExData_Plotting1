

library(dplyr)

Data <- read.table("household_power_consumption.txt", header= T, sep = ";")

Data <- mutate(Data, Date= as.Date(Date, format= "%d/%m/%Y"))

SubData <- Data[Data$Date == "2007-02-01" | Data$Date == "2007-02-02",]

SubData <- mutate(SubData, Global_active_power= as.numeric(as.character(Global_active_power)))

SubData <- mutate(SubData, DOW= as.factor(weekdays(Date)))

SubData <- mutate(SubData, Sub_metering_1= as.integer(as.character(Sub_metering_1)))
SubData <- mutate(SubData, Sub_metering_2= as.integer(as.character(Sub_metering_2)))

SubData <- mutate(SubData, Voltage= as.integer(as.character(Voltage)))

SubData <- mutate(SubData, Global_reactive_power= as.numeric(as.character(Global_reactive_power)))

par(mfrow= c(2,2))
with(SubData, {
        ## Left top plot
        plot(SubData$Global_active_power, type = "l", ylab = "Global Active Power (kilowatts)", xlab= "", xaxt="n")
        axis(1,c(0, 1441,2880),labels = c("Thu","Fri","Sat"))
        
        ##Right top plot
        plot(SubData$Voltage, type = "l", ylab = "Voltage", xlab= "datetime", xaxt="n")
        axis(1,c(0, 1441,2880),labels = c("Thu","Fri","Sat"))
        
        ## Left bottom plot
        plot(SubData[,7], type = "l", ylab = "Energy sub metering", xlab= "", xaxt="n",yaxt="n")
        lines(SubData[,8],  col="red")
        lines(SubData[,9],  col="blue")
        legend("topright", legend = colnames(SubData[,7:9]), lty = c(1,1), col = c("black","red", "blue"), bty="n", xjust=1)
        axis(2,c(0, 10,20,30))
        axis(1,c(0, 1441,2880),labels = c("Thu","Fri","Sat"))

        ## Right bottom plot
        plot(SubData$Global_reactive_power, type = "l", ylab = "Global_reactive_power", xlab= "datetime", xaxt="n")
        axis(1,c(0, 1441,2880),labels = c("Thu","Fri","Sat"))
})


dev.copy(png, "plot4.png")
dev.off()

