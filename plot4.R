require(dplyr)
# load and segment the data into hpcSub
source('loaddata.R')

# open the png device
png("plot4.png",width = 480,height = 480)

par(
     cex.axis=1,
     col.axis="#030303",
     cex.lab = 1,
     mar=c(4,4,3,2),
     mfrow=c(2,2)
     )

#top left
plot(Global_active_power ~ datetime,data=hpcSub,type='l',xlab='',ylab="Global Active Power")

#top right
plot(Voltage ~ datetime,data=hpcSub,type='l',xlab='')

#bottom left
plot (Sub_metering_1 ~ datetime,data=hpcSub,col='black',type="l",xlab='',ylab="Energy sub metering")
lines(Sub_metering_2 ~ datetime,data=hpcSub,col='red')
lines(Sub_metering_3 ~ datetime,data=hpcSub,col='blue')
legend('topright'
       , grep("Sub_meter",names(hpcSub),value=T)
       , lty=c(1,1)
       , col=c('black','red','blue')
       , bty='n'
)

#bottom right
plot(Global_reactive_power ~ datetime,data=hpcSub,type='l')


#write the file
dev.off()