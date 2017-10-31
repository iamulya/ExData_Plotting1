library(sqldf)
library(lubridate)
download.file("https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip", destfile="data.zip", method="curl")
unzip ("data.zip", exdir = "./")

hpc <- read.csv2.sql("household_power_consumption.txt", 
                      sql = "select * from file where Date == '1/2/2007' or Date == '2/2/2007'", eol = "\n")

hpc$Date <- as.Date(hpc$Date, format="%d/%m/%Y")

png(filename = "plot1.png")

hist(hpc$Global_active_power, col = "red", main = "Global Active Power", xlab = "Global Active Power (Kilowatts)")

dev.off()