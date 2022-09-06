#Correlação entre o tipo de smell Long Method com o codeChurn

smell_long_method = dbGetQuery(new_bd,"SELECT * FROM BASE_ULTIMATE WHERE BASE_ULTIMATE.smell_long_method NOT NULL")

churn = smell_long_method$linesEdited
smell_long_method = smell_long_method$smell_long_method

corr_long_method = cor.test(churn,smell_long_method, method = "spearman", exact = FALSE)


#PLOT GRAFICO
CHURN = (churn)/1000
plot(CHURN, smell_long_method, pch = 23, ylim = c(0,800), xlim = c(0,800),  col = "black", main="TD(Long Method) x KLOC")
abline(lm(smell_long_method ~ CHURN), col = "red")