pm25all <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")
baltimoreData <- pm25all[pm25all$fips == "24510",]
totalByYear <- aggregate(baltimoreData$Emissions ~ baltimoreData$year, baltimoreData, sum)
names(totalByYear) <- c("year", "emissions")
png("plot2.png", width = 480, height = 480, units = "px")
plot(totalByYear, xaxt = "n")
axis(side = 1, at = totalByYear$year,labels = T)
dev.off()

