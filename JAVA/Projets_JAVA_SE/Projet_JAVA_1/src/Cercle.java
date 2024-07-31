// Classe Cercle implémentant l'interface Mesurable
public class Cercle implements Mesurable {
    private double rayon; // La mesure du cercle correspond à son rayon en cm
    
    public Cercle(double rayon) {
        this.rayon = rayon;
    }
    
    @Override
    public double getMesure() {
        return rayon;
    }
}

