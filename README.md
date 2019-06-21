# Bayesian-Regression
Useful functions for performing Bayesian linear regression and time series analysis.

## bayesian_linear_regression.R 
### beta.posterior
Function that computes the marginal posterior distribution for the weight parameters (coefficients) in an ordinary linear regression problem. Assumes the prior is 1/sigma^2 so that the posterior for weights follows a multivariate normal distribution.

Inputs:
+ X - a design matrix of independent variables
+ y - a vector of observed dependent variables

Outputs: A list

+ $Beta - Vector of the point estimates for the weight parameters
+ $Cov - A covariance matrix for the weights prior to multiplication by sigma^2.

## References
Gelman, A., Carlin, J. B., Stern, H. S., and Rubin, D. B. (2004). Bayesian Data Analysis. Chapman and Hall/CRC, 3rd ed. edition.
