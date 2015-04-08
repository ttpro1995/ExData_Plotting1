#plot1.R
data<-read.csv2("household_power_consumption.txt")
# csv2 separate by ";"
#2075259 obs of 9 variables

######convert into Date
######################


date<-as.character(data[[1]]) # get Date column in character
date<-strptime(date,"%d/%m/%Y")  # convert Date column into POSIXt
date<-as.Date(date) # POSIXt to Date

data[[1]]<-date # replace with date
########################### Subset 1 and 2 feb###########3
s1<-"01/02/2007" 
s1<-as.Date(strptime(s1,"%d/%m/%Y"))
s2<-"02/02/2007"
s2<-as.Date(strptime(s2,"%d/%m/%Y"))
subset_data<-subset(data,Date==s1|Date==s2)
###############################
hist_name<-"Global Active Power"
x_name="Global Active Power (kilowatts)"
histogram<- hist(as.numeric(as.character(subset_data$Global_active_power)),col="red",main=hist_name,xlab=x_name)
dev.copy(png,filename="plot.png");
dev.off ();
x<-c(1,2,3,4,3,2,1)
hist(x)