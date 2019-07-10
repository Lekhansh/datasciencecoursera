file.url <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
file.name <- "dataset.zip"
download.file(url = file.url, destfile = paste(file.name))
unzip("dataset.zip") # unzipped in the wd
packages_required <-
    list("dplyr", "lubridate") # for data manipulation and date-time objects
lapply(packages_required, require, character.only = TRUE)
dat <- read.table(file = "household_power_consumption.txt",
    as.is = TRUE, na.strings = "?", header = TRUE, sep = ";") # note the na character and as is
dat$datetime <- paste(dat$Date,dat$Time) # comined date time
dat$Date <- dmy(dat$Date)
dat$Time <- hms(dat$Time)
dat$datetime <- dmy_hms(dat$datetime) # correct classes of date, time, date-time columns
a <- ymd("2007-02-01")
b <- ymd("2007-02-02")

dat1 <- dat %>%
    filter(Date == a| Date == b) # subsetting
rm("dat")
hist(dat1$Global_active_power, main = "Global Active Power", xlab =
        "Global Active Power (kilowatts)", col = "red") # checking on screen
dev.copy(png, file = "Plot1.png",height = 480, width = 480) # copying to png
dev.off() # closing the device
