import java.sql.*;

public class CakeUserDAO {
    public static void createTable() {
        String sql = "CREATE TABLE IF NOT EXISTS users ("
                + "id INTEGER PRIMARY KEY AUTOINCREMENT,"
                + "name TEXT NOT NULL,"
                + "email TEXT UNIQUE,"
                + "password TEXT NOT NULL,"
                + "role TEXT NOT NULL)";
        try (Connection conn = CakeDBConnection.connect()) {
            assert conn != null;
            try (Statement stmt = conn.createStatement()) {
                stmt.execute(sql);
            }
        } catch (Exception e) {
            System.out.println("Table creation error: " + e.getMessage());
        }
    }

    public static boolean register(CakeUser user) {
        String sql = "INSERT INTO users(name, email, password, role) VALUES (?, ?, ?, ?)";
        try (Connection conn = CakeDBConnection.connect();
             PreparedStatement pstmt = conn.prepareStatement(sql)) {
            pstmt.setString(1, user.name);
            pstmt.setString(2, user.email);
            pstmt.setString(3, user.password);
            pstmt.setString(4, user.role);
            pstmt.executeUpdate();
            return true;
        } catch (SQLException e) {
            System.out.println("Register error: " + e.getMessage());
            return false;
        }
    }

    public static String login(String email, String password) {
        String sql = "SELECT role FROM users WHERE email = ? AND password = ?";
        try (Connection conn = CakeDBConnection.connect();
             PreparedStatement pstmt = conn.prepareStatement(sql)) {
            pstmt.setString(1, email);
            pstmt.setString(2, password);
            ResultSet rs = pstmt.executeQuery();
            if (rs.next()) {
                return rs.getString("role");
            } else {
                return null;
            }
        } catch (SQLException e) {
            System.out.println("Login error: " + e.getMessage());
            return null;
        }
    }
}
