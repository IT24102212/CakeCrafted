import java.io.*;
import java.util.*;

public class CakeItemDAO {
    private static final String FILE = "cakes.txt";

    public static void addCake(CakeItem item) throws IOException {
        try (BufferedWriter writer = new BufferedWriter(new FileWriter(FILE, true))) {
            writer.write(item.toString());
            writer.newLine();
        }
    }

    public static List<String> getAllCakes() throws IOException {
        List<String> cakes = new ArrayList<>();
        try (BufferedReader reader = new BufferedReader(new FileReader(FILE))) {
            String line;
            while ((line = reader.readLine()) != null) {
                cakes.add(line);
            }
        }
        return cakes;
    }
}
