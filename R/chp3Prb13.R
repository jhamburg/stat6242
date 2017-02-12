set.seed(1)

# a)
x <- rnorm(100)

# b)
eps <- rnorm(100, mean = 0, sd = 0.25)

# c)
y <- -1 + 0.5 * x + eps

# length = 100
# b0 = -1
# b1 = 0.5

# d)
plot(x, y)

# positive linear relationship

# e)
yhat <- lm(y ~ x)

# B0 and B1 are close but not exactly -1 and .5.
# In a surprising note, the R square is only .83,
# which seems low based on the simple model

# f)
plot(x, y)
abline(yhat, col = 'blue')
abline(-1, 0.5, col = 'red')
legend('right', c('LM', 'Pop'), col = c('blue', 'red'), lty = c(1, 1))

# g)
yhatPoly <- lm(y ~ poly(x, 2))

nova1 <- anova(yhat, yhatPoly)

# The p-value of the squared term is not significant and
# the R2 doesn't change at all so there is good belief that it
# doesn't help.  Additionally, the F statistic from the anova
# test is small and not significant, so it seems the two models
# are not statistically different meaning that by adding the extra
# parameter, the model didn't change.

# h)
set.seed(1)

x1 <- rnorm(100)
eps1 <- rnorm(100, mean = 0, sd = 0.1)
y1 <- -1 + 0.5 * x1 + eps1

yhat1 <- lm(y1 ~ x1)

plot(x1, y1)
abline(yhat1, col = 'blue')
abline(-1, 0.5, col = 'red')
legend('bottomright', c('LM', 'Pop'), col = c('blue', 'red'), lty = c(1, 1))

# The points have less variability and the LM and Population line are
# completely indistinct

# i)

set.seed(1)

x2 <- rnorm(100)
eps2 <- rnorm(100, mean = 0, sd = 1.5)
y2 <- -1 + 0.5 * x2 + eps2

yhat2 <- lm(y2 ~ x2)

plot(x2, y2)
abline(yhat2, col = 'blue')
abline(-1, 0.5, col = 'red')
legend('bottomright', c('LM', 'Pop'), col = c('blue', 'red'), lty = c(1, 1))

# The plot shows less of a correlation. The lines are more spread apart and 
# the slope is smaller.

# j)
origCI <- confint(yhat)
lessNCI <- confint(yhat1)
moreNCI <- confint(yhat2)

# The confidence interval for the less noisy is smaller, more noisy is larger.