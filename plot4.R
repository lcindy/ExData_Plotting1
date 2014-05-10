#R code for plot4
#Exploratory Data Analysis Project 1

setwd("D:/Coursera/DataScience/ExploratoryDataAnalysis/Project1/exdata-data-household_power_consumption")
#read data
usedata<-read.table("household_power_consumption.txt", header=T,sep=";")
#filter data
flag<-usedata[,1]=="1/2/2007" | usedata[,1]=="2/2/2007"
newdata<-usedata[flag,]
#create subsets and timestamps for graphing
subset1<-as.numeric(levels(newdata[,3])[newdata[,3]])
subset2<-as.numeric(levels(newdata[,5])[newdata[,5]])
subset3_1<-as.numeric(levels(newdata[,7])[newdata[,7]])
subset3_2<-as.numeric(levels(newdata[,8])[newdata[,8]])
subset3_3<-newdata[,9]
subset4<-as.numeric(levels(newdata[,4])[newdata[,4]])
subsettime<-(strptime(paste(newdata[,1],newdata[,2]),"%d/%m/%Y %H:%M:%S"))
#create graphs
par(mfrow=c(2,2))
par(mar=c(4,4,3.5,2))
#graph1
plot(subsettime, subset1, type = "n",ylab ="Global Active Power",xlab="", cex.axis=0.5,cex.lab = 0.5 )
lines(subsettime,subset1, lty=1)
#graph2
plot(subsettime, subset2, type = "n",ylab ="Voltage",xlab="datetime", cex.axis=0.5 ,cex.lab = 0.5 )
lines(subsettime,subset2, lty=1)
#graph3
plot(subsettime, subset3_1, type = "n",ylab ="Energy sub metering",xlab="", cex.axis=0.5 ,cex.lab = 0.5 )
lines(subsettime,subset3_1, lty=1)
lines(subsettime,subset3_2, lty=1, col = "red")
lines(subsettime,subset3_3, lty=1, col = "blue")
legend("topright",legend=c("sub_metering_1","sub_metering_2","sub_metering_3"),col=c("black","red","blue"),lty=c(1,1,1),cex=0.5, pt.cex=1,box.col="transparent")
box(lty = 'solid', col = 'black')
#graph4
plot(subsettime, subset4, type = "n",ylab ="Global_reactive_power",xlab="datetime", cex.axis=0.5,cex.lab = 0.5)
#axis(2,cex.axis=0.5)
lines(subsettime,subset4, lty=1)



dev.copy(png,'plot4.png',width = 480, height = 480,bg = "transparent")
dev.off()
