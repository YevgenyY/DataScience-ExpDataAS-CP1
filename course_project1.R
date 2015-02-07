fileName <- "data/household_power_consumption.txt";

# read file into the data frame
df <- read.table(fileName, sep=';', header=TRUE, na.strings='?')
dd <- data.frame()

# select data rows with dates that we need
for (i in 1:nrow(df))
{
  if (df$Date[i] == '2/1/2007' || df$Date[i] == '2/2/2007')
  {
    dd <- rbind(dd, df[i,]) 
  }
}

rm(df1) #we don't need it any more

## Here we have dd dataframe with 2880 rows 

# convert strings into Date/Time class
for (i in 1:nrow(dd))
{
  
}