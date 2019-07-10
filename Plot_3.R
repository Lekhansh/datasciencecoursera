file.url <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
file.name <- "dataset.zip"
download.file(url = file.url, destfile = paste(file.name))

unzip("dataset.zip")
packages_required <-
    list("dplyr", "lubridate")
lapply(packages_required, require, character.only = TRUE)
dat <- read.table(file = "household_power_consumption.txt",
    as.is = TRUE, na.strings = "?", header = TRUE, sep = ";")
dat$datetime <- paste(dat$Date,dat$Time)
str(dat)
dat$Date <- dmy(dat$Date)
dat$Time <- hms(dat$Time)
dat$datetime <- dmy_hms(dat$datetime)
a <- ymd("2007-02-01")
b <- ymd("2007-02-02")

dat1 <- dat %>%
    filter(Date == a| Date == b)
rm("dat")

with(dat1, plot(datetime,Sub_metering_1,type = "l", col = "black", ylab = "Energy sub metering",
    xlab = "")) # submeter 1
with(dat1, lines(datetime,Sub_metering_2, col = "red")) # overlay submeter 2 on the same plot
with(dat1,lines(datetime,Sub_metering_3,col = "blue"))
legend(x = "topright",lty = 1,lwd = 2, col = c("black","red","blue"),
    legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3")) # placing the legent
dev.copy(png, file = "Plot_3.png", height = 480, width = 480) # copying to png
dev.off()
