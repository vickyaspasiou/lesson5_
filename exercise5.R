##Author: Vasiliki Aspasiou
##Data: 29/11/2013

rm(list = ls())
setwd("/Users/Vicky/Desktop/R")
library(rasta)
data(taravao)
data(taravao2)


averaging<- function(x,y){
  out<-mean(cbind(x,y),na.rm = TRUE) 
  return(out)
}

Vaveraging<- function(x,y){
  out <- mapply(FUN=averaging,x,y)
  return(out)
}

cloud<-calc(x=taravao[[9]], fun=QA2cloud)
cloud[cloud==0]<- NA
cloud2<-calc(x=taravao2[[9]], fun=QA2cloud)
cloud2[cloud2==0]<- NA

taravao8_1<-dropLayer(x=taravao, i=9)
taravao8_2<-dropLayer(x=taravao2, i=9)
taravao8_1[cloud==1] <- NA
taravao8_2[cloud2==1]<-NA

out<-overlay(x=taravao8_1,y=taravao8_2, fun=Vaveraging)
plotRGB(out,7,2,6, stretch="lin")





