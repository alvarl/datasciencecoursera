library(ggplot2)
pm25all <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

coalCombustion <- SCC[grep("Combustion", SCC$SCC.Level.One), ]
coalCombustion <- coalCombustion[grep("Coal", coalCombustion$SCC.Level.Three), ]
coalSCCs <- as.character(coalCombustion[, "SCC"])

coalRecords <- pm25all[pm25all$SCC %in% coalSCCs, ]
coalRecords <- group_by(coalRecords, year)

sumCoal <- aggregate(data = coalRecords, Emissions ~ year, sum)
names(sumCoal) <- c("year", "sumEmissions")
sumCoal$year <- as.character(sumCoal$year)

plot <- ggplot(sumCoal) + geom_line(aes(x= year, y = sumEmissions, group = 1))
plot + ggtitle("Total PM2.5 emissions from coal combustion sources 1999-2008")
ggsave("plot4.png", width = 6, height = 3)
dev.off()

