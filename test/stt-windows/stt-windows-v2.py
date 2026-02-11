import speech_recognition as sr

def record_text(recognizer, max_attempts=5):
  attempts = 0
  
  while attempts < max_attempts:
    try:
      with sr.Microphone() as source:
        print("Ajustando al ruido ambiental...")
        recognizer.adjust_for_ambient_noise(source, duration=0.2)

        print("Escuchando...")
        audio = recognizer.listen(source, timeout=5)

        text = recognizer.recognize_google(audio, language="en-EN")
        return text

    except sr.WaitTimeoutError:
      print("Tiempo de espera agotado.")
    except sr.UnknownValueError:
      print("No se pudo entender el audio.")
    except sr.RequestError as e:
      print(f"Error al solicitar resultados: {e}")
      break

    attempts += 1

  return None


def output_text(text, filename="output.txt"):
  if text:
    with open(filename, "a", encoding="utf-8") as f:
      f.write(text + "\n")


def main():
  recognizer = sr.Recognizer()

  while True:
    print("\nPor favor, hable ahora...")
    text = record_text(recognizer)

    if text:
      print(f"Texto reconocido: {text}")
      output_text(text)
    else:
      print("No se obtuvo texto válido.")


if __name__ == "__main__":
  main()
