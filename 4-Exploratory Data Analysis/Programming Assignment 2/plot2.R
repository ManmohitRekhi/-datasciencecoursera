NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

png(filename = "plot2.png", height = 720, width = 720)
par(bg = "transparent")

NEI <- NEI[NEI$fips == "24510",]

t1 <- (sum(NEI[NEI$year == 1999,4]))/1000
t2 <- (sum(NEI[NEI$year == 2002,4]))/1000
t3 <- (sum(NEI[NEI$year == 2005,4]))/1000
t4 <- (sum(NEI[NEI$year == 2008,4]))/1000


y <- c(t1,t2,t3,t4)
x <- unique(NEI$year)

plot(x, y, pch = 19,type = "b", lty = 2, col = "blue", xlab = "Years", ylab = "PM2.5 (KiloTons / Year)")
title("BALTIMORE CITY ANNUAL KILOTON LEVEL OF PM2.5")
text(x,y,round(y,2), cex = 1, adj = c(0.5,-0.7))

dev.off()