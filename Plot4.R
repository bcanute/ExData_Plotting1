#Plot4.R
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

#Stage 4: Save Plot4 to a .png file.

png("C:/Users/Brian/Documents/Plots/plot4.png")
#layout the page
par(mfrow=c(2,2), mar = c(4,4,2,2), oma = c(2,0,2,0),
    cex.lab = 1, cex.axis = 1, tck = -0.05)
#first plot
plot(data3[,1],data3[,2], type = "l", 
     xlab = "", 
     ylab = "Global Active Power")
#second plot
plot(data3[,1],data3[,4], type = "l",
     xlab = "datetime", 
     ylab = "Voltage")
#third plot
plot(data3[,1],data3[,6], type = "l", 
     
     xlab = "", ylab = "Energy sub metering")
lines(data3[,1],data3[,7], type = "l", col = "red")
lines(data3[,1],data3[,8], type = "l", col = "blue")
legend("topright", # places a legend at the appropriate place 
       c( "Sub_metering_1" , "Sub_metering_2" ,  "Sub_metering_3" ), # puts text in the legend
       lty = c(1,1), # gives the legend appropriate symbols (lines)
       bty = "n",
       cex = .75,
       lwd = c(1,1),col=c("black","red", "blue"))
#fourth plot
plot(data3[,1],data3$Global_reactive_power, type = "l",
     xlab = "datetime",
     ylab = "Global_reactive_power")
#return page to single plot and close the device
par(mfrow=c(1,1))
dev.off()