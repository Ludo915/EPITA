public class MoisObject {
    public static void main(String[] args) {
        for (Mois mois : Mois.values()) {
            System.out.printf("Mois %d: %s (%s) - %d jours%n",
                              mois.ordinal() + 1,
                              mois.getNomFrancais(),
                              mois.getNomAnglais(),
                              mois.getNombreJours());
        }
    }
}
