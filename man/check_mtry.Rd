% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/checks.R
\name{check_mtry}
\alias{check_mtry}
\title{Check Argument mtry}
\usage{
check_mtry(mtry, nv)
}
\arguments{
\item{mtry}{Number of covariates to possibly split at in each node. Default is the (rounded down) square root of the number of covariates. Alternatively, one can pass a single-argument function returning an integer, where the argument is the number of covariates.}

\item{nv}{Number of covariates.}
}
\value{
Appropriate value of \code{mtry}.
}
\description{
Check Argument mtry
}
\keyword{internal}
