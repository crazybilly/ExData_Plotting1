source('loaddata.R')

#start plotting
png("plot1.png",width = 480,height = 480)

par(
     cex.axis=.7,
     col.axis="#030303",
     cex.lab = .7,
     mar=c(4,4,3,2),
     bg="white"
     
     
     )


with(hpcSub, 
     hist(
          Global_active_power,
          col="red",
          border="black",
          main="Global Active Power",
          xlab="Global Active Power (kilowatts)",
          
          )
     )

dev.off()