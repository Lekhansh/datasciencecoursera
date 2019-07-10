file.url <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
file.name <- "dataset.zip"
download.file(url = file.url, destfile = paste(file.name))# downloading file
unzip("dataset.zip") # unzip
packages_required <-
    list("dplyr", "lubridate") # for manipulating date and time
lapply(packages_required, require, character.only = TRUE) # load the required packages
dat <- read.table(file = "household_power_consumption.txt",
    as.is = TRUE, na.strings = "?", header = TRUE, sep = ";") # NA is coded as ?, prevent strings as factors
dat$datetime <- paste(dat$Date,dat$Time) # a column with both date and time

dat$Date <- dmy(dat$Date) # converting to date object
dat$Time <- hms(dat$Time) # time object
dat$datetime <- dmy_hms(dat$datetime) # date-time object
a <- ymd("2007-02-01") # wanted
b <- ymd("2007-02-02") # wanted

dat1 <- dat %>%
    filter(Date == a| Date == b) # subsetting
rm("dat")

with(dat1, plot(datetime,Global_active_power,type = "l",
    ylab = "Global Active Power (kilowatts)")) # making the plot on screen to check
dev.copy(png, file = "Plot_2.png", height = 480, width = 480) # copy to png (make sure there are no other plots on the screen)
dev.off() # close the device
