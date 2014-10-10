source('loaddata.R')

#start plotting
png("plot1.png",width = 480,height = 480)

par(
     cex.axis=1,
     col.axis="#030303",
     cex.lab = 1,
     mar=c(4,4,3,2)
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