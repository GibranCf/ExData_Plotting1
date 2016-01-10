install.packages("dplyr")
library(dplyr)

DT<-read.csv("household_power_consumption.txt", sep=";")
DT[,1]<-as.Date(DT[,1], format="%d/%m/%Y")
subDT<-filter(DT, Date <= "2007-02-02" & Date >= "2007-02-01")
rm(DT)
as.numeric.factor <- function(x) {as.numeric(levels(x))[x]}

for(i in 3:9){
    
    subDT[,i]<-as.numeric.factor(subDT[,i])
}

subDT<-mutate(subDT, DateTime = paste(Date,Time))

subDT$DateTime<-strptime(subDT$DateTime, format="%Y-%m-%d %H:%M:%S")

with(subDT, plot(DateTime,Global_active_power,ylab="Global active power (kilowatts)", xlab="", type = "l" ))
