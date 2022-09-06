# Monta a tabela de autores - linhas Editadas - ProjectID


library(DBI)
library(RSQLite)
library(dbplyr)
library(dplyr)

#conecta ao BD
dataBase = dbConnect(SQLite(), "TechnicalDebtDataset_20200606.db") 
new_bd = dbConnect(SQLite(), "NEW_DATA.db")

#pega lista de projetos analisados

project_list = dbGetQuery(dataBase, "SELECT projectID FROM PROJECTS ")
project_list = project_list[["projectID"]]

for(i in project_list ){
  projectID=i
  
  devs_data = dbGetQuery(dataBase, 
                         "SELECT COMMIT_MUDANCAS_2.author,SUM(GIT_COMMITS_CHANGES.linesAdded) AS [linesAdded],
           SUM(GIT_COMMITS_CHANGES.linesRemoved) AS [linesRemoved]
           FROM COMMIT_MUDANCAS_2
           INNER JOIN GIT_COMMITS_CHANGES ON COMMIT_MUDANCAS_2.commit_hash_changes = GIT_COMMITS_CHANGES.commitHash
           WHERE COMMIT_MUDANCAS_2.projectID = ? GROUP BY COMMIT_MUDANCAS_2.author", params=c(projectID) )
  
  devs_data$projectID = projectID
  
  #transformar char em num
  devs_data = transform(devs_data, linesAdded = as.numeric(linesAdded),
                        linesRemoved = as.numeric(linesRemoved))
  
  #soma as colunas pra chegar ao número de linhas editadas
  devs_data$linesEdited = devs_data$linesAdded + devs_data$linesRemoved
  
  TESTE= data.frame(linesEdited=devs_data$linesEdited,author=devs_data$author, projectID=devs_data$projectID)
  
  dbWriteTable(new_bd,"BASE_ULTIMATE",TESTE,append=TRUE)

}















# TESTE= data.frame(linesEdited=devs_data$linesEdited,author=devs_data$author, projectID=devs_data$projectID)



















# "SELECT  DISTINCT (GIT_COMMITS_CHANGES.commitHash) as commit_hash_changes, GIT_COMMITS.projectID,GIT_COMMITS.author,GIT_COMMITS.commitHash FROM
#                           GIT_COMMITS JOIN GIT_COMMITS_CHANGES on GIT_COMMITS.commitHash=GIT_COMMITS_CHANGES.commitHash"
# 
# 
# DATA_TESTE = dbGetQuery(dataBase,"SELECT COMMIT_MUDANCAS_2.projectID,COMMIT_MUDANCA_2.author,SUM(GIT_COMMITS_CHANGES.linesAdded) AS [linesAdded],
#            SUM(GIT_COMMITS_CHANGES.linesRemoved) AS [linesRemoved]
#            FROM COMMIT_MUDANCAS_2
#            INNER JOIN GIT_COMMITS_CHANGES ON COMMIT_MUDANCAS_2.commit_hash_changes = GIT_COMMITS_CHANGES.commitHash
#            WHERE COMMIT_MUDANCAS_2.projectID = ? GROUP BY COMMIT_MUDANCAS_2.author")
# 
# DATA_TESTE = transform(DATA_TESTE,linesAdded = as.numeric(linesAdded), linesRemoved=as.numeric(linesRemoved))
# DATA_TESTE$linesEdited = DATA_TESTE$linesAdded+DATA_TESTE$linesRemoved
# 
# dbWriteTable(new_bd,"NEW_BASE_DEVS",DATA_TESTE,append=TRUE)