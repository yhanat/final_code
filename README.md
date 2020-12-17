# final_code
The code accompanied with the final report in the course, which include the implment of REML estimation of variance component on a toy example.

The repository contain 4 R files and severl Rdata files.

### R files:
1. In lmm_est we use REML to estimate the variance parameter sigma_e,sigma_alpha under the different setting of dimension p, sample size n and misspecified level s.
2. In lasso_est we use  LASSO to estimate the variance parameter sigma_e under the different setting of dimension p, sample size n and sparse level s.
3. In plot_h_est we plot the estimation result of hertability h^2 = (sigma_alpha^2)/(sigma_alpha^2+sigma_e^2) using LMM with n= p = 100,s = 20,25,40,60,80,99. The true hertability is always 0.6 
4. In plot_h_est we plot the estimation result of sigma_e^2 using LMM and LASSO with n=70, p = 140,s = 10,70,110,139. The true sigma_e^2 is always 0.4

### Rdata files:
Rdata files with name 'n_p_A_1_A2__s_A3__LMM/LASSO.RData' contain the result of estimatied sigma_e^2 under the setting n = A1,p = A2,s = A3 using LASSO or LMM. 
Rdata files with name 'n_p_A_1__s_A2.RData' contain the result of estimatied h^2 under the setting n = p = A1,s = A2 using LMM.
