import tensorflow as tf
from tensorflow import keras
#Alejandro Alvarez - Victor
#deep learning

def create_temperature_model(activation_functions):
    model = keras.Sequential([
        keras.layers.Input(shape=(1,)),  # Un solo valor de entrada para los grados Celsius
        keras.layers.Dense(16, activation=activation_functions[0]),
        keras.layers.Dense(32, activation=activation_functions[1]),
        keras.layers.Dense(64, activation=activation_functions[2]),
        keras.layers.Dense(32, activation=activation_functions[3]),
        keras.layers.Dense(16, activation=activation_functions[4]),
        keras.layers.Dense(1)  # Una sola neurona de salida para los grados Fahrenheit
    ])
    return model

def train_and_evaluate_temperature_model(model, celsius, fahrenheit):
    model.compile(optimizer='adam', loss='mean_squared_error', metrics=['mae'])
    model.fit(celsius, fahrenheit, epochs=500, verbose=0)
    loss, mae = model.evaluate(celsius, fahrenheit)
    print(f"Pérdida: {loss}, Error absoluto medio: {mae}")

def main_temperature_conversion():
    celsius_data = [-40, -10, 0, 8, 15, 22, 38]  # grados Celsius
    fahrenheit_labels = [-40, 14, 32, 46.4, 59, 71.6, 100.4]  # Conversion a Fahrenheit

    activations = ['relu', 'sigmoid', 'tanh', 'softmax', 'linear']

    for i in range(3):
        model = create_temperature_model([activations[i % 5], activations[(i + 1) % 5], activations[(i + 2) % 5], activations[(i + 3) % 5], activations[(i + 4) % 5]])
        print(f"Red neuronal {i + 1} para la conversión de temperatura:")
        train_and_evaluate_temperature_model(model, celsius_data, fahrenheit_labels)

if __name__ == "__main__":
    main_temperature_conversion()
