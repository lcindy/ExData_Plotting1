#R code for plot2
#Exploratory Data Analysis Project 1

setwd("D:/Coursera/DataScience/ExploratoryDataAnalysis/Project1/exdata-data-household_power_consumption")
#read data
usedata<-read.table("household_power_consumption.txt", header=T,sep=";")
#filter data
flag<-usedata[,1]=="1/2/2007" | usedata[,1]=="2/2/2007"
newdata<-usedata[flag,]
#create subset of data and timestamps
subsetdata<-as.numeric(levels(newdata[,3])[newdata[,3]])
subsettime<-(strptime(paste(newdata[,1],newdata[,2]),"%d/%m/%Y %H:%M:%S"))
#plot
plot(subsettime, subsetdata, type = "n",ylab ="Global Active Power (kilowatts)",xlab="",cex.lab = 0.75,cex.axis = 0.75 )
lines(subsettime,subsetdata, lty=1)
#create png file
dev.copy(png,'plot2.png',width = 480, height = 480, bg = "transparent")
dev.off()
