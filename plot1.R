

library(dplyr)

Data <- read.table("household_power_consumption.txt", header= T, sep = ";")

Data <- mutate(Data, Date= as.Date(Date, format= "%d/%m/%Y"))

SubData <- Data[Data$Date == "2007-02-01" | Data$Date == "2007-02-02",]

SubData <- mutate(SubData, Global_active_power= as.numeric(as.character(Global_active_power)))

hist(SubData$Global_active_power, col="red", main = "Global Active Power", 
     xlab = "Global Active Power (kilowatts)") 

dev.copy(png, "plot1.png")
dev.off()

