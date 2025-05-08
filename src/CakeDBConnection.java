import java.sql.Connection;
import java.sql.DriverManager;

public class CakeDBConnection {
    public static Connection connect() {
        try {
            Class.forName("org.sqlite.JDBC");
            return DriverManager.getConnection("jdbc:sqlite:cake_users.db");
        } catch (Exception e) {
            System.out.println("Connection error: " + e.getMessage());
            return null;
        }
    }
}
