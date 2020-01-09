# R Module for timeseries forecasting of received and disposed grievances
# Developed by Prateek Khanna

install.packages("forecast")
install.packages("Metrics")
# loading packages
library(forecast)
library(Metrics)
library(ggplot2)

#Default forecast period is set to 12
#Update this value to generate forecasts for different periods
forecast_period=12

data1 = read.csv("C:\\temp\\classes\\csv_receipts\\NITI_Aayog_receipts.csv")

nm <- list.files(path="C:\\temp\\classes\\csv_receipts")
for(filename in nm){
# reading data from csv file
data = read.csv(paste("C:\\temp\\classes\\csv_receipts\\",filename,sep=""))
#ggplot(data, aes(x=Month, y=Receipts)) + geom_point()
#ggsave(paste(paste("C:\\temp\\classes\\csv_receipts_graph\\",filename,sep=""),".png",sep=""),width = 25, height = 25)
# training data sets
train = data[1:nrow(data),]

# removing "Month" column
train$Month = NULL

# training model
model = auto.arima(train)

# model summary
sink(paste(paste("C:\\temp\\classes\\csv_receipts_predictionmodel\\",filename,sep=""),".txt",sep=""))
print(summary(model))
sink()

# forecasting
forecast = predict(model,forecast_period)

write.table(forecast$pred, file = paste("C:\\temp\\classes\\csv_receipts_prediction\\",filename,sep=""), sep = ",",col.names=NA)

#ggplot(data2, aes(x=Month, y=Receipts)) + geom_point()
#ggsave(paste(paste("C:\\temp\\classes\\csv_receipts_prediction_graph\\",filename,sep=""),".png",sep=""))
}

nm <- list.files(path="C:\\temp\\classes\\csv_disposal")
for(filename in nm){
# reading data from csv file
data = read.csv(paste("C:\\temp\\classes\\csv_disposal\\",filename,sep=""))
#ggplot(data, aes(x=Month, y=Receipts)) + geom_point()
#ggsave(paste(paste("C:\\temp\\classes\\csv_disposal_graph\\",filename,sep=""),".png",sep=""),width = 25, height = 25)

# training data sets
train = data[1:nrow(data),]

# removing "Month" column
train$Month = NULL

# training model
model = auto.arima(train)

# model summary
sink(paste(paste("C:\\temp\\classes\\csv_disposal_predictionmodel\\",filename,sep=""),".txt",sep=""))
print(summary(model))
sink()

#summary(model)

# forecasting
forecast = predict(model,forecast_period)

write.table(forecast$pred, file = paste("C:\\temp\\classes\\csv_disposal_prediction\\",filename,sep=""), sep = ",", col.names = NA, qmethod = "double")

}
