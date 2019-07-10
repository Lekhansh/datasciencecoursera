file.url <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
file.name <- "dataset.zip"
download.file(url = file.url, destfile = paste(file.name))

unzip("dataset.zip")
packages_required <-
    list("dplyr", "lubridate")
lapply(packages_required, require, character.only = TRUE)
dat <- read.table(file = "household_power_consumption.txt",
    as.is = TRUE, na.strings = "?", header = TRUE, sep = ";") # note the NA and string as factors
dat$datetime <- paste(dat$Date,dat$Time) # as characters

dat$Date <- dmy(dat$Date)
dat$Time <- hms(dat$Time)
dat$datetime <- dmy_hms(dat$datetime) # as date-time object
a <- ymd("2007-02-01")
b <- ymd("2007-02-02")

dat1 <- dat %>%
    filter(Date == a| Date == b) # subset
rm("dat")
par(mfrow = c(2,2)) # setting the grid, row must be filled first
# Plot1
with(dat1, plot(datetime,Global_active_power,type = "l",
    ylab = "Global Active Power (kilowatts)", xlab = ""))
# Plot 2
with(dat1, plot(datetime,Voltage,type = "l",
    ylab = "Voltage"))
#Plot 3
with(dat1, plot(datetime,Sub_metering_1,type = "l", col = "black", ylab = "Energy sub metering",
    xlab = ""))
with(dat1, lines(datetime,Sub_metering_2, col = "red"))
with(dat1,lines(datetime,Sub_metering_3,col = "blue"))
legend(x = "topright",lty = 1,lwd = 2, col = c("black","red","blue"),
    legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))
# Plot 4
with(dat1, plot(datetime,Global_reactive_power,type = "l",
    ylab = "Global Reactive Power (kilowatts)"))
dev.copy(png, file = "Plot_4.png", height = 480, width = 480) # copying to png
dev.off()
