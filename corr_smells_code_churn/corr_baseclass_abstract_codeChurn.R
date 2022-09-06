#Correlação entre o tipo de smell Baseclass Abstract com o codeChurn

smell_baseclass_abstract = dbGetQuery(new_bd,"SELECT * FROM BASE_ULTIMATE WHERE BASE_ULTIMATE.smell_baseclass_abstract NOT NULL")

churn = smell_baseclass_abstract$linesEdited
smell_baseclass_abstract = smell_baseclass_abstract$smell_baseclass_abstract

corr_baseclass_abstract = cor.test(churn,smell_baseclass_abstract, method = "spearman", exact = FALSE)


#PLOT GRAFICO
CHURN = (churn)/1000
plot(CHURN, smell_baseclass_abstract, pch = 23, ylim = c(0,800), xlim = c(0,800),  col = "black", main="TD(Baseclass Abstract) x KLOC")
abline(lm(smell_baseclass_abstract ~ CHURN), col = "red")