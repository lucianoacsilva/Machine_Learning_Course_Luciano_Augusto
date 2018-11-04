#Colocar o diretório certo
setwd("/Users/lucianosilva/Documents/Machine Learning/Polynomial_Regression/")

#Import the dataset
dataset <- read.csv("Position_Salaries.csv")

#Only the numeric columns

dataset <- dataset[2:3]

#Set the random seed, make the split table with the desired ratio and 
#make the test and training set

#Not necessary, because it has many variables (exponents)
#library(caTools)
# set.seed(123)
# split <- sample.split(dataset$Salary, SplitRatio = 2/3)
# training_set <- subset(dataset, split == TRUE)
# test_set <- subset(dataset, split == FALSE)

#Fitting Linear Regression to the dataset
lin_reg <- lm(formula = Salary ~ ., data = dataset)

#Fitting Polynomial Regression to the dataset
#Adding the levels of exponentiation

dataset$Level2 <- dataset$Level^2
dataset$Level3 <- dataset$Level^3
dataset$Level4 <- dataset$Level^4

#The polynomial regression
poly_reg <- lm(formula = Salary ~ ., data = dataset)

#Visualising the Linear Regression results
library(ggplot2)

ggplot() + 
  geom_point(aes(x = dataset$Level, y = dataset$Salary),
             colour = 'red') + 
  geom_line(aes(x = dataset$Level, y = predict(lin_reg, newdata = dataset)),
            colour = 'blue') +
  ggtitle('Salary vs Level of Experience (Simple Linear Regression)') +
  xlab('Level of Experience') +
  ylab('Salary')


#Visualising the Polynomial Regression results

ggplot() + 
  geom_point(aes(x = dataset$Level, y = dataset$Salary),
             colour = 'red') + 
  geom_line(aes(x = dataset$Level, y = predict(poly_reg, newdata = dataset)),
            colour = 'purple') +
  ggtitle('Salary vs Level of Experience (Polynomial Linear Regression)') +
  xlab('Level of Experience') +
  ylab('Salary')

#Predict a new result with Simple Linear Regression
y_pred <- predict(object = lin_reg, data.frame(Level = 6.5) )

#Preditcting a new result with Polynomial Linear Regression
y_pred <- predict(object = poly_reg, data.frame(Level = 6.5,
                                                Level2 = 6.5^2,
                                                Level3 = 6.5^3,
                                                Level4 = 6.5^4) )

