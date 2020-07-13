## Downloading and unzipping file
if(!file.exists("household_power_consumption.txt")){
    url <-
        "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
    download.file(url, "household_pw_cons.zip", "curl")
    unzip("household_pw_cons.zip")    
}
## Reading file into data frame
house_cons<-read.table("./household_power_consumption.txt",sep=";",header=TRUE)
## Selecting desired days
house_cons <- subset(house_cons, Date == "1/2/2007" |
                         Date == "2/2/2007")
## Histogram on screen
par(mfrow = c(1, 1), mar = c(4, 4, 1, 0))
hist(
    as.numeric(house_cons$Global_active_power),
    main = "Global Active Power",
    col = "Red",
    xlab = "Global Active Power (kilowatts)"
)
## save graphic to png with 480x480 pixels
dev.copy(png,file="plot1.png",width=480,height=480)
dev.off()
