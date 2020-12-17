library(glmnet)
set.seed(1)
n<- 70
p <- 140
s <- 70
sim_time <- 50
Z <- matrix(rnorm(p*n),nrow = n)
Z <- scale(Z)/sqrt(p)
X <- matrix(rnorm(1*1),nrow = n)
X_matrix <- matrix(rep(1,n),nrow = n)
sigma2beta_true <- 0.6 * (p/s)
sigme2e_true <- 0.4
sigma2beta_sim <- 0
sigma2e_sim <- 0
for(i in 1:sim_time){
  beta <- sqrt(sigma2beta_true) * rnorm(p*1,0,1)
  beta[(s+1):p] <- 0
  epsilon <- sqrt(sigme2e_true) * rnorm(n*1,0,1)
  Y <- X + Z %*% beta +epsilon
  result_lasso <- cv.glmnet(cbind(X_matrix,Z),Y)
  predict_lasso <- predict(result_lasso,cbind(X_matrix,Z), s= "lambda.min")
  nz <- sum(coef(result_lasso,s='lambda.min')!=0)
  sigma2e_lasso <- sum((Y-predict_lasso)^2)/(n-nz-1)
  print(i)
  
  sigma2e_sim[i] <- sigma2e_lasso
}
