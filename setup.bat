@echo off
REM Vérifier si Python est installé
python --version >nul 2>&1
if errorlevel 1 (
    echo Python n'est pas installé. Téléchargement et installation...
    curl -O https://www.python.org/ftp/python/3.10.9/python-3.10.9-amd64.exe
    echo Installation de Python...
    start /wait python-3.10.9-amd64.exe /quiet InstallAllUsers=1 PrependPath=1
    echo Configuration des variables d'environnement pour Python...
    setx PATH "%PATH%;C:\Python310;C:\Python310\Scripts"
) else (
    echo Python est déjà installé. Version: 
    python --version
)

REM Vérifier si Git est installé
git --version >nul 2>&1
if errorlevel 1 (
    echo Git n'est pas installé. Téléchargement et installation...
    curl -O https://github.com/git-for-windows/git/releases/download/v2.41.0.windows.1/Git-2.41.0-64-bit.exe
    echo Installation de Git...
    start /wait Git-2.41.0-64-bit.exe /VERYSILENT /NORESTART
    echo Configuration des variables d'environnement pour Git...
    setx PATH "%PATH%;C:\Program Files\Git\bin;C:\Program Files\Git\cmd"
) else (
    echo Git est déjà installé. Version:
    git --version
)

REM Vérifier et exécuter main.py si Python est installé
python --version >nul 2>&1
if not errorlevel 1 (
    echo Lancement de main.py en arrière-plan...
    bash -c "nohup python main.py > /dev/null 2>&1 &"
)

pause
