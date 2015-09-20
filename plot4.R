data<-read.csv2("household_power_consumption.txt")
# csv2 separate by ";"
#2075259 obs of 9 variables

######convert into Date
######################


date<-as.character(data[[1]]) # get Date column in character
time<-as.character(data[[2]]) # get time

TimeStamp<-paste(date,time,sep=" ");
TimeStamp<-strptime(TimeStamp,"%d/%m/%Y %H:%M:%S")
date<-strptime(date,"%d/%m/%Y")  # convert Date column into POSIXt
date<-as.Date(date) # POSIXt to Date
data[[1]]<-date # replace with date
data<-cbind(TimeStamp,data)
########################### Subset 1 and 2 feb###########3
s1<-"01/02/2007" 
s1<-as.Date(strptime(s1,"%d/%m/%Y"))
s2<-"02/02/2007"
s2<-as.Date(strptime(s2,"%d/%m/%Y"))
subset_data<-subset(data,Date==s1|Date==s2)
##########################################



par(mfrow=c(2,2)) # draw multi plot

########draw  Global_reactive_power
x<-subset_data$TimeStamp
y<-as.numeric(as.character(subset_data$Global_active_power))
y_label <- "Global Active Power"
x_label <- "datetime"
TYPE_LINE <-"l"
plot(x,y,ylab=y_label,xlab = "",type=TYPE_LINE)
########draw voltage 
x<-subset_data$TimeStamp
y<-as.numeric(as.character(subset_data$Voltage))
y_label <- "Voltage"
x_label <- "datetime"
TYPE_LINE <-"l"
plot(x,y,ylab=y_label,xlab = "",type=TYPE_LINE)

##############
############## draw energy sub metering
sub1<-subset_data$Sub_metering_1
sub2<-subset_data$Sub_metering_2
sub3<-subset_data$Sub_metering_3
x<-subset_data$TimeStamp

y_label<-"Energy Sub Metering"
x_label<-""

plot(x,sub1,ylab=y_label,type="l")
lines(x,sub2,col="red")
lines(x,sub3,col="blue")
legend("topright" # at top right
       ,c("Sub_metering_1","Sub_metering_2","Sub_metering_3") # name 
       ,lty='solid' # line
       ,col=c("black","red","blue")
       , bty='n'
)
########draw  Global_reactive_power
x<-subset_data$TimeStamp
y<-as.numeric(as.character(subset_data$Global_reactive_power))
y_label <- "Global_reactive_power"
x_label <- "datetime"
TYPE_LINE <-"l"
plot(x,y,ylab=y_label,xlab = "",type=TYPE_LINE)

#######output
dev.copy(png,filename="plot4.png")
dev.off ()
