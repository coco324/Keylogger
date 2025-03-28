@echo off
REM Télécharger le programme d'installation de Python
echo Téléchargement de Python...
curl -O https://www.python.org/ftp/python/3.10.9/python-3.10.9-amd64.exe

REM Installer Python en mode silencieux
echo Installation de Python...
start /wait python-3.10.9-amd64.exe /quiet InstallAllUsers=1 PrependPath=1

REM Configurer les variables d'environnement
echo Configuration des variables d'environnement...
setx PATH "%PATH%;C:\Python310;C:\Python310\Scripts"

REM Vérifier l'installation
echo Vérification de l'installation...
python --version
if errorlevel 1 (
    echo Python n'a pas été installé correctement.
) else (
    echo Python a été installé avec succès !
)

REM Appeler le script Bash pour exécuter main.py
echo Lancement de main.py en arrière-plan...
bash -c "nohup python main.py > /dev/null 2>&1 &"

pause
