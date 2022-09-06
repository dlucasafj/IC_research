#######################

#Calcula  r o tempo de exp dos desenvolvedores de um projeto

#######################
  
  library(DBI)
  library(RSQLite)
  library(dbplyr)
  library(dplyr)
  library(lubridate)
  #conecta ao BD

  dataBase = dbConnect(SQLite(), "TechnicalDebtDataset_20200606.db") 
  new_bd = dbConnect(SQLite(), "NEW_DATA.db")
  # devs_td = dbGetQuery(dbcon, "SELECT * FROM DEVS_TD ")
  # #salva no banco
  # 
  # dbWriteTable(dbcon2, "DEVS_TD", devs_td, append=TRUE)
  #pega lista de projetos analisados
  
  project_list = dbGetQuery(dataBase, "SELECT projectID FROM PROJECTS ")
  project_list = project_list[["projectID"]]
  
  
  start_time <- Sys.time()

  for(projectID in project_list){
    
    # projectID = project_list[i]
    print(projectID) # printa nome dos projetos


    
    # Busca a tabela na posição i
    temp_devs_data = dbGetQuery(dataBase, "SELECT author, MAX(authorDate), MIN(authorDate)
                                      FROM GIT_COMMITS
                                      WHERE projectID = ? AND merge='False' GROUP BY author"
                           , params = c(projectID))
    
    
    #renomeia as colunas
    colnames(temp_devs_data) <- c('author','last_commit', 'first_commit')

         # cria as datas 1
        first_dat = ymd_hms(temp_devs_data$first_commit)
        last_dat = ymd_hms(temp_devs_data$last_commit)
        
        
        temp_devs_data$xp_in_hours = difftime(last_dat, first_dat, units = "hours")
        temp_devs_data$xp_in_days = difftime(last_dat, first_dat, units = "days")
        temp_devs_data$xp_in_weeks = difftime(last_dat, first_dat, units = "weeks")
        devs_xp = temp_devs_data %>% select(author, xp_in_days, xp_in_weeks)
        

        
        dbWriteTable(new_bd, "EXPERIENCIA_DEV", devs_xp, append=TRUE)
      
}
  

  end_time <- Sys.time()
  
  print(end_time - start_time)

# dbDisconnect(database)
# RM(database)
# 
#   
#   dbExecute(dbcon, "UPDATE DEVS_TD
#                         SET xp_in_days =:xp_in_days, xp_in_weeks =:xp_in_weeks
#                         WHERE author = :author AND projectID =:projectID ",
#             params=data.frame(xp_in_days=devs_xp$xp_in_days,
#                               xp_in_weeks=devs_xp$xp_in_weeks,
#                               author=devs_xp$author, projectID=projectID))
#   

