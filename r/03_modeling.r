model1 <- arima(elec_xts,order=c(0, 1, 1), 
                seasonal=list(order=c(0, 1, 1), period=12))
model1