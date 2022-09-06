# Cria tabela com dos tipos de smells detectados pelo Ptidej


#lista de smells
smell_list= dbGetQuery(dataBase,"SELECT DISTINCT squid as type_smells FROM SONAR_ISSUES WHERE squid LIKE 'code_smells:%'")
smell_list = smell_list[["type_smells"]]
#lista de projetos
project_list



"SELECT COMMIT_MUDANCAS_2.projectID [projectID], COMMIT_MUDANCAS_2.author [author],count(SONAR_ISSUES.squid) as smell FROM
COMMIT_MUDANCAS_2 JOIN SONAR_ISSUES ON COMMIT_MUDANCAS_2.commit_hash_changes=SONAR_ISSUES.creationCommitHash
WHERE COMMIT_MUDANCAS_2.projectID=? AND SONAR_ISSUES.squid='code_smells:long_method' GROUP BY COMMIT_MUDANCAS_2.author
"
for(i in project_list){
  projectID = i
    smells_type = dbGetQuery(dataBase,"SELECT COMMIT_MUDANCAS_2.projectID [projectID], COMMIT_MUDANCAS_2.author [author],count(SONAR_ISSUES.squid) as smell FROM
                      COMMIT_MUDANCAS_2 JOIN SONAR_ISSUES ON COMMIT_MUDANCAS_2.commit_hash_changes=SONAR_ISSUES.creationCommitHash
                      WHERE COMMIT_MUDANCAS_2.projectID=? AND SONAR_ISSUES.squid='code_smells:speculative_generality' GROUP BY COMMIT_MUDANCAS_2.author
                    ", params=c(projectID))
    
    frame_1=data.frame(projectID=smells_type$projectID,author=smells_type$author,smell_speculative_generality= smells_type$smell)
    
   
    dbWriteTable(new_bd,"Speculative_generality",frame_1,append=TRUE)
    
}