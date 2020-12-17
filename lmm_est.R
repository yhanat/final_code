set.seed(1)
n<- 70
p <- 140
s <- 70
sim_time <- 30
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

flag <- 0
thetaEstEqREML <- function(theta, Z, Y, X, sigma2e){
  QthetaInv <- solve(diag(length(Y))+theta * Z %*% t(Z))
  Ptheta <- QthetaInv - QthetaInv %*% X %*% solve(t(X) %*% QthetaInv %*% X) %*% t(X) %*% QthetaInv
  return(sum(diag(Ptheta %*% Z %*% t(Z))) -
           as.numeric(t(Y) %*% Ptheta %*% Z %*% t(Z) %*% Ptheta %*% Y) / sigma2e)
}


theta <- 1
for (k in 1:200){ # for-loop, alternating between theta and error variance estimation
  thetaPrev  <- theta
  QthetaInv <- solve(diag(length(Y)) + theta * Z %*% t(Z))
  Ptheta  <- QthetaInv -
    QthetaInv %*% X_matrix %*%
    solve(t(X_matrix) %*% QthetaInv %*% X_matrix) %*% t(X_matrix) %*% QthetaInv 
  sigma2e <- t(Y) %*% Ptheta %*% Y / (length(Y)-2)
  theta<- uniroot(thetaEstEqREML, c(0, 100),
                  Z=Z, Y=Y, X=X_matrix, sigma2e=sigma2e)$root
  if(theta<1e-1) {
    flag <- 1
    break}
  if (abs(theta - thetaPrev) < 10^(-5)){ break }
}
if(flag > 0){
  i <- i-1
  next
}
print(i)
sigma2beta_sim[i] <- sigma2e * theta
sigma2e_sim[i] <- sigma2e 
}
