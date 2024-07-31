class Produit {
    private String libelle;
    private double prix;

    public Produit(String libelle, double prix) throws PrixInvalideException {
        if (prix <= 0) {
            throw new PrixInvalideException("Le prix doit être strictement positif.");
        }
        this.libelle = libelle;
        this.prix = prix;
    }

    public String getLibelle() {
        return libelle;
    }

    public double getPrix() {
        return prix;
    }
}
