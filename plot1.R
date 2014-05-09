
##Read the file
A <- read.delim("household_power_consumption.txt",sep=";" , 
                colClasses=c("character", "character", "numeric","numeric","numeric", "numeric","numeric","numeric"), 
                na.strings=c("?"))

##Change the format of first field to date
A[,1] <- as.Date(A[,1],format="%d/%m/%Y")

## select the subset of the data from the dates 2007-02-01 and 2007-02-02.
B<- A[A$Date >= "2007-02-01" & A$Date <= "2007-02-02",]
rm(A)

## Open a new png file, plot the image and save the file.
png(file="plot1.png")

hist(B$Global_active_power,col="red",main="Global Active Power",xlab="Global Active Power(kilowatts)")

dev.off()
