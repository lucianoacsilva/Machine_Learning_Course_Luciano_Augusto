# Data Preprocessing Template

# Importing the libraries
import numpy as np
import matplotlib.pyplot as plt
import pandas as pd
import os


#Change work directory

os.chdir('/Users/lucianosilva/Documents/Machine Learning/Multiple_Linear_Regression')

# Importing the dataset
dataset = pd.read_csv('50_Startups.csv')
x = dataset.iloc[:, :-1].values
y = dataset.iloc[:, 4].values

#Encoding categorical data
#Encodign the Independent Variable

from sklearn.preprocessing import LabelEncoder, OneHotEncoder
labelencoder_x = LabelEncoder()
x[:, 3] = labelencoder_x.fit_transform(x[:, 3])
onehotencoder = OneHotEncoder(categorical_features = [3])
x = onehotencoder.fit_transform(x).toarray()

#Avoiding the Dummy variable trap

x = x[:, 1:]

# Splitting the dataset into the Training set and Test set
from sklearn.cross_validation import train_test_split
x_train, x_test, y_train, y_test = train_test_split(x, y, test_size = 0.2, random_state = 0)

# Feature Scaling
"""from sklearn.preprocessing import StandardScaler
sc_X = St andardScaler()
X_train = sc_X.fit_transform(X_train)
X_test = sc_X.transform(X_test)
sc_y = StandardScaler()
y_train = sc_y.fit_transform(y_train)"""

#Fitting the Linear Regressor to the training set

from sklearn.linear_model import LinearRegression
regressor = LinearRegression()
regressor.fit(x_train, y_train)

#Predicting the Test results

y_pred = regressor.predict(x_test)

#Bacward elimination preparation

#Buliding the optimal backward elimination

import statsmodels.formula.api as sm

x = np.append(arr= np.ones((50,1)).astype(int), values= x, axis=1)
x_opt = x[:, [0, 1, 2, 3, 4, 5]]
sig_lev = 0.05

#Step 2
regressor_ols = sm.OLS(endog=y, exog= x_opt).fit()

#Step 3
regressor_ols.summary()

#Step 4
x_opt = x[:, [0, 1, 3, 4, 5]]
regressor_ols = sm.OLS(endog=y, exog= x_opt).fit()
regressor_ols.summary()

x_opt = x[:, [0, 3, 4, 5]]
regressor_ols = sm.OLS(endog=y, exog= x_opt).fit()
regressor_ols.summary()

x_opt = x[:, [0, 3, 5]]
regressor_ols = sm.OLS(endog=y, exog= x_opt).fit()
regressor_ols.summary()

x_opt = x[:, [0, 3]]
regressor_ols = sm.OLS(endog=y, exog= x_opt).fit()
regressor_ols.summary()


