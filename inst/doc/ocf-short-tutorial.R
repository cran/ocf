## ----setup, include = FALSE, eval = FALSE-------------------------------------
#  knitr::opts_chunk$set(
#    collapse = TRUE,
#    comment = "#>"
#  )
#  
#  library(ocf)

## ----data-generation, eval = FALSE--------------------------------------------
#  ## Load data from orf package.
#  set.seed(1986)
#  
#  library(orf)
#  data(odata)
#  
#  y <- as.numeric(odata[, 1])
#  X <- as.matrix(odata[, -1])

## ----adaptive-ocf, eval = FALSE-----------------------------------------------
#  ## Training-test split.
#  train_idx <- sample(seq_len(length(y)), floor(length(y) * 0.5))
#  
#  y_tr <- y[train_idx]
#  X_tr <- X[train_idx, ]
#  
#  y_test <- y[-train_idx]
#  X_test <- X[-train_idx, ]
#  
#  ## Fit ocf on training sample. Use default settings.
#  forests <- ocf(y_tr, X_tr)
#  
#  ## Summary of data and tuning parameters.
#  summary(forests)
#  
#  ## Out-of-sample predictions.
#  predictions <- predict(forests, X_test)
#  
#  head(predictions$probabilities)
#  table(y_test, predictions$classification)

## ----honest-ocf, eval = FALSE-------------------------------------------------
#  ## Honest forests.
#  honest_forests <- ocf(y_tr, X_tr, honesty = TRUE)
#  honest_predictions <- predict(honest_forests, X_test)
#  
#  ## Compare predictions with adaptive fit.
#  cbind(head(predictions$probabilities), head(honest_predictions$probabilities))

## ----honest-ocf-inference, eval = FALSE---------------------------------------
#  ## Compute standard errors.
#  honest_forests <- ocf(y_tr, X_tr, honesty = TRUE, inference = TRUE, n.threads = 0) # Use all CPUs.
#  head(honest_forests$predictions$standard.errors)

## ----adaptive-me, eval = FALSE------------------------------------------------
#  ## Fit ocf on training sample.
#  forests <- ocf(y_tr, X_tr)
#  
#  ## Marginal effects at the mean on test sample.
#  me_atmean <- marginal_effects(forests, data = X_test, eval = "atmean")
#  summary(me_atmean)

## ----honest-me, eval = FALSE--------------------------------------------------
#  ## Honest forests.
#  honest_forests <- ocf(y_tr, X_tr, honesty = TRUE) # Notice we do not need inference here!
#  
#  ## Compute standard errors.
#  honest_me_atmean <- marginal_effects(honest_forests, data = X_test , eval = "atmean", inference = TRUE)
#  
#  ## LATEX.
#  print(honest_me_atmean, latex = TRUE)

