#Correlação entre o tipo de smell Large Class com o codeChurn

smell_large_class = dbGetQuery(new_bd,"SELECT * FROM BASE_ULTIMATE WHERE BASE_ULTIMATE.smell_large_class NOT NULL")

churn = smell_large_class$linesEdited
smell_large_class = smell_large_class$smell_large_class

corr_large_class = cor.test(churn,smell_large_class, method = "spearman", exact = FALSE)


#PLOT GRAFICO
CHURN = (churn)/1000
plot(CHURN, smell_large_class, pch = 23, ylim = c(0,800), xlim = c(0,800),  col = "black", main="TD(Large Class) x KLOC")
abline(lm(smell_large_class ~ CHURN), col = "red")