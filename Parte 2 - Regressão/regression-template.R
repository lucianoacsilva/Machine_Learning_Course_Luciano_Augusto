#Regression Template

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

#Feature Scaling
#training_set <- scale(training_set[, 2:3])
#test_set <- scale(test_set[, 2:3])

#Fitting ? Regression to the dataset

#Create our regressors

#Preditcting a new result with ? Regression
y_pred <- predict(object = regressor, data.frame(Level = 6.5) )


#Visualising the Polynomial Regression results

ggplot() + 
  geom_point(aes(x = dataset$Level, y = dataset$Salary),
             colour = 'red') + 
  geom_line(aes(x = dataset$Level, y = predict(regressor, newdata = dataset)),
            colour = 'purple') +
  ggtitle('Salary vs Level of Experience (Regression Model)') +
  xlab('Level of Experience') +
  ylab('Salary')

#Visualising the Polynomial Regression results (smoother curve, higher resolution)

x_grid <- seq(min(dataset$Level), max(dataset$Level), 0.1)
ggplot() + 
  geom_point(aes(x = dataset$Level, y = dataset$Salary),
             colour = 'red') + 
  geom_line(aes(x = x_grid, y = predict(regressor, newdata = data.frame(Level = x_grid))),
            colour = 'purple') +
  ggtitle('Salary vs Level of Experience (Regression Model)') +
  xlab('Level of Experience') +
  ylab('Salary')

