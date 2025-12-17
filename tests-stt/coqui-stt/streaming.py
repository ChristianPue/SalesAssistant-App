import stt
import pyaudio
import numpy as np
import os
import urllib.request

# Carpeta donde estarán los modelos
MODELS_DIR = os.path.join(os.path.dirname(__file__), "models")

MODEL_PATH = os.path.join(MODELS_DIR, "coqui-stt-0.9.3-models.pbmm")
SCORER_PATH = os.path.join(MODELS_DIR, "coqui-stt-0.9.3-models.scorer")

MODEL_URL = "https://github.com/coqui-ai/STT-models/releases/download/english/coqui-stt-0.9.3-models.pbmm"
SCORER_URL = "https://github.com/coqui-ai/STT-models/releases/download/english/coqui-stt-0.9.3-models.scorer"

def download_file(url, dest):
    """Descarga un archivo si no existe en la ruta destino."""
    if not os.path.exists(dest):
        os.makedirs(os.path.dirname(dest), exist_ok=True)
        print(f"⬇️ Descargando {os.path.basename(dest)} ...")
        urllib.request.urlretrieve(url, dest)
        print(f"✅ {os.path.basename(dest)} descargado en {dest}")

# Verificar y descargar modelos si faltan
download_file(MODEL_URL, MODEL_PATH)
download_file(SCORER_URL, SCORER_PATH)

# Inicializar el modelo Coqui STT
model = stt.Model(MODEL_PATH)
model.enableExternalScorer(SCORER_PATH)

# Configuración de PyAudio
CHUNK = 1024
FORMAT = pyaudio.paInt16
CHANNELS = 1
RATE = 16000

p = pyaudio.PyAudio()
stream = p.open(format=FORMAT,
                channels=CHANNELS,
                rate=RATE,
                input=True,
                frames_per_buffer=CHUNK)

print("🎤 Hable ahora... (Ctrl+C para detener)")

# Crear un stream de Coqui STT
stt_stream = model.createStream()

try:
    while True:
        data = stream.read(CHUNK)
        stt_stream.feedAudioContent(np.frombuffer(data, np.int16))
        text_so_far = stt_stream.intermediateDecode()
        if text_so_far:
            print("Reconocido hasta ahora:", text_so_far)
except KeyboardInterrupt:
    print("\n🛑 Finalizando...")

# Obtener la transcripción final
final_text = stt_stream.finishStream()
print("Transcripción final:", final_text)

# Cerrar recursos
stream.stop_stream()
stream.close()
p.terminate()
