""" import pandas as pd
from scipy.stats import linregress
import matplotlib.pyplot as plt



# Cargar el archivo csv en un DataFrame
df = pd.read_csv('C:\\Users\\migue\\Downloads\\datos_moviles.csv')

# Seleccionar las variables de interés
variables = ['price', 'ram']
df_subset = df[variables]

# Calcular la regresión lineal
slope, intercept, r_value, p_value, std_err = linregress(df_subset['ram'], df_subset['price'])

# Imprimir los coeficientes de la regresión lineal
print("Coeficiente de la pendiente:", slope)
print("Coeficiente de la intersección:", intercept)
print("Coeficiente de determinación:", r_value**2)

# Crear un gráfico de dispersión de la regresión lineal
plt.scatter(df_subset['ram'], df_subset['price'], alpha=0.5)
plt.plot(df_subset['ram'], slope * df_subset['ram'] + intercept, color='red')
plt.xlabel('RAM')
plt.ylabel('Precio')
plt.show() """


""" import pandas as pd
import numpy as np
from sklearn.svm import SVC
from mlxtend.plotting import plot_decision_regions
import matplotlib.pyplot as plt

# Cargar el dataset
data = pd.read_csv('C:\\Users\\migue\\Downloads\\datos_moviles.csv')

# Definir la variable objetivo
y = np.array(data['price_range'])
y = y.reshape(-1, 1)

# Definir las variables de entrada y normalizarlas
X = np.array(data[['ram', 'battery_power']])
X = (X - X.mean()) / X.std()

# Crear y ajustar el modelo SVM
clf = SVC(kernel='linear', C=1.0)
clf.fit(X, y)

# Evaluar la precisión del modelo
y_pred = clf.predict(X)
accuracy = np.mean(y_pred == y)

print(f'Precisión del modelo: {accuracy:.2%}')

# Representar gráficamente los límites de decisión
plot_decision_regions(X, y.ravel(), clf=clf, legend=2)

# Añadir ejes y título
plt.xlabel('RAM (normalizada)')
plt.ylabel('Battery Power (normalizada)')
plt.title('Límites de decisión SVM lineal')

# Mostrar la gráfica
plt.show() """


""" import pandas as pd
from sklearn.cluster import KMeans
import matplotlib.pyplot as plt

data = pd.read_csv('C:\\Users\\migue\\Downloads\\datos_moviles.csv')
# Seleccionamos las columnas de interés
X = data[['ram', 'price']]

# Creamos una lista vacía para almacenar los valores de las inercias
inertias = []

# Probamos con distintos valores de k (de 1 a 10)
for k in range(1, 11):
    # Creamos el modelo de k-medias
    kmeans = KMeans(n_clusters=k, random_state=42)
    # Entrenamos el modelo con los datos
    kmeans.fit(X)
    # Calculamos la inercia y la añadimos a la lista
    inertias.append(kmeans.inertia_)

# Graficamos la curva de la suma de las distancias intracluster
plt.plot(range(1, 11), inertias, marker='o')
plt.xlabel('Número de clústeres')
plt.ylabel('Inercia')
plt.show()

# Creamos el modelo de k-medias con k=4
kmeans = KMeans(n_clusters=4, random_state=42)
# Entrenamos el modelo con los datos
kmeans.fit(X)
# Obtenemos los centros de los clústeres
centers = kmeans.cluster_centers_

# Graficamos los datos agrupados por clúster
plt.scatter(X.iloc[:, 0], X.iloc[:, 1], c=kmeans.labels_, cmap='viridis')
# Graficamos los centros de los clústeres
plt.scatter(centers[:, 0], centers[:, 1], marker='x', s=200, linewidths=3, color='r')
plt.xlabel('Ram')
plt.ylabel('Price')
plt.show() """

""" from sklearn.decomposition import PCA
from sklearn.preprocessing import StandardScaler
import pandas as pd
data = pd.read_csv('C:\\Users\\migue\\Downloads\\datos_moviles.csv')

# eliminar la columna price_range
data_pca = data.drop('price_range', axis=1)

# normalizar las características
scaler = StandardScaler()
data_pca = scaler.fit_transform(data_pca)

# crear objeto PCA y ajustar el modelo
pca = PCA()
pca.fit(data_pca)

# obtener la varianza explicada y graficarla
import matplotlib.pyplot as plt
plt.plot(range(1, len(pca.explained_variance_ratio_)+1), pca.explained_variance_ratio_.cumsum())
plt.xlabel('Número de dimensiones')
plt.ylabel('Varianza explicada acumulada')
plt.show() """