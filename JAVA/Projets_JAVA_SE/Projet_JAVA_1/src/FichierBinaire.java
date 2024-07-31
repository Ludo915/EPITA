import java.io.*;

public class FichierBinaire {

    public static void main(String[] args) {
        String chaine = "Hello Ramzi";
        int entier = 42;
        double reel = 3.14;
        char caractere = 'A';
        boolean bool = true;
        
        String nomFichier = "donnees.txt";
        
        try (DataOutputStream out = new DataOutputStream(new FileOutputStream(nomFichier))) {
            out.writeUTF(chaine);
            out.writeInt(entier);
            out.writeDouble(reel);
            out.writeChar(caractere);
            out.writeBoolean(bool);
            System.out.println("Données écrites dans le fichier binaire avec succès.");
        } catch (IOException e) {
            System.err.println("Erreur lors de l'écriture dans le fichier : " + e.getMessage());
        }
        
        try (DataInputStream in = new DataInputStream(new FileInputStream(nomFichier))) {
            String chaineLue = in.readUTF();
            int entierLue = in.readInt();
            double reelLue = in.readDouble();
            char caractereLue = in.readChar();
            boolean boolLue = in.readBoolean();
            
            System.out.println("Chaine: " + chaineLue);
            System.out.println("Entier: " + entierLue);
            System.out.println("Réel: " + reelLue);
            System.out.println("Caractère: " + caractereLue);
            System.out.println("Booléen: " + boolLue);
        } catch (IOException e) {
            System.err.println("Erreur lors de la lecture du fichier : " + e.getMessage());
        }
    }
}