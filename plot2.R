require(dplyr)
source('loaddata.R')


# open the png device
png("plot2.png",width = 480,height = 480)

#set options
par (
     cex.axis= 1
   , col.axis="#030303"
   , cex.lab = 1
   )


#plot the data
plot(  Global_active_power ~ datetime
     , data=hpcSub
     , type='l'
     , xlab=''
     , ylab="Global Active Power (kilowatts)"
     )


#write the file
dev.off()
