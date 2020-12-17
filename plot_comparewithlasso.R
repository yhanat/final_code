#Compare the LASSO and REML of LMM in case n = 70, p = 140, s = 10,70,110,139
h_true <- 0.6
load('/Users/eichiwai/Desktop/final_exam_hw_review/final_project_5472/result_simulation/np70140_s_10_lassO.RData')
load('/Users/eichiwai/Desktop/final_exam_hw_review/final_project_5472/result_simulation/np70140_s_10_lmm.RData')

s_139 <- data.frame(sigma2e_lasso,sigma2e_sim,sigma2beta_sim)
s_139_true <- data.frame(sigme2e_true,sigma2beta_true)
load('/Users/eichiwai/Desktop/final_exam_hw_review/final_project_5472/result_simulation/np70140_s_110_lasso.RData')
load('/Users/eichiwai/Desktop/final_exam_hw_review/final_project_5472/result_simulation/np70140_s_110lmm.RData')
s_110 <- data.frame(sigma2e_lasso,sigma2e_sim,sigma2beta_sim)
s_110_true <- data.frame(sigme2e_true,sigma2beta_true)
load('/Users/eichiwai/Desktop/final_exam_hw_review/final_project_5472/result_simulation/np70140_s_70_lasso.RData')
load('/Users/eichiwai/Desktop/final_exam_hw_review/final_project_5472/result_simulation/np70140_s_70lmm.RData')

s_70 <- data.frame(sigma2e_lasso,sigma2e_sim,sigma2beta_sim)
s_70_true <- data.frame(sigme2e_true,sigma2beta_true)
load('/Users/eichiwai/Desktop/final_exam_hw_review/final_project_5472/result_simulation/np70140_s_10_lassO.RData')
load('/Users/eichiwai/Desktop/final_exam_hw_review/final_project_5472/result_simulation/np70140_s_10_lmm.RData')

s_10 <- data.frame(sigma2e_lasso,sigma2e_sim,sigma2beta_sim)
s_10_true <- data.frame(sigme2e_true,sigma2beta_sim)

boxplot(s_10$sigma2e_lasso,s_10$sigma2e_sim,s_70$sigma2e_lasso,s_70$sigma2e_sim,
        s_110$sigma2e_lasso,s_110$sigma2e_sim,s_139$sigma2e_lasso,s_139$sigma2e_sim,
        ylab = 'estimated variance(truth = 0.4)',xlab = 's= 10, s = 70,s = 110,s = 139')