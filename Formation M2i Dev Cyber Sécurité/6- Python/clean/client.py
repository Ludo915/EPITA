import socket
import time
import threading
import os
from message import send_text, send_file, receive_message

s = socket.socket(socket.AF_INET, socket.SOCK_STREAM)
BSIZE = 1024
serveur_adresse = '127.0.0.1'
port = 32000

# Connexion au serveur
def connexion():
    while True:
        try:
            s.connect((serveur_adresse, port))
            print(f"Connexion établie avec le serveur {serveur_adresse}:{port}")
            break

        except ConnectionRefusedError:
            print("Connexion refusée. Le serveur n'est pas démarré. Nouvelle tentative dans 4 secondes...")
            time.sleep(4)
        except Exception as e:
            print("Erreur :", e)
            time.sleep(4)

def envoyer_message(socket, dest='serv'):
    while True:
        message = input("> ")
        if message == "":
            continue
        if os.path.exists(message):
            send_file(dest, message, socket)
        else:
            send_text(dest, message, socket)


def recevoir_message(s):
     while True:
        try:
            while True:
                message = s.recv(1024).decode()
                if not message:
                    break
                print(message)
        except Exception as e:
            print("Erreur :", e)
            s.close()
            break

connexion()
envoyer_thread = threading.Thread(target=envoyer_message, args=(s,))
envoyer_thread.start()
recevoir_thread = threading.Thread(target=recevoir_message, args=(s,))
recevoir_thread.start()

envoyer_thread.join()
recevoir_thread.join()