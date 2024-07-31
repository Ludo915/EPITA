import java.util.HashMap;

public class AccountManager {
    private HashMap<String, String> accountMap;

    public AccountManager() {
        accountMap = new HashMap<>();
    }

    public void addAccount(String username, String password) {
        accountMap.put(username, password);
    }

    public boolean isValidAccount(String username, String password) {
        String storedPassword = accountMap.get(username);
        return storedPassword != null && storedPassword.equals(password);
    }

    public static void main(String[] args) {
        AccountManager manager = new AccountManager();
        manager.addAccount("user1", "password1");
        manager.addAccount("user2", "password2");
        manager.addAccount("user3", "password3");
        manager.addAccount("user4", "password4");
        manager.addAccount("user5", "password5");
        manager.addAccount("user2", "password6"); 
        System.out.println("Contenu du HashMap : ");
        for (String username : manager.accountMap.keySet()) {
            String password = manager.accountMap.get(username);
            System.out.println("Nom de compte : " + username + ", Mot de passe : " + password);
        }
        System.out.println("\nVérification de la validité des comptes : ");
        System.out.println("Compte 1 (user1, password1) : " + manager.isValidAccount("user1", "password1"));
        System.out.println("Compte 2 (user2, password2) : " + manager.isValidAccount("user2", "password2"));
        System.out.println("Compte 3 (user6, password6) : " + manager.isValidAccount("user6", "password6")); 
    }
}
