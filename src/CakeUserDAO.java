import java.io.*;

public class CakeUserDAO {
    private static final String FILE = "users.txt";

    public static boolean register(CakeUser user) throws IOException {
        if (emailExists(user.email)) return false;
        try (BufferedWriter writer = new BufferedWriter(new FileWriter(FILE, true))) {
            writer.write(user.toString());
            writer.newLine();
            return true;
        }
    }

    public static String login(String email, String password) throws IOException {
        try (BufferedReader reader = new BufferedReader(new FileReader(FILE))) {
            String line;
            while ((line = reader.readLine()) != null) {
                String[] parts = line.split(",");
                if (parts[1].equals(email) && parts[2].equals(password)) {
                    return parts[3]; // return role
                }
            }
        }
        return null;
    }

    public static boolean emailExists(String email) throws IOException {
        try (BufferedReader reader = new BufferedReader(new FileReader(FILE))) {
            String line;
            while ((line = reader.readLine()) != null) {
                if (line.split(",")[1].equals(email)) return true;
            }
        }
        return false;
    }

    public static boolean updateUser(String email, String newName, String newPassword) throws IOException {
        File file = new File(FILE);
        File temp = new File("temp_users.txt");
        BufferedReader reader = new BufferedReader(new FileReader(file));
        BufferedWriter writer = new BufferedWriter(new FileWriter(temp));

        String line;
        boolean updated = false;

        while ((line = reader.readLine()) != null) {
            String[] parts = line.split(",");
            if (parts[1].equals(email)) {
                if (!newName.isEmpty()) parts[0] = newName;
                if (!newPassword.isEmpty()) parts[2] = newPassword;
                updated = true;
            }
            writer.write(String.join(",", parts));
            writer.newLine();
        }

        reader.close();
        writer.close();
        file.delete();
        temp.renameTo(file);
        return updated;
    }
}
