import java.util.Scanner;

public class TVA_Remises {
    public static void main(String[] args) {
        // Déclaration du taux de TVA constant
        final double TAUX_TVA = 0.186;

        // Création d'un objet Scanner pour lire l'entrée de l'utilisateur
        Scanner scanner = new Scanner(System.in);
        
        // Demander à l'utilisateur d'entrer le prix hors taxes
        System.out.print("Entrez le prix hors taxes : ");
        double prixHorsTaxes = scanner.nextDouble();
        
        // Calcul du prix TTC
        double prixTTC = prixHorsTaxes * (1 + TAUX_TVA);
        
        // Calcul de la remise en fonction du prix TTC
        double remise = 0;
        if (prixTTC >= 1000 && prixTTC < 2000) {
            remise = 0.01;
        } else if (prixTTC >= 2000 && prixTTC < 5000) {
            remise = 0.03;
        } else if (prixTTC >= 5000) {
            remise = 0.05;
        }
        
        // Calcul du montant de la remise
        double montantRemise = prixTTC * remise;
        
        // Calcul du montant à payer après remise
        double montantFinal = prixTTC - montantRemise;
        
        // Affichage des résultats
        System.out.println("Prix TTC : " + prixTTC);
        System.out.println("Remise : " + (remise * 100) + "%");
        System.out.println("Montant de la remise : " + montantRemise);
        System.out.println("Montant à payer : " + montantFinal);
        
        // Fermeture du scanner
        scanner.close();
    }
}

