import java.util.*;

class Point implements Comparable<Point> {
    private int x;
    private int y;

    public Point() {
        this.x = 0;
        this.y = 0;
    }

    public Point(int x, int y) {
        this.x = x;
        this.y = y;
    }

    public Point(int[] values) {
        if (values.length != 2) {
            throw new IllegalArgumentException("Deux valeurs sont attendues pour l'abscisse et l'ordonnée.");
        }
        this.x = values[0];
        this.y = values[1];
    }

    public Point(Point otherPoint) {
        this.x = otherPoint.x;
        this.y = otherPoint.y;
    }

    public void afficherCoordonnees() {
        System.out.println("Coordonnées du point : (" + this.x + ", " + this.y + ")");
    }

    @Override
    public int compareTo(Point otherPoint) {
        if (this.x != otherPoint.x) {
            return this.x - otherPoint.x;
        } else {
            return this.y - otherPoint.y;
        }
    }

    @Override
    public String toString() {
        return "(" + this.x + ", " + this.y + ")";
    }
}