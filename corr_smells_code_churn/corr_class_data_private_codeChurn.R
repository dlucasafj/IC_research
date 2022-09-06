#Correlação entre o tipo de smell Class Data Private com o codeChurn

smell_class_data_private = dbGetQuery(new_bd,"SELECT * FROM BASE_ULTIMATE WHERE BASE_ULTIMATE.smell_class_data_private NOT NULL")

churn = smell_class_data_private$linesEdited
smell_class_data_private = smell_class_data_private$smell_class_data_private

corr_class_data_private = cor.test(churn,smell_class_data_private, method = "spearman", exact = FALSE)


#PLOT GRAFICO
CHURN = (churn)/1000
plot(CHURN, smell_class_data_private, pch = 23, ylim = c(0,800), xlim = c(0,800),  col = "black", main="TD(Baseclass Abstract) x KLOC")
abline(lm(smell_class_data_private ~ CHURN), col = "red")