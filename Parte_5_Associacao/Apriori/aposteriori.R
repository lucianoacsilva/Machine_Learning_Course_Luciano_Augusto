#Apriori

#Pre-processamento

dataset <- read.csv("Market_Basket_Optimisation.csv", header = FALSE)

#Bibliotecas

install.packages('arules')
library('arules')

#Matriz esparsa

sparse_matrix <- read.transactions(file = 'Market_Basket_Optimisation.csv', sep = ',',rm.duplicates = TRUE)
summary(sparse_matrix)
itemFrequencyPlot(sparse_matrix, topN = 10)

#Training Apriori on the dataset

rules <- apriori(data = sparse_matrix, parameter = list(support = 0.0037, confidence = 0.2))

#Visualiza????o

inspect(sort(rules, by = 'lift')[1:10])

 
