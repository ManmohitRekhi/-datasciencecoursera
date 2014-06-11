NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

png(filename = "plot4.png", height = 720, width = 720)
par(bg = "transparent")

scccopy <- SCC[SCC$EI.Sector == "Fuel Comb - Comm/Institutional - Coal" | SCC$EI.Sector == "Fuel Comb - Electric Generation - Coal" | SCC$EI.Sector == "Fuel Comb - Industrial Boilers, ICEs - Coal", 1]

NEI1 <- NEI[NEI$SCC %in% scccopy,]

t1 <- (sum(NEI1[NEI1$year == 1999,4]))/1000
t2 <- (sum(NEI1[NEI1$year == 2002,4]))/1000
t3 <- (sum(NEI1[NEI1$year == 2005,4]))/1000
t4 <- (sum(NEI1[NEI1$year == 2008,4]))/1000

y <- c(t1,t2,t3,t4)
x <- unique(NEI1$year)

plot(x, y, pch = 19,type = "b", lty = 2, col = "blue", xlab = "Years", ylab = "PM2.5 (KiloTons / Year)")
title("NATIONAL EMISSION FROM COAL COMBUSTION-RELATED SOURCES")
text(x,y,round(y,2), cex = 1, adj = c(0.5,-0.7))

dev.off()