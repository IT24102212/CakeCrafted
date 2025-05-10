import java.io.*;
import java.util.*;

public class CakeOrderDAO {
    private static final String FILE = "orders.txt";

    public static boolean saveOrder(String rawData) throws IOException {
        try (BufferedWriter writer = new BufferedWriter(new FileWriter(FILE, true))) {
            writer.write(rawData);
            writer.newLine();
            return true;
        }
    }

    public static List<String> getAllOrders() throws IOException {
        List<String> list = new ArrayList<>();
        try (BufferedReader reader = new BufferedReader(new FileReader(FILE))) {
            String line;
            while ((line = reader.readLine()) != null) {
                list.add(line);
            }
        }
        return list;
    }
}
