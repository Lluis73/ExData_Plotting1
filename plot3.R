## Downloading and unzipping file
if (!file.exists("household_power_consumption.txt")) {
    url <-
        "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
    download.file(url, "household_pw_cons.zip", "curl")
    unzip("household_pw_cons.zip")
}
## Reading file into data frame
house_cons <-
    read.table("./household_power_consumption.txt",
               sep = ";",
               header = TRUE)
## Selecting desired days
house_cons <- subset(house_cons, Date == "1/2/2007" |
                         Date == "2/2/2007")
## Creation of variable with format date_time
house_cons$Date_time <-
    strptime(paste(house_cons$Date, house_cons$Time, sep = " "),
             "%d/%m/%Y %H:%M:%S")
## Creation of 3 xy-line for different measures with legend
par(mfrow = c(1, 1), mar = c(4, 4, 1, 0))
with(
    house_cons,
    plot(
        Date_time,
        as.numeric(Sub_metering_1),
        type = "l",
        xlab = " ",
        ylab = "Energy sub metering"
    )
)
with(house_cons, lines(Date_time, as.numeric(Sub_metering_2), col = "red"))
with(house_cons, lines(Date_time, as.numeric(Sub_metering_3), col = "blue"))
legend(
    "topright",
    
    pch = "-",
    col = c("black", "red", "blue"),
    legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3")
)
## save graphic to png with 480x480 pixels
dev.copy(png,
         file = "plot3.png",
         width = 580,
         height = 580)
dev.off()