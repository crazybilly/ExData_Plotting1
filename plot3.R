require(dplyr)
# load and segment the data into hpcSub
source('loaddata.R')

# open the png device
png("plot3.png",width = 480,height = 480)

#set options
par (
   cex.axis=1
   , col.axis="#030303"
   , cex.lab = 1
)


#plot the data
plot (Sub_metering_1 ~ datetime,data=hpcSub,col='black',type="l",xlab='',ylab="Energy sub metering")
lines(Sub_metering_2 ~ datetime,data=hpcSub,col='red')
lines(Sub_metering_3 ~ datetime,data=hpcSub,col='blue')
legend('topright'
       , grep("Sub_meter",names(hpcSub),value=T)
       , lty=c(1,1)
       , col=c('black','red','blue')
)


#write the file
dev.off()
