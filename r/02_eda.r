# plot
autoplot(elec_first, main = "Electricity demand in South Africa", xlab = "Time", ylab = "Gigawatt-hours")
ggseasonplot(elec_first)

# descriptives
mean(elec_first)
sd(elec_first)

# stationarity tests
kpss.test(elec_first)
adf.test(elec_first)
pp.test(elec_first)

# ACF and PACF
ggAcf(elec_first) + ggtitle("Sample ACF for electricity data")
ggPacf(elec_first) + ggtitle("Sample PACF for electricity data")

# periodogram
periodogram(elec_first)

# seasonally differenced series
seasonal_differenced <- diff(elec_first, lag = 12)

# plot seasonal differences
plot(seasonal_differenced)
acf(as.vector(diff(diff(co2),lag=12)),lag.max=36,ci.type='ma')
acf(as.vector(seasonal_differenced), lag.max=60, ci.type='ma')
pacf(seasonal_differenced)