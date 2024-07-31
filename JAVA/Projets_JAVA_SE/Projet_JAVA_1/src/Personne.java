// Classe Personne implémentant l'interface Mesurable
public class Personne implements Mesurable {
    private double taille; // La mesure de la personne correspond à sa taille en cm
    
    public Personne(double taille) {
        this.taille = taille;
    }
    
    @Override
    public double getMesure() {
        return taille;
    }
}


