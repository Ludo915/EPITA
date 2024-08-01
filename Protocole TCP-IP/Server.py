import socket
import threading
import os

class ChatServer:

    def __init__ (self):
        self.serveur_socket = socket.socket()
        self.adresse = '127.0.0.1'  
        self.port = 12345   
        self.MAX_DATA_SIZE = 1024    
        self.contents = None
        self.path = 'C:\\Users\\ludov\\Python11042024\\NameEnvironnement\\Server'
        self.dest = 'C:\\Users\\ludov\\Python11042024\\NameEnvironnement\\Client' 
        self.msgctr = 0
        self.bufsize=2024
        self.id_size=1
        self.dest_size=1024
        self.length_size=8
        self.filename_size=64
        

    def handle_client(self, client_socket):
            #global client_socket
            envoyer_thread = threading.Thread(target=self.envoyer_message, args=(client_socket, self.dest,))
            envoyer_thread.start()
            recevoir_thread = threading.Thread(target = self.recevoir_message, args=(client_socket,))
            recevoir_thread.start()
            envoyer_thread.join()
            recevoir_thread.join()
    
    def envoyer_message(self, socket, dest):
        while True:
            message = input("> ")
            if message == "":
                continue
            if os.path.exists(os.path.join(self.path, message)):
                self.send_file(dest, message, socket)
            else:
                self.send_text(dest, message, socket)
        

    def create_unique_file(self, filename):
        if not os.path.exists(filename):
            return filename
        base, ext = os.path.splitext(filename)
        count = 1
        while True:
            new_filename = f"{base}_{count}{ext}"
            if not os.path.exists(new_filename):
                return new_filename
            count += 1


    def padding(self, s, n):
        # La chaîne s est convertie en bytes de taille n
        s_bytes = s.encode('utf-8')
        # Vérifier que la taille de la chaîne est inférieure à n
        assert n >= len(s_bytes)
        # Calculer le nombre d'octets de padding nécessaires
        padding_length = n - len(s_bytes)
        # Ajouter les octets de padding à la chaîne
        s_bytes += b' ' * padding_length
        return s_bytes
    
    def send_text(self, dest, text, socket):
        bytes = text.encode('utf-8')
        length = self.padding(hex(len(bytes))[2:], self.length_size)
        dest = self.padding(dest, self.dest_size)
        data = b"0" + dest + length + bytes
        return socket.sendall(data)


    def send_file(self, dest, message, socket):
        path = os.path.join(self.path, message)
        if os.path.exists(path):
            length = self.padding(hex(os.path.getsize(path))[2:], self.length_size)
            dest = self.padding(dest, self.dest_size)
            fname = self.padding(os.path.basename(path), self.filename_size)
            message = b"1" + dest + length + fname

            with open(path, 'rb') as f:
                data = f.read(min(os.path.getsize(path), self.bufsize - len(message)))
                if not data: # Si le fichier est vide, on ne fait rien
                    
                    return
                socket.sendall(message + data)
                print("Fichier envoyé")
                while True:
                    data = f.read(self.bufsize)
                    if not data:
                        break
                    socket.sendall(data)

    
    def recevoir_message(self, socket):
        try:
            while True:
                id = socket.recv(1).decode().strip()
                print("Debug id:", id)
                dest = socket.recv(self.dest_size).decode().strip()
               
                print(dest)
                length = int(socket.recv(self.length_size).decode().strip(), 16)

                if id == "0": # Message
                    while length > 0:
                        data = socket.recv(min(length, self.bufsize))
                        print(data.decode(), end="")
                        length -= len(data)
                    print()
                else: # Fichier
                    print("IN HERE")
                    filename = socket.recv(self.filename_size).decode().strip()
                    filename = self.create_unique_file(filename)
                    with open(os.path.join('C:\\Users\\ludov\\Python11042024\\NameEnvironnement\\Client', filename), 'wb') as f:
                        while length > 0:
                            data = socket.recv(min(length, self.bufsize))
                            if not data:
                                print("Erreur: Fichier incomplet ?")
                                break
                            f.write(data)
                            length -= len(data)
                    print(f"Fichier {filename} reçu.")
        except Exception as e:
            print("ICI")
            print("Erreur :", e)
        socket.close()

    def main(self):
        self.serveur_socket.setsockopt(socket.SOL_SOCKET, socket.SO_REUSEADDR, 1)
        self.serveur_socket.bind((self.adresse, self.port))
        self.serveur_socket.listen()
        print("Le serveur est à l'écoute sur {}:{}...".format(self.adresse, self.port))
        client_socket, client_address = self.serveur_socket.accept()
        print("Connexion entrante de {}:{}".format(client_address[0], client_address[1]))
        message_bienvenue = "Bienvenue sur le serveur !"
        self.send_text(self.dest, message_bienvenue, client_socket)
        threading.Thread(target=self.handle_client, args=(client_socket,)).start()

if __name__ == "__main__":
    MonServerChat = ChatServer() 
    MonServerChat.main()
    
    
    
