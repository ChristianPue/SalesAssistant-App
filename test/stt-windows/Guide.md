# Cómo usar SpeechRecognition en Python
## 1. Revisa las versiones de Python instaladas en tu sistema
```bash
py -0p
```
## 2. Si no tienes Python 3.8+, instálalo con Chocolatey
Ejecuta en PowerShell como Administrador:
```bash
choco install python --version=3.8
```
## 3. Ubícate en la carpeta del proyecto
```bash
cd SALESASSITANT-APP\test\stt-windows
```
## 4. Crea y activa el entorno virtual
```bash
py -3.8 -m venv venv
venv\Scripts\activate
```
Para desactivarlo
```bash
deactivate
```
## 5. Instala las dependencias
```bash
pip install -r requirements.txt
```
Para instalar PyAudio en Windows, ejecutar el siguiente comando:
```bash
pip install .\PyAudio-0.2.11-cp38-cp38-win_amd64.whl
```
## 6. Corre el programa
```bash
python stt-windows.py
```