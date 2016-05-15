pm25all <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")
totalByYear <- aggregate(pm25all$Emissions ~ pm25all$year, pm25all, sum)
names(totalByYear) <- c("year", "emissions")
png("plot1.png", width = 480, height = 480, units = "px")
plot(totalByYear, xaxt = "n")
axis(side = 1, at = totalByYear$year,labels = T)
dev.off()

