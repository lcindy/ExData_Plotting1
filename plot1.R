#R code for plot1
#Exploratory Data Analysis Project 1

setwd("D:/Coursera/DataScience/ExploratoryDataAnalysis/Project1/exdata-data-household_power_consumption")
#read data
usedata<-read.table("household_power_consumption.txt", header=T,sep=";")

#filter data
flag<-usedata[,1]=="1/2/2007" | usedata[,1]=="2/2/2007"
newdata<-usedata[flag,]
#create graph
hist(as.numeric(levels(newdata[,3])[newdata[,3]]),col="red",xlab ="Global_active_power(in kilowatt)", main ="Global Active Power",cex.axis=0.75,cex.lab = 0.75 )
#save as png file
dev.copy(png,'plot1.png',width = 480, height = 480,bg = "transparent")
dev.off()
