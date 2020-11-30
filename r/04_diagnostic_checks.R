# Residual plot
plot(window(rstandard(model1), start=c(2010, 1)),
     ylab='Standardized Residuals', type='o')
abline(h=0)
# residuals should look like white noise (uncorrelated) else there is info in residuals
# mean(res) = 0 else the forecasts are biased

# res must have constant variance
bptest(model1)

# res must be normally distributed
# checkresiduals() function may be useful

# ACF of residuals
acf(as.vector(window(rstandard(model1), start=c(2010, 1))),
    lag.max=60)

hist(window(rstandard(model1),start=c(2010, 1)),
     xlab='Standardized Residuals')

qqnorm(window(rstandard(model1),start=c(2010, 1)))
qqline(window(rstandard(model1),start=c(2010, 1)))