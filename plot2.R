require(dplyr)
source('loaddata.R')


# open the png device
png("plot2.png",width = 480,height = 480)

#set options
par (
     cex.axis=.7
   , col.axis="#030303"
   , cex.lab = .7
   )


#plot the data
plot(Global_active_power ~ datetime,data=hpcSub,type='n',xlab='')
lines(Global_active_power ~ datetime,data=hpcSub)


#write the file
dev.off()
