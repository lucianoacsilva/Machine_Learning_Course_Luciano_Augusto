#Colocar o diretório certo
setwd("/Users/lucianosilva/Documents/Machine Learning/Simple_Linear_Regression/")

#Import the dataset
dataset <- read.csv("Salary_Data.csv")

#Set the random seed, make the split table with the desired ratio and 
#make the test and training set

library(caTools)
set.seed(123)
split <- sample.split(dataset$Salary, SplitRatio = 2/3)
training_set <- subset(dataset, split == TRUE)
test_set <- subset(dataset, split == FALSE)

#Feature Scaling
#training_set[, 2:3] <- scale(training_set[, 2:3])
#test_set[, 2:3] <- scale(test_set[, 2:3])

#Fitting Simple Linear Regression to the Training Set
regressor <- lm(formula = Salary ~ YearsExperience, data = training_set)

#Predicting the data

y_pred <- predict(regressor, newdata = test_set)
y_pred

#Plotting


library(ggplot2)

#With the training set

ggplot() + 
  geom_point(aes(x = training_set$YearsExperience, y = training_set$Salary),
             colour = 'red') + 
  geom_line(aes(x = training_set$YearsExperience, y = predict(regressor, newdata = training_set)),
            colour = 'blue') +
  ggtitle('Salary vs Experience(Training Set)') +
  xlab('Years of Experience') +
  ylab('Salary')

#With the test set

ggplot() + 
  geom_point(aes(x = test_set$YearsExperience, y = test_set$Salary),
             colour = 'red') + 
  geom_line(aes(x = training_set$YearsExperience, y = predict(regressor, newdata = training_set)),
            colour = 'blue') +
  ggtitle('Salary vs Experience(Training Set)') +
  xlab('Years of Experience') +
  ylab('Salary')

