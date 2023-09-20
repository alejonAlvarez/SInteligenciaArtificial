import random
#Perceptron
class PoliPerceptron:
    def __init__(self):
        self.temperature_weight = random.uniform(-1, 1)
        self.cloudiness_weight = random.uniform(-1, 1)
        self.bias = random.uniform(-1, 1)

    def predict(self, temperature, cloudiness):
        weighted_sum = (temperature * self.temperature_weight +
                        cloudiness * self.cloudiness_weight + self.bias)
        if weighted_sum > 0:
            return "¡Hace buen tiempo!"
        else:
            return "¡Hace mal tiempo!"

    def train(self, training_data, labels, epochs):
        for _ in range(epochs): 
            for (temperature, cloudiness), label in zip(training_data, labels):
                prediction = self.predict(temperature, cloudiness)
                error = 1 if label == "¡Hace buen tiempo!" else -1
                self.temperature_weight += error * temperature
                self.cloudiness_weight += error * cloudiness
                self.bias += error

# Datos de entrenamiento
training_data = [(30, 0.2), (25, 0.8), (20, 0.5), (15, 0.9), (15, 0.9)]
labels = ["¡Hace buen tiempo!", "¡Hace buen tiempo!", "¡Hace mal tiempo!", "¡Hace mal tiempo!"]

# Crear el "Poli perceptrón"
poli = PoliPerceptron()

# Entrenar al Poli
poli.train(training_data, labels, epochs=100)

# Hacer predicciones
# (Temperatura de 28 grados y nubosidad del 60% el poli predice el tiempo)
new_weather = (28, 0.6)
prediction = poli.predict(*new_weather)
print(f"El poli dice: {prediction}")
