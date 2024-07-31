public class PointColore {
    private int x;
    private int y;
    private String couleur;

    public PointColore(int x, int y, String couleur) {
        this.x = x;
        this.y = y;
        this.couleur = couleur;
    }

    @Override
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;

        PointColore that = (PointColore) o;

        if (x != that.x) return false;
        if (y != that.y) return false;
        return couleur.equals(that.couleur);
    }

}

