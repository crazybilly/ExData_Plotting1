#check it exists, then get the file
if (!file.exists("household_power_consumption.zip")) {
     
     download.file(
          "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip",
          "household_power_consumption.zip",
          method="curl")
     
     unzip("household_power_consumption.zip")
} else { cat("file already downloaded") }


hpc <- read.table("household_power_consumption.txt",sep=";",
                  stringsAsFactors=F,na.strings="?",
                  skip=66636,
                  nrows=2880,
                 # row.names = c(
                #    "Date",
                #    "Time",
                 #   "Global_active_power",
                  #  "Global_reactive_power",
                  #  "Voltage",
                  #  "Global_intensity",
                  #  "Sub_metering_1",
                  #  "Sub_metering_2",
                  #  "Sub_metering_3"
                  #  )
                  )




#create a date/time field
hpc$datetime <- paste(hpc$Date,hpc$Time,sep=" ")
hpc$datetime <- strptime(hpc$datetime,format="%d/%m/%Y %H:%M:%S")
#hpc.target <- hpc$datetime == as.POSIXlt("2007-02-01 00:00:00")  | hpc$datetime== as.POSIXlt("2007-02-02 24:59:59")

#subset to get the desired days
#hpc.sub <- hpc[hpc.target,]


with(hpc,
     plot(
          datetime,
          Global_active_power,
          ylab="Global Active Power (kilowatts)"
          
          )
     )
