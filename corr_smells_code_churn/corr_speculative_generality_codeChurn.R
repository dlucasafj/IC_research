#Correlação entre o tipo de smell Speculative Generality com o codeChurn

smell_speculative_generality = dbGetQuery(new_bd,"SELECT * FROM BASE_ULTIMATE WHERE BASE_ULTIMATE.smell_speculative_generality NOT NULL")

churn = smell_speculative_generality$linesEdited
smell_speculative_generality = smell_speculative_generality$smell_speculative_generality

corr_speculative_generality = cor.test(churn,smell_speculative_generality, method = "spearman", exact = FALSE)


#PLOT GRAFICO
CHURN = (churn)/1000
plot(CHURN, smell_speculative_generality, pch = 23, ylim = c(0,800), xlim = c(0,800),  col = "black", main="TD(Speculative Generality) x KLOC")
abline(lm(smell_speculative_generality ~ CHURN), col = "red")