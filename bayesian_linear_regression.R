# Function that computes the marginal posterior distribution for the weight parameters 
# (Betas) in an ordinary linear regression problem. Assumes the prior is 1/sigma^2 so that
# the posterior for weights follows a multivariate normal distribution
# Inputs:
	# X - a design matrix of independent variables
	# y - a vector of observed dependent variables
# Outputs: A list 
	# Beta - Vector of the point estimates for the weight parameters
	# Cov - A covariance matrix for the weights assuming that sigma^2 = 1

beta.posterior <- function(X, y){
	beta.hat <- solve(t(X)%*%X)%*%t(X)%*%y
	V.beta <- solve(t(X)%*%X)
	beta.list <- list(beta.hat, V.beta)
	names(beta.list) <- c('Beta', 'Cov')
	return(beta.list)
}