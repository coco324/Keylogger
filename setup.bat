@echo off
REM Télécharger le programme d'installation de Python
echo Téléchargement de Python...
curl -O https://www.python.org/ftp/python/3.10.9/python-3.10.9-amd64.exe

REM Télécharger le programme d'installation de Git
echo Téléchargement de Git...
curl -O https://github.com/git-for-windows/git/releases/download/v2.41.0.windows.1/Git-2.41.0-64-bit.exe

REM Installer Python en mode silencieux
echo Installation de Python...
start /wait python-3.10.9-amd64.exe /quiet InstallAllUsers=1 PrependPath=1

REM Installer Git en mode silencieux
echo Installation de Git...
start /wait Git-2.41.0-64-bit.exe /VERYSILENT /NORESTART

REM Configurer les variables d'environnement pour Python
echo Configuration des variables d'environnement pour Python...
setx PATH "%PATH%;C:\Python310;C:\Python310\Scripts"

REM Configurer les variables d'environnement pour Git
echo Configuration des variables d'environnement pour Git...
setx PATH "%PATH%;C:\Program Files\Git\bin;C:\Program Files\Git\cmd"

REM Vérifier l'installation de Python
echo Vérification de l'installation de Python...
python --version
if errorlevel 1 (
    echo Python n'a pas été installé correctement.
) else (
    echo Python a été installé avec succès !
)

REM Vérifier l'installation de Git
echo Vérification de l'installation de Git...
git --version
if errorlevel 1 (
    echo Git n'a pas été installé correctement.
) else (
    echo Git a été installé avec succès !
)

REM Appeler le script Bash pour exécuter main.py
echo Lancement de main.py en arrière-plan...
bash -c "nohup python main.py > /dev/null 2>&1 &"

pause
