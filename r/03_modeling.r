# Portmanteau Q test for white noise
Box.test(elec_first, type = "Ljung-Box")

model1 <- arima(elec_first,order=c(0, 1, 1), 
                seasonal=list(order=c(0, 1, 1), period=12))
model1