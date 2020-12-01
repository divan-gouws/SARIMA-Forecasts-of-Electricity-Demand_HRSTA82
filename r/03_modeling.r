# Portmanteau Q test for white noise. null hypothesis is white noise.
k <- c(1:12)
BoxFunction <- function(k){Box.test(elec_first, lag = k, type = "Ljung-Box")}
lapply(k, BoxFunction)

# heteroskedasticity tests

# stationarity tests
kpss.test(elec_first)
adf.test(elec_first)
pp.test(elec_first)

# seasonality tests, the null of ch is a stable seasonal pattern. we fail to reject
ch.test(elec_first, type = "dummy", sid = 12)
#ocsb.test(elec_first, lag.method = c("AIC"), maxlag = 12)
#hegy.test(elec_first, deterministic = c(1, 0, 1), lag.method = c("AIC"), maxlag = 12)

# Use the auto arima to select the model with the lowest AIC
automod <- auto.arima(elec_first)

model1 <- arima(elec_first,order=c(0, 1, 1), 
                seasonal=list(order=c(0, 1, 1), period=12))
model1