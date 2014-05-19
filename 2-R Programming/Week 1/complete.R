complete <- function(directory, id = 1:332)
{
	len <- 1
	count <- length(id)
	nobs <- numeric(count)
	
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
		good <- complete.cases(data)
		data1 <- data[good,]
		nobs[len] <- nrow(data1[])
		len <- len + 1
	}
	data1 = data.frame(id = id, nobs = nobs)
	#print(data1)
	data1
}