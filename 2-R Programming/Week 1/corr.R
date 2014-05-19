corr <- function(directory, threshold = 0) 
{
	data1 <- complete(directory)
	true1 <- data1[,"nobs"] > threshold
	data2 <- data1[true1,]
	count <- nrow(data2)
	corre <- numeric(count)
	for(j in 1:count)
	{
		i <- data2[j,"id"]
		if(count < 1) break
		str <- ""
		if(i < 10)
		{
			str <- paste("00", as.character(i) ,".csv", sep ="")
		}
		else if(i < 100)
		{
			str <- paste("0", as.character(i) ,".csv", sep = "")
		}
		else
		{
			str <- paste(as.character(i) ,".csv", sep = "")
		}
		str <- paste(directory, "/", str, sep ="")
		data3 <- read.csv(str)
		good <- complete.cases(data3)
		data4 <- data3[good,]
		nit <- data4[,"nitrate"]
		sul <- data4[,"sulfate"]
		corre[j] = cor(nit, sul)
	}
	corre
}