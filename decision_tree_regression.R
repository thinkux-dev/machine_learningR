## Decision Tree Regression

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

## Fitting Decision Tree Regression to the dataset
#install.packages('rpart')
library(rpart)
regressor = rpart(formula = Salary ~ .,
                  data = dataset,
                  control = rpart.control(minsplit = 1))


# Predicting a new result
y_pred = predict(regressor, data.frame(Level = 6.5))

# Visualizing the Decision Tree Reg result(For higher resolution)
# install.packages('ggplot2')
library(ggplot2)
x_grid =seq(min(dataset$Level), max(dataset$Level), 0.01)
ggplot() +
  geom_point(aes(x= dataset$Level, y= dataset$Salary),
             color = 'red') +
  geom_line(aes(x= x_grid, y= predict(regressor, newdata = data.frame(Level = x_grid))),
            color = 'blue') + 
  ggtitle('Truth or Bluff (Decision Tree Reg)') +
  xlab('Level') + 
  ylab('Salary')