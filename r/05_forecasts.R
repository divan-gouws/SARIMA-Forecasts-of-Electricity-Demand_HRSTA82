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