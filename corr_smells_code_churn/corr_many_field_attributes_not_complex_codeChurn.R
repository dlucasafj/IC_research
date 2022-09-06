#Correlação entre o tipo de smell many field attributes not complex com o codeChurn

smell_many_field_attributes_not_complex = dbGetQuery(new_bd,"SELECT * FROM BASE_ULTIMATE WHERE BASE_ULTIMATE.smell_many_field_attributes_not_complex NOT NULL")

churn = smell_many_field_attributes_not_complex$linesEdited
smell_many_field_attributes_not_complex = smell_many_field_attributes_not_complex$smell_many_field_attributes_not_complex

corr_many_field_attributes_not_complex = cor.test(churn,smell_many_field_attributes_not_complex, method = "spearman", exact = FALSE)


#PLOT GRAFICO
CHURN = (churn)/1000
plot(CHURN, smell_many_field_attributes_not_complex, pch = 23, ylim = c(0,800), xlim = c(0,800),  col = "black", main="TD(Many field attributes not complex ) x KLOC")
abline(lm(smell_many_field_attributes_not_complex ~ CHURN), col = "red")