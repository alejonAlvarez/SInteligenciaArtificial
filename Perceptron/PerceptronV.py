
import numpy as np
import matplotlib.pyplot as plt

class PerceptronXOR:
    def __init__(self, n):
        self.pesos = np.random.randn(n)
        
        self.n = n

    def propagacion(self, entradas):
        self.salida = 1 if np.dot(self.pesos, entradas) > 0 else 0
        self.entradas = entradas

    def actualizacion(self, alfa, salida_deseada):
        for i in range(self.n):
            self.pesos[i] = self.pesos[i] + alfa * (salida_deseada - self.salida) * self.entradas[i]

# Creamos una instancia del perceptrón con dos entradas (para XOR)
perceptron_xor = PerceptronXOR(2)

# Definimos ejemplos de entrada y salida deseada para la operación XOR
ejemplos_xor = np.array([
    [0, 0, 0],
    [0, 1, 1],
    [1, 0, 1],
    [1, 1, 0]
])

# Entrenamos el perceptrón XOR
grad_pesos = [perceptron_xor.pesos.copy()]
for epoca in range(100):
    for ejemplo in ejemplos_xor:
        entradas = ejemplo[:2]  # Tomamos las primeras dos entradas
        salida_deseada = ejemplo[2]  # Tomamos la última entrada como la salida deseada
        perceptron_xor.propagacion(entradas)
        perceptron_xor.actualizacion(0.1, salida_deseada)
        grad_pesos.append(perceptron_xor.pesos.copy())

grad_pesos = np.array(grad_pesos)

# Graficamos los cambios en los pesos
plt.plot(grad_pesos[:, 0], 'k', label='Peso 0')
plt.plot(grad_pesos[:, 1], 'r', label='Peso 1')
plt.legend()
plt.xlabel('Iteración')
plt.ylabel('Valor de los Pesos')
plt.show()

# Imprimimos los pesos finales del perceptrón
print("Pesos finales:", perceptron_xor.pesos)
