import speech_recognition as sr
import pyttsx3

# Inicializar el reconocedor
r = sr.Recognizer()

def record_text():
  # Loop en caso de errores
  while True:
    try:
      # Usar el micrófono como fuente de entrada
      with sr.Microphone() as source2:
        # Ajustar el ruido ambiental
        r.adjust_for_ambient_noise(source2, duration=0.2)

        # Escuchar la entrada del usuario
        audio2 = r.listen(source2)

        # Usar Google para reconocer el audio en español
        MyText = r.recognize_google(audio2, language="es-ES")

        return MyText
      
    except sr.RequestError as e:
      print("No se pudo solicitar resultados; {0}".format(e))
    except sr.UnknownValueError:
      print("No se pudo entender el audio")

  return

def output_text(text):
  with open("output.txt", "a", encoding="utf-8") as f:
    f.write(text + "\n")
  return

while True:
  print("Por favor, hable ahora...")
  text = record_text()
  output_text(text)