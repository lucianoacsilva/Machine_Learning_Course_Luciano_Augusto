# Data Preprocessing Template
setwd('/Users/lucianosilva/Documents/Machine Learning/Parte 4 - Clustering/K_Means/')
# Importing the dataset
dataset = read.csv('Mall_Customers.csv')
X <- dataset[4:5]

#Elbow method

set.seed(6)
wcss <- vector()


for (i in 1:10) wcss[i] <- sum(kmeans(x, i)$withinss)
plot(x = 1:10, y = wcss, type = "b", main = 'Clusters of Clients', xlab = 'Number of clusters', ylab = 'WCSS')

#Applying K-Means

set.seed(29)
kmeans <- kmeans(x = X, centers = 5, iter.max = 300, nstart = 10)

#Visualizing clusters

library(cluster)

clusplot(X, kmeans$cluster, 
         lines = 0,
         color = TRUE,
         shade = TRUE,
         plotchar = FALSE,
         span = TRUE,
         main = 'Clusters of Clientes',
         xlab = 'Anual Income',
         ylab = 'Spending Score')
# Feature Scaling
# training_set = scale(training_set)
# test_set = scale(test_set)