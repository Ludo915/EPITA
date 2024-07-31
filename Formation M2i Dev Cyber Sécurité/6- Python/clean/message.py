import os

bufsize=1024
id_size=1
dest_size=32
length_size=8
filename_size=64

def padding(s, n):
    # La chaîne s est convertie en bytes de taille n
    s_bytes = s.encode('utf-8')
    # Vérifier que la taille de la chaîne est inférieure à n
    assert n >= len(s_bytes)
    # Calculer le nombre d'octets de padding nécessaires
    padding_length = n - len(s_bytes)
    # Ajouter les octets de padding à la chaîne
    s_bytes += b' ' * padding_length
    return s_bytes

def create_unique_file(filename):
    if not os.path.exists(filename):
        return filename
    base, ext = os.path.splitext(filename)
    count = 1
    while True:
        new_filename = f"{base}_{count}{ext}"
        if not os.path.exists(new_filename):
            return new_filename
        count += 1

def send_text(dest, text, socket):
    bytes = text.encode('utf-8')
    length = padding(hex(len(bytes))[2:], length_size)
    dest = padding(dest, dest_size)
    data = b"0" + dest + length + bytes
    return socket.sendall(data)


def send_file(dest, path, socket):
    if os.path.exists(path):
        length = padding(hex(os.path.getsize(path))[2:], length_size)
        dest = padding(dest, dest_size)
        fname = padding(os.path.basename(path), filename_size)
        message = b"1" + dest + length + fname

        with open(path, 'rb') as f:
            data = f.read(min(os.path.getsize(path), bufsize - len(message)))
            if not data: # Si le fichier est vide, on ne fait rien
                return
            socket.sendall(message + data)

            while True:
                data = f.read(bufsize)
                if not data:
                    break
                socket.sendall(data)


def receive_message(socket):
    try:
        while True:
            id = socket.recv(1).decode().strip()
            dest = socket.recv(dest_size).decode().strip()
            length = int(socket.recv(length_size).decode().strip(), 16)
            if id == "0": # Message
                while length > 0:
                    data = socket.recv(min(length, bufsize))
                    print(data.decode(), end="")
                    length -= len(data)
                print()
            else: # Fichier
                filename = socket.recv(filename_size).decode().strip()
                filename = create_unique_file(filename)
                with open(filename, 'wb') as f:
                    while length > 0:
                        data = socket.recv(min(length, bufsize))
                        if not data:
                            print("Erreur: Fichier incomplet ?")
                            break
                        f.write(data)
                        length -= len(data)
                print(f"Fichier {filename} reçu.")
    except Exception as e:
        print("Erreur :", e)
        socket.close()