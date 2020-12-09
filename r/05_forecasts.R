# add mean back to centered data for forecasting

# naive forecasts
elec_naive <- naive(elec_first, h=60)
autoplot(elec_naive)
summary(elec_naive)

# seasonal naive forecasts
elec_snaive <- snaive(elec_first, h=60)
autoplot(elec_snaive)
summary(elec_snaive)

plot(model1, n1=c(2010, 1), n.ahead=60, xlab='Year', type='b',
     ylab='Elec')

# check forecast errors (not the same as residuals) use accuracy(forecast, second)
# mean absolute error
# mean squared error
# mean absolute percentage error

# look into tsCV for different forecast horizons

fc <- forecast(model1, h = 60)
errors <- elec_second - fc$mean
plot(fc, main = "", xlab = "Year", ylab = "Gigawatt-hours", ylim=c(15500, 21500))
lines(elec_second, lty = 2)
legend("bottomleft", legend=c("Original time series", "Actual future values", "Forecasted values"), col=c("black", "black", "blue"), lty=c(1,2,1), cex=0.8)
hist(errors)

library(Metrics)
rmse(elec_second, fc$mean)
mae(elec_second, fc$mean)
mape(elec_second, fc$mean)*100

