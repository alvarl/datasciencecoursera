library(ggplot2)
pm25all <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

motorVehicleSCCs <- SCC[SCC$Data.Category == "Onroad", ]
motorVehicleSCCs <- as.character(motorVehicleSCCs[, "SCC"])

mvRecords <- pm25all[(pm25all$fips == "24510" | pm25all$fips == "06037") & pm25all$SCC %in% motorVehicleSCCs,]

sumEmissions <- aggregate(data = mvRecords, Emissions ~ year + fips, sum)
sumEmissions$year <- as.character(sumEmissions$year)
sumEmissions$location <- ifelse(sumEmissions$fips == "06037", "Los Angeles", "Baltimore")

plot <- ggplot(sumEmissions) + geom_line(aes(x = year, y = Emissions, colour = location, group = location)) 
plot + ggtitle("Total PM2.5 emissions\nfrom motor vehicle sources 1998-2008")

ggsave("plot6.png", width = 6, height = 3)
dev.off()

