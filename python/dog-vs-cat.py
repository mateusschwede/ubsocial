'''
Algoritmo IA CNN para reconhecimento de imagens (cães e gatos) com Python
Dataset:
Kaggle: https://www.kaggle.com/c/dogs-vs-cats/data
Tensorflow Datasets: https://www.tensorflow.org/datasets/catalog/cats_vs_dogs?hl=pt-br
Pré-requisitos:
Windows: pip install tensorflow numpy matplotlib pillow
Linux (.deb): sudo pip3 install tensorflow numpy matplotlib --break-system-packages
'''

# Importar libraries
import tensorflow as tf
from tensorflow.keras import layers, models
import tensorflow_datasets as tfds
import matplotlib.pyplot as plt

# Informar dados de treino e test, carregados do Tensorflow datasets
(train_data, test_data), metadata = tfds.load('cats_vs_dogs', split=['train[:80%]', 'train[80%:]'], with_info=True, as_supervised=True)

# Redimencionamento e normalização das imagens
IMG_SIZE = 128

def format_image(image, label):
    image = tf.image.resize(image, (IMG_SIZE, IMG_SIZE))
    image = image / 255.0 # Normalizar
    return image, label

train_data = train_data.map(format_image)
test_data = test_data.map(format_image)

# Batching (tamanho do lote) e otimização em cache de leitura de dados:
BATCH_SIZE = 32
SHUFFLE_BUFFER_SIZE = 1000

train_data = train_data.shuffle(SHUFFLE_BUFFER_SIZE).batch(BATCH_SIZE)
test_data = test_data.batch(BATCH_SIZE)

# Criação do modelo, com camadas Conv2D e MaxPooling2D:
model = models.Sequential([
    layers.Conv2D(32, (3, 3), activation='relu', input_shape=(IMG_SIZE, IMG_SIZE, 3)),
    layers.MaxPooling2D(2, 2),
    layers.Conv2D(64, (3, 3), activation='relu'),
    layers.MaxPooling2D(2, 2),
    layers.Conv2D(128, (3, 3), activation='relu'),
    layers.MaxPooling2D(2, 2),
    layers.Conv2D(128, (3, 3), activation='relu'),
    layers.MaxPooling2D(2, 2),
    layers.Flatten(),
    layers.Dense(512, activation='relu'),
    layers.Dense(1, activation='sigmoid') # Saída: 0 (gato) ou 1 (cão)
])

model.compile(optimizer='adam', loss='binary_crossentropy', metrics=['accuracy'])

# Treinamento do modelo
EPOCHS = 10 # Aumentar nº de épocas e ajustar arquitetura da rede podem melhorar precisão, mas também aumentar risco de overfitting
history = model.fit(train_data, epochs=EPOCHS, validation_data=test_data)

# Visualização dos resultados
acc = history.history['accuracy']
val_acc = history.history['val_accuracy']
loss = history.history['loss']
val_loss = history.history['val_loss']
epochs_range = range(EPOCHS)

plt.figure(figsize=(8, 8))
plt.subplot(1, 2, 1)
plt.plot(epochs_range, acc, label='Training Accuracy')
plt.plot(epochs_range, val_acc, label='Validation Accuracy')
plt.legend(loc='lower right')
plt.title('Training and Validation Accuracy')

plt.subplot(1, 2, 2)
plt.plot(epochs_range, loss, label='Training Loss')
plt.plot(epochs_range, val_loss, label='Validation Loss')
plt.legend(loc='upper right')
plt.title('Training and Validation Loss')
plt.show()

# Avaliação no conjunto de teste
test_loss, test_acc = model.evaluate(test_data)
print(f'Test accuracy: {test_acc}')

# Salvar/exportar modelo
model.save('cat_dog_classifier.keras') # salvar '.keras' ou '.h5'

# Novas submissões
import numpy as np
from tensorflow.keras.preprocessing import image
from PIL import Image

# Preparar/tratar imagem
def prepare_image(img_path):
    img = Image.open(img_path)
    img = img.resize((IMG_SIZE, IMG_SIZE))
    img = np.array(img) / 255.0
    img = np.expand_dims(img, axis=0)
    return img

img_path = 'diretorio/imagem.jpg' # exemplo: '/content/gato.jpg'
new_image = prepare_image(img_path)

prediction = model.predict(new_image)
print(prediction[0])

# Conforme valor accuracy, será cão ou não
if prediction[0] > 0.5:
    print("É um cão!")
else:
    print("É um gato!")

# Carregamento do modelo
from tensorflow.keras.models import load_model
model = load_model('cat_dog_classifier.keras') # modelo '.keras' ou '.h5'