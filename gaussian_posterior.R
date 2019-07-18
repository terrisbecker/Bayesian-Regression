library(MASS)
library(rdist)
library(wesanderson)

# Function for computing gaussian covariance between two vectors
# Input: v1 - vector of length n
#        v2 - vector of length m
# Retruns: an n+m X n+m matrix of pairwise covariances
gp.cov <- function(v1, v2, l = 1, t = 1){
	out.rows <- length(v1)
	cov.mat <- t^2*exp(pdist(c(v1,v2))^2/(-2*l^2))
	return(cov.mat)
}

# Function to compute a random selection from a GP posterior assuming mean zero prior
# Input: test inputs, train inputs, train outputs
# Returns: a vector of test outputs corresponding to 'y values' of a gaussian process
gp.posterior <- function(test.in, train.in, train.out){
	train.l <- length(train.in)
	print('computing covariances')
	K <- gp.cov(train.in, test.in)
	print('computing mean vector')
	mean.vec <- K[(train.l+1):nrow(K), 1:train.l]%*%solve(K[1:train.l, 1:train.l])%*%train.out
	print('computing posterior covariance')
	#cov.vec <- K[(train.l+1):nrow(K), (train.l+1):ncol(K)] - 
	#	K[(train.l+1):nrow(K), 1:train.l]%*%solve(K[1:train.l, 1:train.l])%*%K[1:train.l, (train.l+1):ncol(K)]
	#f <- mvrnorm(1, mean.vec, cov.vec)
	return(mean.vec)
}


# An Example
x <- seq(-5, 5, 0.1)
train.in <- c(-4, -3, -1, 0, 2)
train.out <- c(-2, 0, 1, 2, -1)
f <- gp.posterior(x, train.in, train.out)
plot(x, f, type = 'l')
f <- gp.posterior(x, train.in, train.out)
lines(x, f)
points(train.in, train.out)