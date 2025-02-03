## ----setup, include = FALSE---------------------------------------------------
knitr::opts_chunk$set(
  collapse = TRUE,
  comment = "R>"
)

library(ocf)

## ----data-generation, eval = TRUE---------------------------------------------
## Generate synthetic data.
set.seed(1986)

n <- 100
data <- generate_ordered_data(n)

sample <- data$sample
Y <- sample$Y
X <- sample[, -1]

table(Y)

head(X)

## ----adaptive-ocf, eval = TRUE------------------------------------------------
## Training-test split.
train_idx <- sample(seq_len(length(Y)), floor(length(Y) * 0.5))

Y_tr <- Y[train_idx]
X_tr <- X[train_idx, ]

Y_test <- Y[-train_idx]
X_test <- X[-train_idx, ]

## Fit ocf on training sample. Use default settings.
forests <- ocf(Y_tr, X_tr)

## Summary of data and tuning parameters.
summary(forests)

## Out-of-sample predictions.
predictions <- predict(forests, X_test)

head(predictions$probabilities)

table(Y_test, predictions$classification)

## ----honest-ocf, eval = TRUE--------------------------------------------------
## Honest forests.
honest_forests <- ocf(Y_tr, X_tr, honesty = TRUE)

honest_predictions <- predict(honest_forests, X_test)
head(honest_predictions$probabilities)

## ----honest-ocf-inference, eval = TRUE----------------------------------------
## Compute standard errors. Do not run.
# honest_forests <- ocf(Y_tr, X_tr, honesty = TRUE, inference = TRUE, n.threads = 0) # Use all CPUs.
# head(honest_forests$predictions$standard.errors)

## ----adaptive-me, eval = TRUE-------------------------------------------------
## Marginal effects at the mean.
me_atmean <- marginal_effects(forests, eval = "atmean") # Try also 'eval = "atmean"' and 'eval = "mean"'.
print(me_atmean) # Try also 'latex = TRUE'.

plot(me_atmean)

## ----adaptive-me-target, eval = TRUE------------------------------------------
## Marginal effects at the mean.
target_covariates <- list("x1" = "continuous", "x2" = "discrete", "x4" = "discrete")
me_atmean <- marginal_effects(forests, eval = "atmean", these_covariates = target_covariates) 

plot(me_atmean)

## ----honest-me, eval = TRUE---------------------------------------------------
## Compute standard errors.
honest_me_atmean <- marginal_effects(honest_forests, eval = "atmean", inference = TRUE)
print(honest_me_atmean) # Try also 'latex = TRUE'.

plot(honest_me_atmean)

