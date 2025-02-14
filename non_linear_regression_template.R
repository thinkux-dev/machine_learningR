# Regression Template

# Importing the dataset
dataset = read.csv('Position_Salaries.csv')
dataset = dataset[2:3]

# ## Encode Categorical variables
# # Encoding categorical data
# dataset$State = factor(dataset$State,
#                        levels = c('New York', 'California', 'Florida'),
#                        labels = c(1, 2, 3))

# # Splitting the dataset into the Training set and Test set
# # install.packages('caTools')
# library(caTools)
# set.seed(123)
# split = sample.split(dataset$Profit, SplitRatio = 0.8)
# training_set = subset(dataset, split == TRUE)
# test_set = subset(dataset, split == FALSE)

## Feature Scaling
# training_set = scale(training_set)
# test_set = scale(test_set)

## Fitting Regression Model to the dataset
# Create your regressor here

# Predicting a new result
y_pred = predict(regressor, data.frame(Level = 6.5))

# Visualizing the Regression Model result
# install.packages('ggplot2')
#library(ggplot2)
ggplot() +
  geom_point(aes(x= dataset$Level, y= dataset$Salary),
             color = 'red') +
  geom_line(aes(x= dataset$Level, y= predict(regressor, newdata = dataset)),
            color = 'blue') + 
  ggtitle('Truth or Bluff (Regression Model)') +
  xlab('Level') + 
  ylab('Salary')


# Visualizing the Regression Model result(For higher resolution and smoother curve)
# install.packages('ggplot2')
#library(ggplot2)
x_grid =seq(min(dataset$Level), max(dataset$Level), 0.1)
ggplot() +
  geom_point(aes(x= dataset$Level, y= dataset$Salary),
             color = 'red') +
  geom_line(aes(x= x_grid, y= predict(regressor, newdata = data.frame(Level = x_grid))),
            color = 'blue') + 
  ggtitle('Truth or Bluff (Regression Model)') +
  xlab('Level') + 
  ylab('Salary')