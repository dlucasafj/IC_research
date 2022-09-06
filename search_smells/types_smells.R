#Criação da tabela geral com todos os tipos de smells
#Alimenta a tablea NEW_DEVS_TD2  com os dados dos tipos de smells


#Antisingleton
antisingleton = dbGetQuery(new_bd,"SELECT * from Antisingleton")
antisingleton_size = length(antisingleton$author)

for(i in 1:antisingleton_size){
  print(antisingleton$author)
  dbExecute(new_bd,"UPDATE BASE_ULTIMATE set smell_antisingleton=:smell_antisingleton WHERE author =:author AND projectID=:projectID",
            params= data.frame(smell_antisingleton=antisingleton$smell_antisingleton,author=antisingleton$author, projectID=antisingleton$projectID))
}


#BaseClasse Abstract
baseClasse_abstract = dbGetQuery(new_bd,"SELECT * FROM Baseclass_abstract")
baseClass_size = length(baseClasse_abstract$author)

for(i in 1:baseClass_size){
  dbExecute(new_bd,"UPDATE BASE_ULTIMATE set smell_baseclass_abstract=:smell_baseclass_abstract WHERE author =:author AND projectID=:projectID",
            params= data.frame(smell_baseclass_abstract=baseClasse_abstract$smell_baseclass_abstract, author=baseClasse_abstract$author, projectID=baseClasse_abstract$projectID))
}


#Class Data Private

class_data_private = dbGetQuery(new_bd,"SELECT * FROM  Class_data_private")

class_data_size = length(class_data_private$smell_class_data_private)

for(i in 1:class_data_size){
  dbExecute(new_bd,"UPDATE BASE_ULTIMATE set smell_class_data_private=:smell_class_data_private WHERE author =:author AND projectID=:projectID",
            params= data.frame(smell_class_data_private=class_data_private$smell_class_data_private, author=class_data_private$author, projectID=class_data_private$projectID))
}

#Complex Class

complex_class= dbGetQuery(new_bd,"SELECT * FROM Complex_class")
complex_class_size = length(complex_class$author)
for(i in 1:complex_class_size){
  dbExecute(new_bd,"UPDATE BASE_ULTIMATE set smell_complex_class=:smell_complex_class WHERE author =:author AND projectID=:projectID",
            params= data.frame(smell_complex_class=complex_class$smell_complex_class, author=complex_class$author, projectID=complex_class$projectID))
}


#Large Class

large_class=dbGetQuery(new_bd,"SELECT  * FROM Large_class")
large_class_size = length(large_class$author)
for(i in 1:large_class_size){
  dbExecute(new_bd,"UPDATE BASE_ULTIMATE set smell_large_class=:smell_large_class WHERE author =:author AND projectID=:projectID",
            params= data.frame(smell_large_class=large_class$smell_large_class, author=large_class$author, projectID=large_class$projectID))
}

#Lazy Class

lazy_class = dbGetQuery(new_bd,"SELECT  * FROM Lazy_class")
lazy_class_size = length(lazy_class$author)

for(i in 1:lazy_class_size){
  dbExecute(new_bd,"UPDATE BASE_ULTIMATE set smell_lazy_class=:smell_lazy_class WHERE author =:author AND projectID=:projectID",
            params= data.frame(smell_lazy_class=lazy_class$smell_lazy_class, author=lazy_class$author, projectID=lazy_class$projectID))
}

#Long Method

long_method = dbGetQuery(new_bd,"SELECT  * FROM Long_method")
long_method_size = length(long_method$author)

for(i in 1:long_method_size){
  dbExecute(new_bd,"UPDATE BASE_ULTIMATE set smell_long_method=:smell_long_method WHERE author =:author AND projectID=:projectID",
            params= data.frame(smell_long_method=long_method$smell_long_method, author=long_method$author, projectID=long_method$projectID))
}


#Long Parameter List
long_parameter_list =  dbGetQuery(new_bd,"SELECT  NEW_DEVS_TD2.author,NEW_DEVS_TD2.projectID,Long_parameter_list.smell_long_parameter_list FROM NEW_DEVS_TD2 
                                INNER JOIN Long_parameter_list ON NEW_DEVS_TD2.author=Long_parameter_list.author AND NEW_DEVS_TD2.projectID=Long_parameter_list.projectID 
                                GROUP BY NEW_DEVS_TD2.author")
long_parameter_list =  dbGetQuery(new_bd,"SELECT  * FROM Long_parameter_list")

long_parameter_list_size=length(long_parameter_list$smell_long_parameter_list)

for(i in 1:long_parameter_list_size){
  dbExecute(new_bd,"UPDATE BASE_ULTIMATE set smell_long_parameter_list=:smell_long_parameter_list WHERE author =:author AND projectID=:projectID",
            params= data.frame(smell_long_parameter_list=long_parameter_list$smell_long_parameter_list, author=long_parameter_list$author, projectID=long_parameter_list$projectID))
}



#Many Field Attributes not complex

many_field_attributes_not_complex = dbGetQuery(new_bd,"SELECT * FROM Many_field_attributes_not_complex")

many_field_attributes_not_complex_size=length(many_field_attributes_not_complex$smell_many_field_attributes_not_complex)
for(i in 1:many_field_attributes_not_complex_size){
  dbExecute(new_bd,"UPDATE BASE_ULTIMATE set smell_many_field_attributes_not_complex=:smell_many_field_attributes_not_complex WHERE author =:author AND projectID=:projectID",
            params= data.frame(smell_many_field_attributes_not_complex=many_field_attributes_not_complex$smell_many_field_attributes_not_complex, author=many_field_attributes_not_complex$author, projectID=many_field_attributes_not_complex$projectID))
}


#Refused parent bequest
refused_parent_bequest = dbGetQuery(new_bd,"SELECT * FROM Refused_parent_bequest")
refused_parent_bequest_size = length(refused_parent_bequest$smell_refused_parent_bequest)
for(i in 1:refused_parent_bequest_size){
  dbExecute(new_bd,"UPDATE BASE_ULTIMATE set smell_refused_parent_bequest=:smell_refused_parent_bequest WHERE author =:author AND projectID=:projectID",
            params= data.frame(smell_refused_parent_bequest=refused_parent_bequest$smell_refused_parent_bequest, author=refused_parent_bequest$author, projectID=refused_parent_bequest$projectID))
}



#Spaghetti code

spaghetti_code = dbGetQuery(new_bd,"SELECT  * FROM Spaghetti_code")

spaghetti_code_size=length(spaghetti_code$smell_spaghetti_code)
for(i in 1:spaghetti_code_size){
  dbExecute(new_bd,"UPDATE BASE_ULTIMATE set smell_spaghetti_code=:smell_spaghetti_code WHERE author =:author AND projectID=:projectID",
            params= data.frame(smell_spaghetti_code=spaghetti_code$smell_spaghetti_code, author=spaghetti_code$author, projectID=spaghetti_code$projectID))
}

#Speculative Generality


speculative_generality = dbGetQuery(new_bd,"SELECT * FROM Speculative_generality")
speculative_generality_size=length(speculative_generality$smell_speculative_generality)
for(i in 1:speculative_generality_size){
  dbExecute(new_bd,"UPDATE BASE_ULTIMATE set smell_speculative_generality=:smell_speculative_generality WHERE author =:author AND projectID=:projectID",
            params= data.frame(smell_speculative_generality=speculative_generality$smell_speculative_generality, author=speculative_generality$author, projectID=speculative_generality$projectID))
}

#antisingleton = dbGetQuery(new_bd,"SELECT  NEW_DEVS_TD2.author,NEW_DEVS_TD2.projectID, Antisingleton.smell_antisingleton FROM NEW_DEVS_TD2
#           	INNER JOIN Antisingleton ON NEW_DEVS_TD2.author=Antisingleton.author AND NEW_DEVS_TD2.projectID=Antisingleton.projectID
#	             	GROUP BY NEW_DEVS_TD2.author")

#baseClasse_abstract = dbGetQuery(new_bd,"SELECT  NEW_DEVS_TD2.author,NEW_DEVS_TD2.projectID, Baseclass_abstract.smell_baseclass_abstract FROM NEW_DEVS_TD2
#                                  INNER JOIN Baseclass_abstract ON NEW_DEVS_TD2.author=Baseclass_abstract.author AND NEW_DEVS_TD2.projectID=Baseclass_abstract.projectID
#                                 GROUP BY NEW_DEVS_TD2.author")

#class_data_private = dbGetQuery(new_bd,"SELECT  NEW_DEVS_TD2.author,NEW_DEVS_TD2.projectID,Class_data_private.smell_class_data_private FROM NEW_DEVS_TD2 
#                                INNER JOIN Class_data_private ON NEW_DEVS_TD2.author=Class_data_private.author AND NEW_DEVS_TD2.projectID=Class_data_private.projectID 
#                                GROUP BY NEW_DEVS_TD2.author")

#complex_class= dbGetQuery(new_bd,"SELECT  NEW_DEVS_TD2.author,NEW_DEVS_TD2.projectID,Complex_class.smell_complex_class FROM NEW_DEVS_TD2 
#                                INNER JOIN Complex_class ON NEW_DEVS_TD2.author=Complex_class.author AND NEW_DEVS_TD2.projectID=Complex_class.projectID 
#                                GROUP BY NEW_DEVS_TD2.author")


#large_class=dbGetQuery(new_bd,"SELECT  NEW_DEVS_TD2.author,NEW_DEVS_TD2.projectID,Large_class.smell_large_class FROM NEW_DEVS_TD2 
#                                INNER JOIN Large_class ON NEW_DEVS_TD2.author=Large_class.author AND NEW_DEVS_TD2.projectID=Large_class.projectID 
#                                GROUP BY NEW_DEVS_TD2.author")

#lazy_class = dbGetQuery(new_bd,"SELECT  NEW_DEVS_TD2.author,NEW_DEVS_TD2.projectID,Lazy_class.smell_lazy_class FROM NEW_DEVS_TD2 
#                                INNER JOIN Lazy_class ON NEW_DEVS_TD2.author=Lazy_class.author AND NEW_DEVS_TD2.projectID=Lazy_class.projectID 
#                                GROUP BY NEW_DEVS_TD2.author")

#long_method = dbGetQuery(new_bd,"SELECT  NEW_DEVS_TD2.author,NEW_DEVS_TD2.projectID,Long_method.smell_long_method FROM NEW_DEVS_TD2 
#                               INNER JOIN Long_method ON NEW_DEVS_TD2.author=Long_method.author AND NEW_DEVS_TD2.projectID=Long_method.projectID 
#                               GROUP BY NEW_DEVS_TD2.author")

#many_field_attributes_not_complex = dbGetQuery(new_bd,"SELECT  NEW_DEVS_TD2.author,NEW_DEVS_TD2.projectID,Many_field_attributes_not_complex.smell_many_field_attributes_not_complex FROM NEW_DEVS_TD2 
#                                INNER JOIN Many_field_attributes_not_complex ON NEW_DEVS_TD2.author=Many_field_attributes_not_complex.author AND NEW_DEVS_TD2.projectID=Many_field_attributes_not_complex.projectID 
#                                GROUP BY NEW_DEVS_TD2.author")

#refused_parent_bequest = dbGetQuery(new_bd,"SELECT  NEW_DEVS_TD2.author,NEW_DEVS_TD2.projectID,Refused_parent_bequest.smell_refused_parent_bequest FROM NEW_DEVS_TD2 
#                                INNER JOIN Refused_parent_bequest ON NEW_DEVS_TD2.author=Refused_parent_bequest.author AND NEW_DEVS_TD2.projectID=Refused_parent_bequest.projectID 
#                                GROUP BY NEW_DEVS_TD2.author")

#spaghetti_code = dbGetQuery(new_bd,"SELECT  NEW_DEVS_TD2.author,NEW_DEVS_TD2.projectID,Spaghetti_code.smell_spaghetti_code FROM NEW_DEVS_TD2 
#                                INNER JOIN Spaghetti_code ON NEW_DEVS_TD2.author=Spaghetti_code.author AND NEW_DEVS_TD2.projectID=Spaghetti_code.projectID 
#                                GROUP BY NEW_DEVS_TD2.author")

#speculative_generality = dbGetQuery(new_bd,"SELECT  NEW_DEVS_TD2.author,NEW_DEVS_TD2.projectID,Speculative_generality.smell_speculative_generality FROM NEW_DEVS_TD2 
#                                INNER JOIN Speculative_generality ON NEW_DEVS_TD2.author=Speculative_generality.author AND NEW_DEVS_TD2.projectID=Speculative_generality.projectID 
#                                GROUP BY NEW_DEVS_TD2.author")