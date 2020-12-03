# Residual plot
autoplot(residuals(model1), main = "", xlab = "Year", ylab = "Gigawatt-hours") + geom_hline(yintercept = 0, linetype = 2)
# residuals should look like white noise (uncorrelated) else there is info in residuals
# mean(res) = 0 else the forecasts are biased

# independence of residuals
runs(rstudent(model1))

# res must have constant variance
bptest(model1)

# res must be normally distributed
shapiro.test(residuals(model1))
# checkresiduals() function may be useful

# ACF of residuals
ggAcf(residuals(model1)) + ggtitle("")

hist(residuals(model1), main = "", xlab = "residuals", freq = FALSE, breaks = 12)
lines(seq(-1000, 400, by=.5), dnorm(seq(-1000, 400, by=.5), 0, sd(residuals(model1))), col="blue")

qqnorm(window(rstandard(model1),start=c(2010, 1)))
qqline(window(rstandard(model1),start=c(2010, 1)))

x<-sort(as.vector(residuals(model1)))
no_outlier <- x[x>-800]
shapiro.test(no_outlier)