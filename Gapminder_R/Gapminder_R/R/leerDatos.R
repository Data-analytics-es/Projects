
#' Title
#'
#' @param config 
#' @param path 
#'
#' @return
#' @export
#' @import logging
#' @examples
leerDatos <- function(config, path){
  
  pathDatos <- paste0(path, "data/", config$name)
  
  tryCatch(expr = {
    
    filenames <- c()
    
    for (i in pathDatos){
      
      filename <- strsplit(basename(i),'.csv')
      
      filenames <- c(filenames, filename)
    }
      
    list_df <- c()
    
    for (i in pathDatos){
      
      datos <- data.table::fread(i, sep = config$sep,check.names = FALSE, header = TRUE, encoding = 'UTF-8', data.table = FALSE)
      
      list_df[[length(list_df) + 1]] <- datos}
    
    names(list_df) <- filenames
    
  }, error = function(e){
    
    logerror("Datos no encontrado en su ruta. Verifica el directorio de data y el config",
             logger = 'log')
    stop()
    })
  
  return(list_df)
}