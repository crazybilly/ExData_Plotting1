require(dplyr)

#check if it exists; if not, get the file
if (!file.exists("household_power_consumption.zip")) {
   
   download.file(
      "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip",
      "household_power_consumption.zip")
   
   unzip("household_power_consumption.zip")
} else { cat("file already downloaded") }

#test if the hpc dtaa file exist; if not, read in the file

if (!exists ('hpcSub')) {
hpc <- read.table("household_power_consumption.txt",header=T,sep=";"
                  , stringsAsFactors=F,na.strings="?"
                  , nrows = 100000
)

#create a date/time field
hpc  <- hpc %>%
   mutate(
        datetimechr = paste(hpc$Date,hpc$Time,sep=" ")
      , datetime    = as.POSIXct(strptime(datetimechr,format="%d/%m/%Y %H:%M:%S"))
      , date        = as.Date(strptime(Date,format='%d/%m/%Y'))
   ) %>%
   select ( -Date, -Time, -datetimechr)


# filter for the appropriate dates
hpcSub  <- hpc %>%
   filter( date >= as.Date("2007-02-01"), date <= as.Date("2007-02-02"))

}