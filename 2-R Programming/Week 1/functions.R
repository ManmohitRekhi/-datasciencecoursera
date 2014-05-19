add2 <- function(x,y)
{
	x + y
}

above10 <-function(x)
{
	use <- x > 10
	x[use]
}

aboven <- function(x,n = 10)
{
	use <- x > n
	x[use]
}

coloummean <- function(y)
{
	nc <- ncol(y)
	means <- numeric(nc)
	for( i in 1:nc )
	{
		means[i] = means(y[,i])
	}
	means
}