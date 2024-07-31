public enum Mois {
    JANVIER("janvier", "January", 31),
    FEVRIER("février", "February", 28),
    MARS("mars", "March", 31),
    AVRIL("avril", "April", 30),
    MAI("mai", "May", 31),
    JUIN("juin", "June", 30),
    JUILLET("juillet", "July", 31),
    AOUT("août", "August", 31),
    SEPTEMBRE("septembre", "September", 30),
    OCTOBRE("octobre", "October", 31),
    NOVEMBRE("novembre", "November", 30),
    DECEMBRE("décembre", "December", 31);

    private final String nomFrancais;
    private final String nomAnglais;
    private final int nombreJours;

    Mois(String nomFrancais, String nomAnglais, int nombreJours) {
        this.nomFrancais = nomFrancais;
        this.nomAnglais = nomAnglais;
        this.nombreJours = nombreJours;
    }

    public String getNomFrancais() {
        return nomFrancais;
    }

    public String getNomAnglais() {
        return nomAnglais;
    }

    public int getNombreJours() {
        return nombreJours;
    }
}