import socket
import threading
from message import send_text, send_file, receive_message
import os

adresse = '127.0.0.1'
port = 32000
BSIZE = 1024
max_clients = 10

# Création du socket serveur
serv_socket = socket.socket(socket.AF_INET, socket.SOCK_STREAM)
serv_socket.bind((adresse, port))
serv_socket.listen(max_clients)

print("Serveur démarré. En attente de connexions...")

def envoyer_message(s):
    while True:
        message = input()
        if message == "":
            continue
        elif message[-4:] == '.txt':
            try:
                with open(message, 'rb') as f:
                    data = f.read(BSIZE)
                    if not data:
                        break
                    s.sendall(data)

            except FileNotFoundError:
                print("Fichier non trouvé.")
                continue

        # message = f">{dest} {message}"
        s.sendall(message.encode())

# def recevoir_message(s):
#      while True:
#         try:
#             while True:
#                 message = s.recv(1024).decode()
#                 print(message)
#                 if not message:
#                     break
#         except Exception as e:
#             print("Erreur :", e)
#             s.close()
#             break

def recevoir_message(s):
    while True:
        receive_message(s)

# Gestion des clients
def handle_client(client_socket):
    envoyer_thread = threading.Thread(target=envoyer_message, args=(client_socket,))
    envoyer_thread.start()
    recevoir_thread = threading.Thread(target=recevoir_message, args=(client_socket,))
    recevoir_thread.start()

    envoyer_thread.join()
    recevoir_thread.join()

def main():
    while True:
        client_socket, client_address = serv_socket.accept()
        print(f"Connexion établie avec {client_address}")
        try:
            thread = threading.Thread(target=handle_client, args=(client_socket,))
            thread.start()
        except Exception as e:
            pass
if __name__ == "__main__":
    main()