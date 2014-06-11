library("ggplot2")

NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

png(filename = "plot3.png", height = 720, width = 720)
par(bg = "transparent")

NEI1 <- NEI[NEI$fips == "24510",]
NEI1 <- NEI1[NEI1$Emissions != 0,]
NEI1 <- data.frame(NEI1, logpm = log10(NEI1$Emissions))

print(qplot(y = logpm, x = year, data =  NEI1, facets = . ~ type, geom = c("point", "smooth"), method = "lm", main = "LOG10 PM2.5 FOR BALTIMORE CITY FOR GIVEN YEARS BY TYPE", xlab = "Years", ylab = "Log10 PM2.5 Count"))

dev.off()