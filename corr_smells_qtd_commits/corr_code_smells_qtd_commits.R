
data_commit = dbGetQuery(new_bd,"SELECT BASE_ULTIMATE.projectID, BASE_ULTIMATE.author, BASE_ULTIMATE.linesEdited, BASE_ULTIMATE.code_smells, QTD_COMMITS.n_commits
FROM BASE_ULTIMATE INNER JOIN QTD_COMMITS ON BASE_ULTIMATE.author = QTD_COMMITS.author GROUP BY BASE_ULTIMATE.author")


qtd_smel = data_commit$code_smells

print(qtd_smel)
