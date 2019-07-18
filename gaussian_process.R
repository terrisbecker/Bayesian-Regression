library(MASS)
library(rdist)
library(wesanderson)

# Supports two covariance functions
	# 'gaussian' -  uses the squared exponential kernel
	# 'sigma' - uses the identity matrix multiplied by a scalar. i.e. the obs are inedpendent

gp <- function(x, mean.vec, kernel = 'gaussian', sigma = 1){
	if (kernel == 'gaussian'){
		cov.vec <- exp(-0.5*pdist(x)^2)
	}
	if (kernel == 'sigma'){
		cov.vec <- sigma*diag(length(x))
	}
	f <- mvrnorm(1, mean.vec, cov.vec)
	return(f)
}

# An example
x <- seq(1,10, by = 1)
mean.vec <- train.in
f <- gp(train.in, mean.vec)
mycols <- wes_palette('Zissou1', 5, type = 'continuous')

plot(x, f, ylim = c(-5,5), col = mycols[1], type = 'l')
for (i in 2:5){
	f <- gp(x, mean.vec)
	lines(x, f, col = mycols[i])
}