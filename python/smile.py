'''
Algoritmo Python para detecção de sorriso, através de reconhecimento facial, em tempo real
Pré-requisito:
Windows: pip install opencv-python
Linux (.deb): sudo pip3 install opencv-python --break-system-packages
'''

# Importar libraries
import cv2
import numpy as np

# Carregar classificadores pré-treinados (OpenCV) para rosto e sorriso
face_cascade = cv2.CascadeClassifier(cv2.data.haarcascades + 'haarcascade_frontalface_default.xml')
smile_cascade = cv2.CascadeClassifier(cv2.data.haarcascades + 'haarcascade_smile.xml')

# Calcular média móvel (suavização)
def moving_average(data, window_size=5):
    return np.convolve(data, np.ones(window_size) / window_size, mode='valid')

# Armazenar histórico de percentuais de sorrisos, e captura de webcam
smile_percentages = []
video_capture = cv2.VideoCapture(0)

while True:
    ret, frame = video_capture.read()
    gray = cv2.cvtColor(frame, cv2.COLOR_BGR2GRAY) # Converter imagem para tons de cinza
    faces = face_cascade.detectMultiScale(gray, scaleFactor=1.3, minNeighbors=5, minSize=(30, 30)) # Detectar rostos

    for (x, y, w, h) in faces:
        cv2.rectangle(frame, (x, y), (x+w, y+h), (255, 0, 0), 2) # Renderizar retângulo ao redor do rosto
        face_gray = gray[y:y+h, x:x+w]
        face_color = frame[y:y+h, x:x+w]
        smiles = smile_cascade.detectMultiScale(face_gray, scaleFactor=1.8, minNeighbors=20) # Detectar sorrisos dentro da região do rosto

        # Verificar se sorriso foi detectado
        if len(smiles) > 0:
            sx, sy, sw, sh = max(smiles, key=lambda rect: rect[2] * rect[3]) # Usar maior sorriso detectado
            cv2.rectangle(face_color, (sx, sy), (sx+sw, sy+sh), (0, 255, 0), 2) # Renderizar retângulo ao redor do sorriso
            smile_percentage = int((sw / w) * 100)
            smile_percentages.append(smile_percentage)

            # Suavizar últimos percentuais via média móvel (evitar variações abruptas)
            if len(smile_percentages) > 5:
                smooth_smile_percentage = int(moving_average(smile_percentages)[-1])
            else:
                smooth_smile_percentage = smile_percentage

            # Exibir percentual de sorriso suavizado se for maior que 20% (evitar falsos positivos)
            if smooth_smile_percentage > 20:
                cv2.putText(frame, f'Sorriso: {smooth_smile_percentage}%', (x, y - 10),
                cv2.FONT_HERSHEY_SIMPLEX, 0.9, (0, 255, 0), 2)
    
    cv2.imshow('Video', frame)

    # Sair do código ao pressionar tecla 'q'
    if cv2.waitKey(1) & 0xFF == ord('q'):
        break

video_capture.release()
cv2.destroyAllWindows()