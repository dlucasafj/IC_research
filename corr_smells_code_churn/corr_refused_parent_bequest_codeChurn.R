#Correlação entre o tipo de smell Refused Parent Bequest com o codeChurn

smell_refused_parent_bequest = dbGetQuery(new_bd,"SELECT * FROM BASE_ULTIMATE WHERE BASE_ULTIMATE.smell_refused_parent_bequest NOT NULL")

churn = smell_refused_parent_bequest$linesEdited
smell_refused_parent_bequest = smell_refused_parent_bequest$smell_refused_parent_bequest

corr_refused_parent_bequest = cor.test(churn,smell_refused_parent_bequest, method = "spearman", exact = FALSE)


#PLOT GRAFICO
CHURN = (churn)/1000
plot(CHURN, smell_refused_parent_bequest, pch = 23, ylim = c(0,800), xlim = c(0,800),  col = "black", main="TD(Refused Parent Bequest) x KLOC")
abline(lm(smell_refused_parent_bequest ~ CHURN), col = "red")