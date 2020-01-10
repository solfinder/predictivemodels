# predictivemodels
Darpg Online Hackathon On Data Driven Innovation For Citizen Grievance Redressal - Predictive Models

1) This application creates department wise ARIMA models for predicting grievances and disposal metrics for subsequent months given prior data.

2) Source data is populated in a mysql table - monthlydata.
This data is preprocessed using a Java module (MySqlCon1) to generate department-wise timeseries data per department for both receipts and disposal metrics.

3) The generated csv files serve as inputs for an R module(darpg.r) which creates ARIMA models per department and uses these models to predict metrics for future months.

4) The predictions are stored in csv files department-wise.

5) Predictions can also be plotted graphically for analyzing patterns.

6) Details of ARIMA models generated for each individual timeseries are also saved for review and reference. 

7) Demo : https://youtu.be/otq0YXMwv1g
