# plot
plot(elec_xts, main = "", xlab = "", ylab = "")

# ACF and PACF
acf(elec_xts)
pacf(elec_xts)

# plot seasonal differences
plot(diff(elec_xts, lag = 12))