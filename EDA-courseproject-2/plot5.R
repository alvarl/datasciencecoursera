library(ggplot2)
pm25all <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

motorVehicleSCCs <- SCC[SCC$Data.Category == "Onroad", ]
motorVehicleSCCs <- as.character(motorVehicleSCCs[, "SCC"])

baltimoreMVRecords <- pm25all[pm25all$fips == "24510" & pm25all$SCC %in% motorVehicleSCCs,]

sumEmissions <- aggregate(data = baltimoreMVRecords, Emissions ~ year, sum)
sumEmissions$year <- as.character(sumEmissions$year)

plot <- ggplot(sumEmissions, aes(x = year, y = Emissions, group = 1)) 
plot + geom_line() + ggtitle("Total PM2.5 emissions in Baltimore \nfrom motor vehicle sources 1998-2008")
ggsave("plot5.png", width = 6, height = 3)
dev.off()

