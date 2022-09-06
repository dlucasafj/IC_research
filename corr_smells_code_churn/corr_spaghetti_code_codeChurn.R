#Correlação entre o tipo de smell Spaghetti code com o codeChurn

smell_spaghetti_code = dbGetQuery(new_bd,"SELECT * FROM BASE_ULTIMATE WHERE BASE_ULTIMATE.smell_spaghetti_code NOT NULL")

churn = smell_spaghetti_code$linesEdited
smell_spaghetti_code = smell_spaghetti_code$smell_spaghetti_code

corr_spaghetti_code = cor.test(churn,smell_spaghetti_code, method = "spearman", exact = FALSE)


#PLOT GRAFICO
CHURN = (churn)/1000
plot(CHURN, smell_spaghetti_code, pch = 23, ylim = c(0,800), xlim = c(0,800),  col = "black", main="TD(Spaghetti Code) x KLOC")
abline(lm(smell_spaghetti_code ~ CHURN), col = "red")