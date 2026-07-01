import cv2
import numpy as np
import os
import sys
import tensorflow as tf
from sklearn.model_selection import train_test_split

EPOCHS = 10
IMG_WIDTH = 30
IMG_HEIGHT = 30
NUM_CATEGORIES = 43
TEST_SIZE = 0.4


def main():
    if len(sys.argv) not in [2, 3]:
        sys.exit("Uso: python traffic.py diretorio_dados [modelo.h5]")

    images, labels = load_data(sys.argv[1])

    labels = tf.keras.utils.to_categorical(labels)

    x_train, x_test, y_train, y_test = train_test_split(
        np.array(images), np.array(labels), test_size=TEST_SIZE
    )

    model = get_model()
    model.fit(x_train, y_train, epochs=EPOCHS)
    model.evaluate(x_test, y_test, verbose=2)

    if len(sys.argv) == 3:
        filename = sys.argv[2]
        model.save(filename)
        print(f"Modelo salvo em {filename}.")


def load_data(data_dir):
    images = []  # Lista para armazenar arrays das imagens
    labels = []  # Lista para armazenar rótulos (categorias) das imagens

    for category in range(NUM_CATEGORIES):
        # Caminho completo da pasta da categoria atual
        category_path = os.path.join(data_dir, str(category))

        # Percorre todos arquivos de imagem na pasta
        for img_name in os.listdir(category_path):
            # Caminho completo do arquivo de imagem
            img_path = os.path.join(category_path, img_name)
            img = cv2.imread(img_path)  # Lê imagem como array NumPy
            if img is not None:
                img = cv2.resize(img, (IMG_WIDTH, IMG_HEIGHT))  # Redimensiona para tamanho padrão
                images.append(img)  # Adiciona imagem à lista
                labels.append(category)  # Adiciona rótulo (categoria) correspondente

    return images, labels  # Retorna tupla contendo imagens e rótulos


def get_model():
    model = tf.keras.models.Sequential([
        # 1ª camada convolucional + max pooling
        tf.keras.layers.Conv2D(32, (3, 3), activation='relu',
                               input_shape=(IMG_WIDTH, IMG_HEIGHT, 3)),
        tf.keras.layers.MaxPooling2D(pool_size=(2, 2)),

        # 2ª camada convolucional + max pooling
        tf.keras.layers.Conv2D(64, (3, 3), activation='relu'),
        tf.keras.layers.MaxPooling2D(pool_size=(2, 2)),

        # Achata saída para passar às camadas densas
        tf.keras.layers.Flatten(),

        # Camada densa intermediária
        tf.keras.layers.Dense(128, activation='relu'),

        # Dropout para evitar overfitting
        tf.keras.layers.Dropout(0.5),

        # Camada de saída com unidade por categoria e ativação softmax
        tf.keras.layers.Dense(NUM_CATEGORIES, activation='softmax')
    ])

    # Compila modelo com otimizador Adam e função de perda apropriada
    model.compile(
        optimizer='adam',
        loss='categorical_crossentropy',
        metrics=['accuracy']
    )

    return model  # Retorna modelo compilado


if __name__ == "__main__":
    main()
