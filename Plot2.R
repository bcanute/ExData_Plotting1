#Plot2.R
#Stage 1: Download the Data as per Readme file and place in working directory
data <- read.table(file = "household_power_consumption.txt", header = TRUE, na.strings = "?", sep = ";")
#Stage 2: Select a subset
data2 <- subset(data, c(data$Date == '1/2/2007' | data$Date == '2/2/2007'))
#Stage 3: Organise a single time series vector in POSIXlt format
data2$DT <- paste(data2$Date, data2$Time)
data2$DT <- strptime(data2$DT, "%d/%m/%Y %H:%M:%S")
data2$Date <- NULL
data2$Time <- NULL
data3 <- data2[,c(8,1,2,3,4,5,6,7)]

#Stage 4: Save Plot2 to a .png file.

png("C:/Users/Brian/Documents/Plots/plot2.png")
par(mar = c(4,4,4,4), cex = 1)
plot(data3[,1],data3[,2], type = "l", 
     xlab = "",
     ylab = "Global Active Power (kilowatts)")
dev.off()