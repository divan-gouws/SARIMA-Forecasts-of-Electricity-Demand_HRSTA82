# plot
autoplot(elec_first, main = "", xlab = "Year", ylab = "Gigawatt-hours")
ggseasonplot(elec_first, main = "", xlab = "Year", ylab = "Gigawatt-hours")

# descriptives
mean(elec_first)
sd(elec_first)

# ACF and PACF
ggAcf(elec_first) + ggtitle("")
ggPacf(elec_first) + ggtitle("")

# periodogram
periodogram(elec_first)

# seasonally differenced series
seasonal_differenced <- diff(elec_first, lag = 12)

# plot
autoplot(seasonal_differenced, main = "", xlab = "Year", ylab = "Gigawatt-hours")

# descriptives
mean(seasonal_differenced)
sd(seasonal_differenced)

# ACF and PACF
ggAcf(seasonal_differenced) + ggtitle("")
ggPacf(seasonal_differenced) + ggtitle("")


# plot seasonal differences
plot(seasonal_differenced)
#acf(as.vector(diff(diff(co2),lag=12)),lag.max=36,ci.type='ma')
#acf(as.vector(seasonal_differenced), lag.max=60, ci.type='ma')
pacf(seasonal_differenced)

# no centering as the time series as differencing is done