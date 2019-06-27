library(MASS)
library(ridist)

# My gaussian process function. Uses the gaussian kernel as a covariance matrix and has
# mean of zero. Looking to support other mean and covariance functions soon. 
gp <- function(x){
	mean.vec <- integer(length(x))
	cov.vec <- exp(-0.5*(pdist(x)/.4)^2)
	f <- mvrnorm(1, mean.vec, cov.vec)
	return(f)
}