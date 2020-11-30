# Portmanteau Q test for white noise. null hypothesis is white noise.
Box.test(elec_first, type = "Ljung-Box")

# Use the auto arima to select the model with the lowest AIC
automod <- auto.arima(elec_first)

model1 <- arima(elec_first,order=c(0, 1, 1), 
                seasonal=list(order=c(0, 1, 1), period=12))
model1