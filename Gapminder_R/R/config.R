
#' Title : Leer Config
#'
#' @param path 
#' @import logging
#' @return
#' @export
#' @author Kirsten/Ernesto/Borja
#' @examples
#' 
leerConfig <- function(path){
  

  
  
  configPath <- paste0(path, "config/config.xml")
  
  
  tryCatch(expr = {
    
    #Leer el xml y convertirlo a lista
    config <- XML::xmlToList(xmlParse(configPath))
    
    
  }, error = function(e){
    
    logerror("Config no encontrado en su ruta. Verifica que se llame config.xml",
             logger = 'log')
    stop()
  })
  
  loginfo("Config leido.", logger = 'log')
  
  validateConfigNodes(config)
  config$name <- trimws(strsplit(config$name, ",")[[1]])
  config$year <- as.integer(trimws(config$year))
  config$country <- as.character(trimws(config$country))
  config$target <- trimws(strsplit(config$target, ",")[[1]])
  config$target <- strsplit(config$target,'.csv')[[1]]
  
  if (!config$year %in% 1870:2030){
      
      logerror("Año erroneo, no pertenece a uno comprendido entre 1870 y 2030",
               logger = 'log')
      stop()
      }
  
  
  separadoresAceptados <- config$sep %in% c(",", ";")
  
  if(!separadoresAceptados){
    
    logerror("Separadores válidos son: ',' o ';' ", logger = 'log')
    stop()
    
  }
  
  return(config)
  
} 


#' Title
#'
#' @param config 
#' @import logging
#' @return
#' @export
#'
#' @examples
validateConfigNodes <- function(config){
  
  nodoPrincipal <- identical(names(config), c("name", "sep", 'country', 'year', 'target'))
  
  nodos <- nodoPrincipal
  
  check <- nodos
  
  if(!check){
    
    nodosMalos <- names(nodos)[!nodos]
    
    logerror(paste0("Los nodos: ", paste(nodosMalos, collapse = ", "),
                    " estan mal estructurados!"), logger = 'log')
    stop()
    
  }
  
}
