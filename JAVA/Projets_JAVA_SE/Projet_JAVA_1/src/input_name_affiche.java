import java.util.Scanner;

public class input_name_affiche {
	
    public static void main(String[] args) {
        // Création d'un objet Scanner pour lire l'entrée de l'utilisateur
        Scanner scanner = new Scanner(System.in);
        
        // Demander à l'utilisateur d'entrer son nom
        System.out.print("Entrez votre nom : ");
        String nomUtilisateur = scanner.nextLine();
        
        // Demander à l'utilisateur d'entrer le premier entier
        System.out.print("Entrez le premier entier : ");
        int premierEntier = scanner.nextInt();
        
        // Demander à l'utilisateur d'entrer le deuxième entier
        System.out.print("Entrez le deuxième entier : ");
        int deuxiemeEntier = scanner.nextInt();
        
        // Calculer la somme des deux entiers
        int somme = premierEntier + deuxiemeEntier;
        
        // Afficher le nom de l'utilisateur suivi de la somme des deux entiers
        System.out.println("Bonjour, " + nomUtilisateur + "! " + premierEntier + " + " + deuxiemeEntier + " = " + somme);
        
        // Fermer le scanner
        scanner.close();
    }
}

