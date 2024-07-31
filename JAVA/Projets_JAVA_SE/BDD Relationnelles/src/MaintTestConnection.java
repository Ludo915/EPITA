import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

public class MaintTestConnection {
	
	private static final String URL = "jdbc:mysql://localhost:3306/livres?serverTimezone=UTC";
	private static final String LOGIN = "root";
	private static final String PSW = "Australia10!";
	
	public static void main(String[] args) {
		// Créer une connexion
			try {
				Connection connexion = DriverManager.getConnection(URL, LOGIN, PSW);
				System.out.println("Je suis connecté à ma base de données :-D");
				
				//Utiliser la connexoin pour exécuter des ordres SQL
				Statement requete = connexion.createStatement();
				ResultSet titresDeLivres = requete.executeQuery("SELECT titre FROM livre");
				while(titresDeLivres.next()) {
					System.out.println(titresDeLivres.getString("titre"));
				}
				
			} catch (SQLException e) {
				e.printStackTrace();
			}		
	}
}