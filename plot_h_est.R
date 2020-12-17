#Compare the LASSO and REML of LMM in case n = 70, p = 140, s = 10,70,110,139
h_true <- 0.6
load('/Users/eichiwai/Desktop/final_exam_hw_review/final_project_5472/result_simulation/n_p_100__s_20.RData')
h<- sigma2beta_sim^2/(sigma2beta_sim^2+sigma2e_sim^2)

s_20 <- data.frame(sigma2e_sim,sigma2beta_sim,h)
load('/Users/eichiwai/Desktop/final_exam_hw_review/final_project_5472/result_simulation/n_p_100__s_60.RData')
h<- sigma2beta_sim^2/(sigma2beta_sim^2+sigma2e_sim^2)

s_60<- data.frame(sigma2e_sim,sigma2beta_sim,h)
load('/Users/eichiwai/Desktop/final_exam_hw_review/final_project_5472/result_simulation/n_p_100__s_80.RData')
h<- sigma2beta_sim^2/(sigma2beta_sim^2+sigma2e_sim^2)

s_80 <-data.frame(sigma2e_sim,sigma2beta_sim,h)
load('/Users/eichiwai/Desktop/final_exam_hw_review/final_project_5472/result_simulation/n_p_100__s_99.RData')
h<- sigma2beta_sim^2/(sigma2beta_sim^2+sigma2e_sim^2)

s_99 <- data.frame(sigma2e_sim,sigma2beta_sim,h)

boxplot(s_20$h,s_60$h,s_80$h,s_99$h,
        ylab = 'estimated h(truth = 0.6)',xlab = 's= 20, s = 60,s = 80,s = 99')