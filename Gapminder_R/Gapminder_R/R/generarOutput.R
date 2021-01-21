
#' Title
#'
#' @param output 
#' @param config 
#' @param path 
#' @import logging
#' @return
#' @export
#'
#' @examples
generarOutput <- function(output, config, path){

  marcaTmp <- Sys.time()
  
  nombreArchivo <- paste0(path, "output/MissingImputer.csv")
  
  tryCatch(expr = {
    
    write.csv(output$prediccion, file = nombreArchivo, row.names = FALSE)
    
  }, error = function(e){
    
    logerror("Ha fallado el guardado!!", logger = 'log')
    stop()
  })
  
  
  nombreArchivo <- paste0(path, "output/modelo.rds")
  
  tryCatch(expr = {
    
    saveRDS(output$modelo, file = nombreArchivo)
    
  }, error = function(e){
    
    logerror("Ha fallado el guardado del modelo!!", logger = 'log')
    stop()
  })
  
  
}