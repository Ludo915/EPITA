public class TestPoint {
    public static void main(String[] args) {
        Point point1 = new Point();
        point1.afficherCoordonnees(); 
    
        Point point2 = new Point(3, 5);
        point2.afficherCoordonnees(); 

        int[] valeurs = {7, 2};
        Point point3 = new Point(valeurs);
        point3.afficherCoordonnees(); 
        Point point4 = new Point(point2);
        point4.afficherCoordonnees(); 
    }
}