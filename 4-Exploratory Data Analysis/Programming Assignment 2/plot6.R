NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

png(filename = "plot6.png", height = 720, width = 720)
par(bg = "transparent")

scccopy <- SCC[SCC$EI.Sector == "Mobile - On-Road Diesel Heavy Duty Vehicles" | SCC$EI.Sector == "Mobile - On-Road Diesel Light Duty Vehicles" | SCC$EI.Sector == "Mobile - On-Road Gasoline Heavy Duty Vehicles" | SCC$EI.Sector == "Mobile - On-Road Gasoline Light Duty Vehicles", 1]

NEI1 <- NEI[NEI$fips == "24510",]
NEI2 <- NEI[NEI$fips == "06037",] 
NEI1 <- NEI1[NEI1$SCC %in% scccopy,]
NEI2 <- NEI2[NEI2$SCC %in% scccopy,]

t1 <- (sum(NEI1[NEI1$year == 1999,4]))
t2 <- (sum(NEI1[NEI1$year == 2002,4]))
t3 <- (sum(NEI1[NEI1$year == 2005,4]))
t4 <- (sum(NEI1[NEI1$year == 2008,4]))

u1 <- (sum(NEI2[NEI2$year == 1999,4]))
u2 <- (sum(NEI2[NEI2$year == 2002,4]))
u3 <- (sum(NEI2[NEI2$year == 2005,4]))
u4 <- (sum(NEI2[NEI2$year == 2008,4]))

y <- c(t1,t2,t3,t4)
z <- c(u1,u2,u3,u4)
x <- unique(NEI1$year)

plot(x, z, ylim = c(0,5000), pch = 19, type = "b", lty = 2, col = "blue", xlab = "Years", ylab = "PM2.5 (Tons / Year)")
par(new = TRUE)
plot(x, y, ylim = c(0,5000), pch = 19, type = "b", lty = 2, col = "red", xlab = "Years", ylab = "PM2.5 (Tons / Year)")
title("BALTIMORE(RED) VS LOG ANGELES COUNTY(BLUE) PM2.5 EMISSION")
text(x,y,round(y,2), cex = 0.85, adj = c(0.5,-0.7))
text(x,z,round(z,2), cex = 0.85, adj = c(0.5,-0.7))

dev.off()