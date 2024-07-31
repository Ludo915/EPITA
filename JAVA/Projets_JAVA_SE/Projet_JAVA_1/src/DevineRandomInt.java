import java.util.Random;
import java.util.Scanner;

public class DevineRandomInt {
    public static void main(String[] args) {
        // Création d'un objet Random pour générer un nombre aléatoire
        Random random = new Random();
        
        // Génération d'un nombre aléatoire entre 1 et 100
        int nombreADeviner = random.nextInt(100) + 1;
        
        // Création d'un objet Scanner pour lire l'entrée de l'utilisateur
        Scanner scanner = new Scanner(System.in);
        
        // Variable pour stocker le nombre deviné par l'utilisateur
        int nombreDevine;
        
        // Boucle pour permettre à l'utilisateur de deviner le nombre
        do {
            // Demander à l'utilisateur de deviner le nombre
            System.out.print("Devinez le nombre entre 1 et 100 : ");
            nombreDevine = scanner.nextInt();
            
            // Vérifier si le nombre deviné est plus petit, plus grand ou égal au nombre à deviner
            if (nombreDevine < nombreADeviner) {
                System.out.println("Le nombre à deviner est plus grand.");
            } else if (nombreDevine > nombreADeviner) {
                System.out.println("Le nombre à deviner est plus petit.");
            } else {
                System.out.println("Félicitations, vous avez deviné le bon nombre !");
            }
        } while (nombreDevine != nombreADeviner);
        
        // Fermeture du scanner
        scanner.close();
    }
}

