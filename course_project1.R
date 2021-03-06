fileName <- "data/household_power_consumption.txt";

# read file into the data frame
df <- read.table(fileName, sep=';', header=TRUE, na.strings='?')
dd <- data.frame()

# select data rows with dates that we need
for (i in 1:nrow(df))
{
  if (df$Date[i] == '2/1/2007' | df$Date[i] == '2/2/2007')
  {
    dd <- rbind(dd, df[i,]) 
  }
}

rm(df) #we don't need it any more

## Here we have dd dataframe with 2880 rows 
# make simple plot
hist(dd$Global_active_power, col="red", main="Global Active Power", xlab="Global active power (kilowatts)")
dev.copy(png, file="figure/plot1.png", width=480, height=480)
dev.off()