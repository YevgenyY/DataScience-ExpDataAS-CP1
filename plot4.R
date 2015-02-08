fileName <- "data/household_power_consumption.txt";

# read file into the data frame
df <- read.table(fileName, sep=';', header=TRUE, na.strings='?')
dd <- data.frame()

# select data rows with dates that we need
df$Date <- as.Date(df$Date, format="%d/%m/%Y")
dd <- subset(df, subset=(Date >= "2007-02-01" & Date <= "2007-02-02"))

rm(df) #we don't need it any more

## Here we have dd dataframe with 2880 rows 
# convert strings to Date/Time objects
tmp<-paste(dd$Date, dd$Time)
ts<-strptime(tmp, "%Y-%m-%d %H:%M:%S")
dd$TS<-ts

## open PNG device
png("figure/plot4.png", height = 480, width = 480, bg = "transparent")
#png("figure/plot4.png", height = 480, width = 480)

# make a complex plot 2x2
par(mfrow=c(2,2))

plot(dd$TS, dd$Global_active_power, main="", type="l", ylab="Global Active Power",xlab="")
plot(dd$TS, dd$Voltage, main="", type="l", ylab="Global active power (kilowatts)",xlab="")

# make simple plot
plot(dd$TS, dd$Sub_metering_1, main="Plot 3", type="l", ylab="Global active power (kilowatts)",xlab="")
lines(dd$TS, dd$Sub_metering_2, col="red")
lines(dd$TS, dd$Sub_metering_3, col="blue")
# add legend
legend('topright', legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), 
       lty=1, col=c("black", "red", "blue"))

plot(dd$TS, dd$Global_reactive_power, main="", type="l", ylab="Global reactive power",xlab="")

dev.off()





