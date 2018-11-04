
#Import the dataset
dataset <- read.csv("questao17_sub.csv")


library(caTools)
set.seed(123)


#Elaboração do modelo linear
regressor <- lm(formula = Tempo ~ Capacitancia, data = dataset)



#Plotting do gráfico


library(ggplot2)

ggplot() + 
  geom_point(aes(x = dataset$Capacitancia, y = dataset$Tempo),
             colour = 'red') + 
  geom_line(aes(x = dataset$Capacitancia, y = predict(regressor, newdata = dataset)),
            colour = 'blue') +
  ggtitle('Tempo de subida vs Capacitância de carga') +
  xlab('Capacitância (fF)') +
  ylab('Tempo de subida(ps)')

