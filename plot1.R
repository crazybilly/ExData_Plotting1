#check it exists, then get the file
if (!file.exists("household_power_consumption.zip")) {
     
     download.file(
          "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip",
          "household_power_consumption.zip")
     
     unzip("household_power_consumption.zip")
} else { cat("file already downloaded") }

#read in the file

hpc <- read.table("household_power_consumption.txt",header=T,sep=";",
                  stringsAsFactors=F,na.strings="?"
          #for testing------------------------------------------
          ,nrows=100000
                  )

#create a date/time field
hpc$datetime <- paste(hpc$Date,hpc$Time,sep=" ")
hpc$datetime <- as.Date(strptime(hpc$datetime,format="%d/%m/%Y %H:%M:%S"))
hpc.target <- hpc$datetime == as.Date("2007-02-01") | hpc$datetime==("2007-02-02")

#subset to get the desired days
hpc.sub <- hpc[hpc.target,]

par(
     cex.axis=.7,
     col.axis="#030303",
     cex.lab = .7,
     mar=c(4,4,3,2),
     bg="white"
     
     
     )


with(hpc.sub, 
     hist(
          Global_active_power,
          col="red",
          border="black",
          main="Global Active Power",
          xlab="Global Active Power (kilowatts)",
          
          )
     )
