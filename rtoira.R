
#coluna = response vector
#arquivo= file name, "arquivo"
rtoira <- function(coluna,arquivo){
  require(tidyverse)
  require(tm)
  
  coluna <- coluna[is.na(coluna)==F] 
  coluna <-     removeNumbers(coluna)
  coluna <- removePunctuation(coluna)
  coluna  <- gsub("\\\n",". ",coluna) 
  coluna <-   gsub("\\n",". ",coluna)
  coluna  <- gsub("\\\r",". ",coluna) 
  coluna <-   gsub("\\r",". ",coluna)

  resposta <- c()
  for (i in 1:length(coluna)){
    resposta <- rbind(resposta,paste("\n**** *resposta_",i,"\n\n",sep=""))
  }
  
  vec <- c()
  for (i in 1:length(coluna)){
    vec[i] <- paste(resposta[i],coluna[i],"\n")
  }
  
  write.table(paste(vec,collapse =""),file = paste(arquivo,".txt"))
  
}



