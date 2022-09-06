# Correlação entre o tipo de smell Complex class com o codeChurn dos devs


smell_complex_class = dbGetQuery(new_bd,"SELECT * FROM BASE_ULTIMATE WHERE  BASE_ULTIMATE.smell_complex_class NOT NULL")


churn = smell_complex_class$linesEdited
smell_complex_class = smell_complex_class$smell_complex_class

corr_complex_class= cor.test(churn,smell_complex_class,method = "spearman", exact = FALSE)


#PLOT GRAFICO
CHURN = (churn)/1000
plot(CHURN, smell_complex_class, pch = 23, ylim = c(0,800), xlim = c(0,800),  col = "black", main="TD(Complex Class) x KLOC")
abline(lm(smell_complex_class ~ CHURN), col = "red")