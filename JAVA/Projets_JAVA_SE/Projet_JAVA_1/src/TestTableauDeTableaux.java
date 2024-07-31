public class TestTableauDeTableaux {
 
    public static void main(String[] args) {
        int t[][]={{1, 2, 3},{11, 12},{21, 22, 23, 24}};
        Util util = new Util();
        System.out.println ("====> t avant raz : ") ;
        util.affiche(t) ;
        util.raz(t) ;
        System.out.println ("====> t apres raz : ") ;
        util.affiche(t) ;
    }
 
}
 
class Util{
    
    void raz(int[][] t) {
        for (int i = 0; i < t.length; i++) {
            for (int j = 0; j < t[i].length; j++) {
                t[i][j] = 0;
            }
        }
    }
    
    void affiche(int[][] t) {
        for (int i = 0; i < t.length; i++) {
            for (int j = 0; j < t[i].length; j++) {
                System.out.print(t[i][j] + " ");
            }
            System.out.println();
        }
    }
    
}

