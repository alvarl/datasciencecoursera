library(ggplot2)
pm25all <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")
baltimoreData <- pm25all[pm25all$fips == "24510",]
totalByYear <- aggregate(baltimoreData$Emissions ~ baltimoreData$year + baltimoreData$type, baltimoreData, sum)
names(totalByYear) <- c("year", "type", "emissions")
plot <- ggplot(totalByYear) + geom_line(aes(x= year, y = emissions, group = type, colour = type))
plot + ggtitle("Change in PM2.5 emissions by type in Baltimore 1999-2008")
ggsave("plot3.png", width = 6, height = 3)
dev.off()

