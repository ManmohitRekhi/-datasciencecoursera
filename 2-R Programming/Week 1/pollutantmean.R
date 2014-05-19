pollutantmean <- function(directory, pollutant, id = 1:332)
{
	sum <- 0.0
	len <- 0
	for(i in id)
	{
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
		data <- read.csv(str)
		bad <- is.na(data[,pollutant])
		data1 <- data[!bad,][,]
		sum <- sum(data1[,pollutant]) + sum
		len <- nrow(data1[]) + len
	}
	print(sum/len)
}