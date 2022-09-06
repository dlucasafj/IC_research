#Correlação entre o tipo de smell Antisingleton com o codeChurn

smell_antisingleton = dbGetQuery(new_bd,"SELECT * FROM BASE_ULTIMATE WHERE BASE_ULTIMATE.smell_antisingleton NOT NULL")

churn = smell_antisingleton$linesEdited
smell_antisingleton = smell_antisingleton$smell_antisingleton
corr_antisingleton = cor.test(churn,smell_antisingleton, method = "spearman", exact = FALSE)


#PLOT GRAFICO
CHURN = (churn)/1000
plot(CHURN, smell_antisingleton, pch = 23, ylim = c(0,800), xlim = c(0,800),  col = "black", main="TD(Antisingleton) x KLOC")
abline(lm(smell_antisingleton ~ CHURN), col = "red")