public class TestMesurable {
    public static void afficheMesurable(Mesurable objetMesurable) {
        System.out.println("Mesure : " + objetMesurable.getMesure() + " " + Mesurable.UNITE_DE_MESURE);
    }
    
    public static void main(String[] args) {
        Personne personne = new Personne(170);
        afficheMesurable(personne);
        Cercle cercle = new Cercle(5);
        afficheMesurable(cercle);
    }
}