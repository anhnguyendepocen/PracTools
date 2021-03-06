#****************************************************************************
# FILE:    Example 3.12.R
# PROJECT: Practical Tools book
# DATE:    09/26/2010
# AUTHOR:  R. Valliant
# PURPOSE: Compute sample size in smho98 for pp(beds) sample.
#****************************************************************************

#attach("C:\\Projects\\Practical Tools Book\\Data\\smho98.RData", pos=2)
require(PracTools)
data(smho98)

CV0 <- 0.15

y <- smho98[,"EXPTOTAL"]
x <- smho98[, "BEDS"]
y <- y[x>0]
x <- x[x>0]
ybarU <- mean(y)

(N <- length(x))
#[1] 671
cert <- (1:N)[x > 2000]
cert
#[1] 625

                # calculate V1 based on pp(x) sample
pik <- x[-cert]/sum(x[-cert])
T <- sum(y[-cert])
V1 <- sum( pik*(y[-cert]/pik - T)^2)
V1
#[1] 9.53703e+19

n <- V1 / (N*ybarU*CV0)^2
(n <- ceiling(n))
#[1] 51

pik <- n*x[-cert]/sum(x[-cert])
summary(pik)
#        Min.   1st Qu.    Median      Mean   3rd Qu.      Max.
#   0.0007183 0.0181400 0.0445300 0.0761200 0.0847600 0.9747000
