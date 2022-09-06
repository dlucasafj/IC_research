#Calcula a quantidade de commits feito pelo dev



for (i in project_list){
  projectID = i
  
  devs_data = dbGetQuery(dataBase, "SELECT COUNT(DISTINCT COMMIT_MUDANCAS_2.commit_hash) AS n_commits, 
                                  author AS [author], projectID as [projectID]
                                  FROM COMMIT_MUDANCAS_2 
                                  WHERE projectID = ? 
                                  GROUP BY author"
                         , params = c(projectID))
  
  #Adiciona todos os commits de todos os desenvolvedores
  dbWriteTable(new_bd, "QTD_COMMITS", devs_data, append=TRUE)
  
}