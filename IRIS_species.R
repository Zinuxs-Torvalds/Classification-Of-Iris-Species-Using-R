library(e1071) #Load library e1071
library(klaR) #Load library klaR

data(iris) #Load the in-built iris dataset.
summary(iris) #View a summary of the data.
iris #Print out the entire dataset to the screen. 

classifier=naiveBayes(iris[,1:4], iris[,5]) #Build a naive Bayes classifier with the 5th attribute "Species" as the class label.

classifier$apriori #Obtain the class distribution in the data: the prior distribution of the classes.

classifier$tables$Petal.Length #Obtain the mean (first column) and standard deviation (second column) for the 3 class-dependent Gaussian distributions
#Since the predictor variables here are all continous, the naive Bayes classifier generates three Gaussian (Normal) distributions for each predictor variable: one for each value of the class variable Species.

plot(function(x) dnorm(x, 1.462, 0.1736640), 0, 8, col="red", main="Petal length distribution for the 3 different species") 

#plot these 3 distributions against each other.
#Note that setosa irises (the red curve) tend to have smaller petals (mean value = 1.462)
#and there is less variation in petal length (standard deviation is only 0.1736640).
curve(dnorm(x, 4.260, 0.4699110), add=TRUE, col="blue")

curve(dnorm(x, 5.552, 0.5518947 ), add=TRUE, col = "green")

table(predict(classifier, iris[,-5]), iris[,5], dnn=list('predicted','actual')) #Make predictions on the training data
#As you should see the classifier does a pretty good job of classifying.