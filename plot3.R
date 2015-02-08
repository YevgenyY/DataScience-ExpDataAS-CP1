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

# open PNG device
png("figure/plot3.png", height = 480, width = 480, bg = "transparent")
# make simple plot
plot(dd$TS, dd$Sub_metering_1, main="Plot 3", type="l", ylab="Global active power (kilowatts)",xlab="")
lines(dd$TS, dd$Sub_metering_2, col="red")
lines(dd$TS, dd$Sub_metering_3, col="blue")

# add legend
legend('topright', legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), 
       lty=1, col=c("black", "red", "blue"))

# copy into PNG device
#dev.copy(png, file="figure/plot3.png", width=480, height=480, bg = "transparent")
dev.off()

