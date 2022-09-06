#Correlação entre o tipo de smell Long parameter List com o codeChurn

smell_long_parameter_list = dbGetQuery(new_bd,"SELECT * FROM BASE_ULTIMATE WHERE BASE_ULTIMATE.smell_long_parameter_list NOT NULL")

churn = smell_long_parameter_list$linesEdited
smell_long_parameter_list = smell_long_parameter_list$smell_long_parameter_list

corr_long_parameter_list = cor.test(churn,smell_long_parameter_list, method = "spearman", exact = FALSE)


#PLOT GRAFICO
CHURN = (churn)/1000
plot(CHURN, smell_long_parameter_list, pch = 23, ylim = c(0,800), xlim = c(0,800),  col = "black", main="TD(Long Parameter List) x KLOC")
abline(lm(smell_long_parameter_list ~ CHURN), col = "red")