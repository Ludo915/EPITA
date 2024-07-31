import java.util.Arrays;
import java.util.Comparator;
import java.util.Scanner;

public class TestProduit {
    public static void main(String[] args) {
        Scanner scanner = new Scanner(System.in);
        Produit[] produits = new Produit[5];

        for (int i = 0; i < 5; i++) {
            System.out.println("Produit " + (i + 1) + ":");
            System.out.print("Libellé: ");
            String libelle = scanner.nextLine();
            double prix;
            while (true) {
                try {
                    System.out.print("Prix: ");
                    prix = Double.parseDouble(scanner.nextLine());
                    if (prix <= 0) {
                        throw new PrixInvalideException("Le prix doit être strictement positif.");
                    }
                    break;
                } catch (NumberFormatException e) {
                    System.out.println("Veuillez entrer un nombre valide.");
                } catch (PrixInvalideException e) {
                    System.out.println(e.getMessage());
                }
            }
            try {
                produits[i] = new Produit(libelle, prix);
            } catch (PrixInvalideException e) {
                System.out.println("Erreur lors de la création du produit: " + e.getMessage());
                i--;
            }
        }

        Arrays.sort(produits, Comparator.comparingDouble(Produit::getPrix));
        System.out.println("\nProduits triés par prix:");
        for (Produit produit : produits) {
            System.out.println(produit.getLibelle() + " - " + produit.getPrix() + "€");
        }
    }
}