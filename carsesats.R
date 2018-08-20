install.packages("rpart")
install.packages("rpart.plot")
library(rpart)
library(rpart.plot)
install.packages("ISLR")
library(ISLR)

#decision trees of 2 types- classification and regression
# classification- classify into categories like buy and not buy
# numerical value- regression tree
#CART algorithm uses genie index and entropy and reduction in variance to split the variables. it does only binary splitting
#CHAID algorithm can do multi way split using chi squared statistics. ind and dep variables are categories
#CART uses rpart
#CTREE uses p value (<0.05 is significant)

# Decision Trees : regression trees

library(ISLR)
data(Carseats)
head(Carseats)
names(Carseats)
?Carseats
data = Carseats

#Libraries for Decision Tree
library(rpart)
library(rpart.plot)

#Model
decisiontree = rpart(Sales ~ . , data=data, method='anova' )
decisiontree
rpart.plot(decisiontree)

#this is large tree, so prune it: check cp
printcp(decisiontree)
prunetree = prune(decisiontree, cp=0.0131)
prunetree
rpart.plot(prunetree)

#improve the plot
rpart.plot(prunetree, nn=T, cex=.8, type=4)

predict(prunetree, nn=T , cex=0.8, type=4)

#https://www.datacamp.com/community/tutorials/decision-trees-R