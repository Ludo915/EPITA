public class TestTriplet {
    public static void main(String[] args) {
        Triplet<Integer> triplet = new Triplet<>(1, 2, 3);
        
        System.out.println("Premier élément: " + triplet.getPremier());
        System.out.println("Deuxième élément: " + triplet.getSecond());
        System.out.println("Troisième élément: " + triplet.getTroisieme());
        
        System.out.println("Triplet: " + triplet);
    }
}
