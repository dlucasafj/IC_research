# Correlação de Code Smells com code_churn
# considerando os campos nulos como 0

# Considerando todos os autores com e sem smells detectados
library('ggplot2')

correlacao = dbGetQuery(new_bd,"SELECT * FROM BASE_ULTIMATE")

# tratando os campos nulos
size = length(correlacao$author)

for(i in 1:size){
  if(is.na(correlacao$code_smells[i])){
    correlacao$code_smells[i] = 0
  }
}

#TESTE DE CORRELAÇÃO

cor_smells_codeChurn_spearman=cor.test(correlacao$linesEdited,correlacao$code_smells, method = "spearman",exact=FALSE)

print(cor_smells_codeChurn_spearman)
# GRAFICO

KLOC = (correlacao$linesEdited)/1000
TD = (correlacao$code_smells)

# Creating the plot
#abline(lm(TD ~KLOC), col = "red")
plot(KLOC, TD, pch = 23, ylim = c(0,800), xlim = c(0,800),  col = "black", main="TD(Code Smells+Sonar Smells) x KLOC")

#CONSIDERANDO SOMENTE OS AUTORES QUE FORAM DETECTADOS COM SMELLS
smell_detectado = dbGetQuery(new_bd,"SELECT * FROM BASE_ULTIMATE WHERE BASE_ULTIMATE.code_smells  NOT NULL ")

cor2_smells_codeChurn_spearman=cor.test(smell_detectado$linesEdited,smell_detectado$code_smells, method = "spearman",exact=FALSE)


KLOC = (smell_detectado$linesEdited)/1000
TD = (smell_detectado$code_smells)

# Creating the plot
#abline(lm(TD ~KLOC), col = "red")
plot(KLOC, TD, pch = 23, ylim = c(0,800), xlim = c(0,800),  col = "black", main="TD(Code Smells+Sonar Smells) x KLOC")

