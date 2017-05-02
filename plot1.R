library(sqldf)
library(lubridate)
hpc <- read.csv2.sql("c4/household_power_consumption.txt", 
                      sql = "select * from file where Date == '1/2/2007' or Date == '2/2/2007'", eol = "\n")

hpc$Date <- as.Date(hpc$Date, format="%d/%m/%Y")

png(filename = "plot1.png")

hist(hpc$Global_active_power, col = "red", main = "Global Active Power", xlab = "Global Active Power (Kilowatts)")

dev.off()