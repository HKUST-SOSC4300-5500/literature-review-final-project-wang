# The methods we used in testing other models are similar！
# 1. random forest

library(randomForest)
origin<- newdata2
# score<-data%>%select(cogscore)%>%group_by(cogscore)%>%summarise(counts=n())
# score$cogscore=as.character(score$cogscore)
# ggplot(data=score,mapping=aes(x=cogscore,y=counts))+geom_bar(stat="identity", width=0.5, show.legend=T) +labs(y="Number of students",x="Performance",titles="Scores")+scale_x_discrete(labels=c("Below average","Above average"))+theme_classic()+geom_text(aes(label = counts), vjust = -0.2)

test<- testset
train<- trainset

set.seed(79)
forest <- randomForest(cogscore~., train,ntree=500)
print(forest)
summary(forest)

floor(sqrt(ncol(train) - 1))

mtry <- tuneRF(train[-1],train$cogscore, ntreeTry=500,
               stepFactor=1.5,improve=0.01, trace=TRUE, plot=TRUE)
best.m <- mtry[mtry[, 2] == min(mtry[, 2]), 1]
print(mtry)
print(best.m)
prop.table(table(newdata2$w2b18[newdata2$cogscore==1]))

set.seed(79)
forest <-randomForest(cogscore~.,data=train, mtry=best.m, importance=TRUE,ntree=500)
print(forest)
#Evaluate variable importance
importance(forest)
varImpPlot(forest)

test1<-test%>%select(-cogscore)

predict_probability = predict(forest, newdata = test1)

predict_Y = ifelse(predict_probability>0.5,1,0)
print (table(predict_Y))

test2<-test%>%select(cogscore)%>%group_by(cogscore)%>%summarise(counts=n())

output= data.frame(true=test$cogscore, predict = predict_Y)

pred1=predict(rf,type = "prob")
library(ROCR)
perf = prediction(pred1[,2], mydata$Creditability)
# 1. Area under curve
auc = performance(perf, "auc")
auc
# 2. True Positive and Negative Rate
pred3 = performance(perf, "tpr","fpr")
# 3. Plot the ROC curve
plot(pred3,main="ROC Curve for Random Forest",col=2,lwd=2)
abline(a=0,b=1,lwd=2,lty=2,col="gray")

precision <- function(ypred, y){
  tab <- table(ypred, y)
  return((tab[2,2])/(tab[2,1]+tab[2,2]))
}
recall <- function(ypred, y){
  tab <- table(ypred, y)
  return(tab[2,2]/(tab[1,2]+tab[2,2]))
}
F1 <- function(ypred, y){
  prec <- precision (ypred, y)
  rec <- recall (ypred, y)
  return ( ( 2 * prec * rec) / (prec + rec))
}
precision(predict_Y,test$cogscore)

recall(predict_Y,test$cogscore)

F1(predict_Y,test$cogscore)


# 2. SVM

library(rpart)
library(e1071)

origin<- newdata2
# score<-data%>%select(cogscore)%>%group_by(cogscore)%>%summarise(counts=n())
# score$cogscore=as.character(score$cogscore)
# ggplot(data=score,mapping=aes(x=cogscore,y=counts))+geom_bar(stat="identity", width=0.5, show.legend=T) +labs(y="Number of students",x="Performance",titles="Scores")+scale_x_discrete(labels=c("Below average","Above average"))+theme_classic()+geom_text(aes(label = counts), vjust = -0.2)

test<- testset
train<- trainset

svm_model <- svm(cogscore~., train)

summary(svm_model)

test1<-test%>%select(-cogscore)

predict_probability = predict(svm_model, newdata = test1)

predict_Y = ifelse(predict_probability>0.5,1,0)
print (table(predict_Y))

test2<-test%>%select(cogscore)%>%group_by(cogscore)%>%summarise(counts=n())

output= data.frame(true=test$cogscore, predict = predict_Y)
precision <- function(ypred, y){
  tab <- table(ypred, y)
  return((tab[2,2])/(tab[2,1]+tab[2,2]))
}
recall <- function(ypred, y){
  tab <- table(ypred, y)
  return(tab[2,2]/(tab[1,2]+tab[2,2]))
}
F1 <- function(ypred, y){
  prec <- precision (ypred, y)
  rec <- recall (ypred, y)
  return ( ( 2 * prec * rec) / (prec + rec))
}
precision(predict_Y,test$cogscore)

recall(predict_Y,test$cogscore)

F1(predict_Y,test$cogscore)

# 3. XG boost
require(xgboost)
model <-xgboost(cogscore~.,data=train,nrounds = 2, objective = "binary:logistic")
print(model)
#Evaluate variable importance
importance(model)
varImpPlot(model)

pred1=predict(rf,type = "prob")

precision <- function(ypred, y){
  tab <- table(ypred, y)
  return((tab[2,2])/(tab[2,1]+tab[2,2]))
}
recall <- function(ypred, y){
  tab <- table(ypred, y)
  return(tab[2,2]/(tab[1,2]+tab[2,2]))
}
F1 <- function(ypred, y){
  prec <- precision (ypred, y)
  rec <- recall (ypred, y)
  return ( ( 2 * prec * rec) / (prec + rec))
}
precision(predict_Y,test$cogscore)

recall(predict_Y,test$cogscore)

F1(predict_Y,test$cogscore)
