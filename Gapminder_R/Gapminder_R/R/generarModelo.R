
#' Title
#'
#' @param listaDatos 
#' @param config 
#' @import caTools
#' @import randomForest
#' @import Metrics
#' @return
#' @export
#'
#' @examples
generarModelo <- function(listaDatos, config){
  
  set.seed(6)    # make the results reproducible
  
  X <- listaDatos$features
  y <- listaDatos$target
  
  library(caTools)
  inx <- sample.split(seq_len(nrow(X)), 0.7)
  trainX <- X[inx, ]
  testX <-  X[!inx,]
  
  trainy <- y[inx, ]
  testy <-  y[!inx,]
  
  testX <- rbind(testX[1, ] , testX)
  testX <- testX[-1,]
  
  
  library(randomForest)
  
  modelRF <- randomForest(x = trainX, y=trainy, ntree=500,)
  
  X_pred <- listaDatos$input
  
  predictions <- predict(modelRF, X_pred)
  
  library(Metrics)
  
  print(paste0('MAE: ' , mae(testy,predictions) ))
  

  eval(parse(text = paste0('output <- data.frame(country = config$country, year = config$year,',
                                                config$target, '= predictions)')))
 
  return(list(prediccion = output, modelo = modelRF))
  
}
