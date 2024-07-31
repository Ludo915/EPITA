import java.util.*;

public class PointTreeSet {
    public static void main(String[] args) {
        TreeSet<Point> points = new TreeSet<>();

        points.add(new Point(3, 4));
        points.add(new Point(1, 2));
        points.add(new Point(5, 6));
        points.add(new Point(3, 4)); 

        System.out.println("Points stockés dans le TreeSet : ");
        for (Point point : points) {
            System.out.println(point);
        }
    }
}