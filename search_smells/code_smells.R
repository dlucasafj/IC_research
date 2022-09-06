# Obtem todos os code smells da Ferramenta Pitdej de cada dev


# Soma quantos smells cada desenvolvedor inseriu. 

commit_mudanca= dbGetQuery(dataBase,"SELECT  DISTINCT (GIT_COMMITS_CHANGES.commitHash) as commit_hash_changes, GIT_COMMITS.projectID,GIT_COMMITS.author,GIT_COMMITS.commitHash FROM
                          GIT_COMMITS JOIN GIT_COMMITS_CHANGES on GIT_COMMITS.commitHash=GIT_COMMITS_CHANGES.commitHash")
change = data.frame(projectID=commit_mudanca$projectID,author=commit_mudanca$author,commit_hash=commit_mudanca$commitHash,commit_hash_changes=commit_mudanca$commit_hash_changes)
dbWriteTable(dataBase,"COMMIT_MUDANCAS_2",change)

for(i in project_list){
  projectID = i
  
  code_smells = dbGetQuery(dataBase,"SELECT COMMIT_MUDANCAS_2.projectID as [projectID],COMMIT_MUDANCAS_2.author as [author],count(SONAR_ISSUES.creationCommitHash) as code_smells FROM COMMIT_MUDANCAS_2 
JOIN SONAR_ISSUES on COMMIT_MUDANCAS_2.commit_hash_changes=SONAR_ISSUES.creationCommitHash WHERE COMMIT_MUDANCAS_2.projectID=? AND SONAR_ISSUES.squid LIKE 'code_smells:%'
GROUP BY COMMIT_MUDANCAS_2.author", params=c(projectID))
    dbExecute(new_bd,"UPDATE BASE_ULTIMATE set code_smells=:code_smells WHERE author =:author AND projectID=:projectID",
            params= data.frame(code_smells=code_smells$code_smells,author=code_smells$author, projectID=code_smells$projectID))
}







# 
# 
# code_smells = dbGetQuery(dataBase," SELECT COUNT (SONAR_ISSUES.creationCommitHash) AS code_smells,
#                              GIT_COMMITS.author AS [author],
#                              GIT_COMMITS.projectID AS [projectID]
#                              FROM GIT_COMMITS
#                              INNER JOIN SONAR_ISSUES ON GIT_COMMITS.commitHash=SONAR_ISSUES.creationCommitHash
#                              WHERE GIT_COMMITS.projectID= ? AND GIT_COMMITS.merge='False' AND SONAR_ISSUES.squid LIKE 'code_smells:%' GROUP BY GIT_COMMITS.author
#                            
#                            ", params=c(projectID))
# 
# "SELECT COUNT (SONAR_ISSUES.creationCommitHash) AS code_smells,
#                              GIT_COMMITS.author AS [author],
#                              GIT_COMMITS.projectID AS [projectID],
#                              FROM GIT_COMMITS
#                              INNER JOIN SONAR_ISSUES ON GIT_COMMITS.commitHash=SONAR_ISSUES.creationCommitHash
# 							inner join GIT_COMMITS_CHANGES ON GIT_COMMITS_CHANGES.commitHash=SONAR_ISSUES.creationCommitHash
# 							WHERE   GIT_COMMITS.projectID= 'beam' AND GIT_COMMITS.merge='False' AND SONAR_ISSUES.squid LIKE 'code_smells:%'
# 							 GROUP BY GIT_COMMITS.author
# "
# 
# " SELECT COUNT (SONAR_ISSUES.creationCommitHash) AS code_smells,
#                              GIT_COMMITS.author AS [author],
#                              GIT_COMMITS.projectID AS [projectID]
#                              FROM GIT_COMMITS
#                              INNER JOIN SONAR_ISSUES ON GIT_COMMITS.commitHash=SONAR_ISSUES.creationCommitHash
#                              WHERE GIT_COMMITS.projectID= ? AND GIT_COMMITS.merge='False' AND SONAR_ISSUES.squid LIKE 'code_smells:%' GROUP BY GIT_COMMITS.author
#                            
#                            "