
#' Title
#'
#' @param datos 
#' @param config 
#' @import logging
#' @import reshape2
#' @return
#' @export
#'
#' @examples
preProcesarDatos <- function(datos, config){
  
  library(reshape2)
  
  melt_df <- c()
  
  count <- 1
  
  for (i in datos){
    
    columna <- names(datos)[count]
    
    datos_melt = melt(i, id.vars='country', variable.name = 'Year',value.name = columna, factorsAsStrings = FALSE)
    
    melt_df[[length(melt_df) + 1]] <- datos_melt
    
    count <- count +1
    }
  
  merge_df <- Reduce(function(d1, d2) merge(d1, d2, by = c('country','Year'), all.x = TRUE),  melt_df)
  
   X_pred <- with(merge_df, merge_df[ (merge_df$country == config$country & merge_df$Year == config$year), ])
   
   droppred <- toString(config$target)

  if (is.na(X_pred[droppred]) == FALSE){
     logerror("Error - Para el año y país seleccionado la variable a imputar contiene información. Por favor, verifica los datos introducidos en el config.",
              logger = 'log')
     stop()
   }
   
  X_pred[droppred] <- NULL
  
  if (sum(is.na(X_pred)) > 0){
    logerror("Error - Para el año y país seleccionado hay variables nulas. Por favor, verifique, que todos los datos esten completos.",
             logger = 'log')
    stop()
  }
  
  
  
  df <- na.omit(merge_df)
  
  target <- toString(config$target)
 
  y <- df[target]
  
  drops <- c('country','Year',target)
  
  X <- df
  
  X <- df[ , !(names(df) %in% drops)]
   
  #X <- subset(df, select = -c())
  
  listaDatos <- list(features = X,target = y, input = X_pred)
  
  return(listaDatos)
  
}
