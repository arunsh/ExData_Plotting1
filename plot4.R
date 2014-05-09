


##Read the file
A <- read.delim("household_power_consumption.txt",sep=";" , 
                colClasses=c("character", "character", "numeric","numeric","numeric", "numeric","numeric","numeric"), 
                na.strings=c("?"))

##Change the format of first field to date
A[,1] <- as.Date(A[,1], format="%d/%m/%Y")

## select the subset of the data from the dates 2007-02-01 and 2007-02-02.
B<- A[A$Date >= "2007-02-01" & A$Date <= "2007-02-02",]

rm(A)
B$Datetimestamp <- strptime(paste(B$Date, B$Time), format='%Y-%m-%d %H:%M:%S')

## Open a new png file, plot the image and save the file.
png(file="plot4.png")

par(mfcol=c(2,2))

plot(B$Datetimestamp,B$Global_active_power,xlab="",
     ylab="Global Active Power", type="l")


plot(B$Datetimestamp,B$Sub_metering_1,type="n",xlab="",
     ylab="Energy sub metering")
with(B, lines(Datetimestamp,Sub_metering_1,type="l"))
with(B, lines(Datetimestamp,Sub_metering_2,type="l",col="red"))
with(B, lines(Datetimestamp,Sub_metering_3,type="l",col="blue"))
legend("topright",c("Sub_metering_1","Sub_metering_2","Sub_metering_3"), 
       lty=c(1,1) , col=c("black","red","blue"), , bty="n")

plot(B$Datetimestamp,B$Voltage,xlab="datetime",ylab="Voltage", type="l")

plot(B$Datetimestamp,B$Global_reactive_power,xlab="datetime",
     ylab="Global_reactive_power", type="l")

dev.off()