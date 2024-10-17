library(tidyverse)
library(caret)

## load data
mtcars

## split data 70:30
set.seed(42)
n <- nrow(mtcars)
id <- sample(1:n, size=0.7*n)
train_df <- mtcars[id, ]
test_df <- mtcars[-id, ]

## train a linear regression model
set.seed(42)
knn_model <- train(mpg ~ .,
                  data = train_df,
                  method = "knn")
## score
p_test <- predict(knn_model, newdata = test_df)

## evaluate 
error <- test_df$mpg - p_test

mae <- mean(abs(error))
mse <- mean(error**2)
rmse <- sqrt(mse)
