#Correlação entre o tipo de smell Lazy Class com o codeChurn

smell_lazy_class = dbGetQuery(new_bd,"SELECT * FROM BASE_ULTIMATE WHERE BASE_ULTIMATE.smell_lazy_class NOT NULL")

churn = smell_lazy_class$linesEdited
smell_lazy_class = smell_lazy_class$smell_lazy_class

corr_lazy_class = cor.test(churn,smell_lazy_class, method = "spearman", exact = FALSE)


#PLOT GRAFICO
CHURN = (churn)/1000
plot(CHURN, smell_lazy_class, pch = 23, ylim = c(0,800), xlim = c(0,800),  col = "black", main="TD(Large Class) x KLOC")
abline(lm(smell_lazy_class ~ CHURN), col = "red")