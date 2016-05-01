

library(dplyr)

Data <- read.table("household_power_consumption.txt", header= T, sep = ";")

Data <- mutate(Data, Date= as.Date(Date, format= "%d/%m/%Y"))

SubData <- Data[Data$Date == "2007-02-01" | Data$Date == "2007-02-02",]

SubData <- mutate(SubData, Global_active_power= as.numeric(as.character(Global_active_power)))

SubData <- mutate(SubData, DOW= as.factor(weekdays(Date)))

plot(SubData$Global_active_power, type = "l", ylab = "Global Active Power (kilowatts)", xlab= "", xaxt="n")
axis(1,c(0, 1441,2880),labels = c("Thu","Fri","Sat"))

dev.copy(png, "plot2.png")
dev.off()

