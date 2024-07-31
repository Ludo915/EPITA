import subprocess
import os

def run_command(command):
    try:
        output = subprocess.check_output(command, shell=True, stderr=subprocess.STDOUT, universal_newlines=True)
        print(output)
    except subprocess.CalledProcessError as e:
        print(f"Erreur : {e.output}")

def main():
    while True:
        current_directory = os.getcwd()
        print(f"Répertoire courant : {current_directory}")
        user_input = input("Entrez une commande (ou 'exit' pour quitter) : ")

        if user_input.lower() == 'exit':
            print("Au revoir !")
            break
        elif user_input.startswith('cd '):
            new_directory = user_input[3:]
            try:
                os.chdir(new_directory)
            except FileNotFoundError:
                print(f"Répertoire invalide : {new_directory}")
        else:
            run_command(user_input)

if __name__ == "__main__":
    main()
