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

# make simple plot
plot(dd$TS, dd$Global_active_power, main="Plot 2", type="l", ylab="Global active power (kilowatts)",xlab="")

## copy plot into png file
dev.copy(png, file="figure/plot2.png", width=480, height=480)
dev.off()

