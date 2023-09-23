#alejandro alvarez - victror
#regresion lineal
import pandas as pd
import numpy as np
from sklearn.metrics import r2_score
from sklearn.model_selection import train_test_split
from sklearn.linear_model import LinearRegression

# Cargar el conjunto de datos
datosVillanos = pd.read_csv('MachineLearning/supervillain_data_3.csv')

# Visualizar el conjunto de datos
print(datosVillanos)

# Seleccionar las columnas de interés
columnas_interes = ['Name', 'IGN_Rank', 'Main_Ft_Apperance', 'No_Feature_Films', 'Rating', 'Award_Wins', 'Nominations', 'Gender', 'Human/Other', 'Type']
datos_interes = datosVillanos[columnas_interes]

# Eliminar filas con valores faltantes
datos_interes = datos_interes.dropna()

# Dividir los datos en conjuntos de entrenamiento y prueba
X = datos_interes[['IGN_Rank']]
y = datos_interes[['Rating']]
X_train, X_test, y_train, y_test = train_test_split(X, y, test_size=0.2, random_state=50)

# Ajustar un modelo de regresión lineal
model = LinearRegression()
model.fit(X_train, y_train)

# Realizar predicciones
y_predict = model.predict(X_test)

# Calcular el coeficiente de determinación R^2
r2 = r2_score(y_test, y_predict)
print("Coeficiente de determinación R^2:", r2)

# Visualizar los coeficientes e intercepto del modelo
print("Coeficientes:", model.coef_)
print("Intercepto:", model.intercept_)

