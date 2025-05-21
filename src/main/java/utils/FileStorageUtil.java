package utils;

import models.*;

import java.io.*;
import java.util.ArrayList;
import java.util.List;

public class FileStorageUtil {

    private static final String USER_FILE = "./src/users.txt";
    private static final String CAKE_FILE = "./src/cakes.txt";
    private static final String ORDER_FILE = "./src/orders.txt";
    private static final String FEEDBACK_FILE = "./src/feedback.txt";
    private static final String FAQ_FILE = "./src/faqs.txt";

    static {
        try {
            new File(USER_FILE).createNewFile();
            new File(CAKE_FILE).createNewFile();
            new File(ORDER_FILE).createNewFile();
            new File(FEEDBACK_FILE).createNewFile();
        } catch (IOException e) {
            System.err.println("Error creating initial files: " + e.getMessage());
        }
    }

    // -------------------- USER FUNCTIONS --------------------

    public static boolean userExists(String email) {
        return getUserByEmail(email) != null;
    }

    public static void saveUser(User user) {
        if (!userExists(user.getEmail())) {
            List<User> users = readUsersFromFile();
            users.add(user);
            writeUsersToFile(users);
        }
    }
    public static List<Order> getPaidOrders() {
        List<Order> allOrders = readOrdersFromFile();
        List<Order> paidOrders = new ArrayList<>();
        for (Order order : allOrders) {
            if (order.isPaid()) {
                paidOrders.add(order);
            }
        }
        return paidOrders;
    }


    public static void updateUserRole(String email, String newRole) {
        List<User> users = readUsersFromFile();
        boolean updated = false;

        for (int i = 0; i < users.size(); i++) {
            User user = users.get(i);
            if (user.getEmail().equals(email)) {
                user.setRole(newRole);
                users.set(i, user); // update the user in the list
                updated = true;
                break;
            }
        }

        if (updated) {
            System.out.println("User found for role update: " + email);
            writeUsersToFile(users);
        } else {
            System.err.println("User not found for role update: " + email);
        }
    }



    public static void addFAQ(String question, String answer) {
        try (BufferedWriter writer = new BufferedWriter(new FileWriter(FAQ_FILE, true))) {
            writer.write(question + "::" + answer);
            writer.newLine();
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    public static List<FAQ> getAllFAQs() {
        List<FAQ> faqs = new ArrayList<>();
        try (BufferedReader reader = new BufferedReader(new FileReader(FAQ_FILE))) {
            String line;
            while ((line = reader.readLine()) != null) {
                String[] parts = line.split("::");
                if (parts.length == 2) {
                    faqs.add(new FAQ(parts[0], parts[1]));
                }
            }
        } catch (IOException e) {
            e.printStackTrace();
        }
        return faqs;
    }
    public static void writeOrdersToFile(List<Order> orders) {
        try (BufferedWriter bw = new BufferedWriter(new FileWriter(ORDER_FILE))) {
            for (Order order : orders) {
                StringBuilder sb = new StringBuilder();
                sb.append(order.getOrderId()).append("|")
                        .append(order.getEmail()).append("|")
                        .append(order.getName()).append("|")
                        .append(order.getAddress()).append("|")
                        .append(order.getPhoneNumber()).append("|")           // <-- add phoneNumber
                        .append(order.getPaymentMethod()).append("|")
                        .append(order.getStatus()).append("|")
                        .append(order.getTotalAmount()).append("|")
                        .append(order.isPaid()).append("|");                  // <-- add isPaid

                for (OrderItem item : order.getItems()) {
                    sb.append(item.getCakeName()).append(":")
                            .append(item.getPrice()).append(":")
                            .append(item.getQuantity()).append(";");
                }

                bw.write(sb.toString());
                bw.newLine();
            }
        } catch (IOException e) {
            System.err.println("Error writing orders: " + e.getMessage());
        }
    }



    public static List<User> readUsersFromFile() {
        List<User> users = new ArrayList<>();
        try (BufferedReader br = new BufferedReader(new FileReader(USER_FILE))) {
            String line;
            while ((line = br.readLine()) != null) {
                String[] data = line.split(",");
                if (data.length == 3) {
                    users.add(new User(data[0], data[1], data[2]));
                }
            }
        } catch (IOException e) {
            System.err.println("Error reading users: " + e.getMessage());
        }
        return users;
    }

    private static void writeUsersToFile(List<User> users) {
        try (BufferedWriter bw = new BufferedWriter(new FileWriter(USER_FILE))) {
            for (User user : users) {
                bw.write(user.getEmail() + "," + user.getPassword() + "," + user.getRole());
                bw.newLine();
            }
        } catch (IOException e) {
            System.err.println("Error writing users: " + e.getMessage());
        }
    }

    public static void saveFeedback(Feedback feedback) {
        try (BufferedWriter bw = new BufferedWriter(new FileWriter(FEEDBACK_FILE, true))) {
            bw.write(feedback.getName() + "|" + feedback.getMessage());
            bw.newLine();
        } catch (IOException e) {
            System.err.println("Error writing feedback: " + e.getMessage());
        }
    }

    // Read all feedback entries
    public static List<Feedback> readFeedbacks() {
        List<Feedback> feedbackList = new ArrayList<>();
        try (BufferedReader br = new BufferedReader(new FileReader(FEEDBACK_FILE))) {
            String line;
            while ((line = br.readLine()) != null) {
                String[] parts = line.split("\\|");
                if (parts.length == 2) {
                    feedbackList.add(new Feedback(parts[0], parts[1]));
                }
            }
        } catch (IOException e) {
            System.err.println("Error reading feedback: " + e.getMessage());
        }
        return feedbackList;
    }

    public static User getUserByEmail(String email) {
        return readUsersFromFile().stream()
                .filter(user -> user.getEmail().equals(email))
                .findFirst()
                .orElse(null);
    }

    public static List<User> getAllUsers() {
        return readUsersFromFile();
    }

    public static void deleteUserByEmail(String email) {
        List<User> users = readUsersFromFile();
        users.removeIf(user -> user.getEmail().equals(email));
        writeUsersToFile(users);
    }

    public static void updateUser(User updatedUser) {
        List<User> users = readUsersFromFile();
        for (int i = 0; i < users.size(); i++) {
            if (users.get(i).getEmail().equals(updatedUser.getEmail())) {
                users.set(i, updatedUser);
                break;
            }
        }
        writeUsersToFile(users);
    }

    // -------------------- CAKE FUNCTIONS --------------------

    public static boolean cakeExists(String cakeId) {
        return getCakeById(cakeId) != null;
    }

    public static void saveCake(Cake cake) {
        if (!cakeExists(cake.getId())) {
            List<Cake> cakes = readCakesFromFile();
            cakes.add(cake);
            writeCakesToFile(cakes);
        }
    }

    public static List<Cake> readCakesFromFile() {
        List<Cake> cakes = new ArrayList<>();
        try (BufferedReader br = new BufferedReader(new FileReader(CAKE_FILE))) {
            String line;
            while ((line = br.readLine()) != null) {
                String[] data = line.split(",");
                if (data.length == 6) {
                    cakes.add(new Cake(
                            data[0], data[1], data[2], data[3], data[4],
                            Double.parseDouble(data[5])
                    ));
                }
            }
        } catch (IOException e) {
            System.err.println("Error reading cakes: " + e.getMessage());
        }
        return cakes;
    }

    private static void writeCakesToFile(List<Cake> cakes) {
        try (BufferedWriter bw = new BufferedWriter(new FileWriter(CAKE_FILE))) {
            for (Cake cake : cakes) {
                bw.write(cake.getId() + "," + cake.getName() + "," + cake.getFlavor() + "," +
                        cake.getSize() + "," + cake.getImageUrl() + "," + cake.getPrice());
                bw.newLine();
            }
        } catch (IOException e) {
            System.err.println("Error writing cakes: " + e.getMessage());
        }
    }

    public static Cake getCakeById(String cakeId) {
        return readCakesFromFile().stream()
                .filter(c -> c.getId().equals(cakeId))
                .findFirst()
                .orElse(null);
    }

    public static List<Cake> getAllCakes() {
        return readCakesFromFile();
    }

    public static void deleteCakeById(String cakeId) {
        List<Cake> cakes = readCakesFromFile();
        cakes.removeIf(cake -> cake.getId().equals(cakeId));
        writeCakesToFile(cakes);
    }

    public static void updateCake(Cake updatedCake) {
        List<Cake> cakes = readCakesFromFile();
        for (int i = 0; i < cakes.size(); i++) {
            if (cakes.get(i).getId().equals(updatedCake.getId())) {
                cakes.set(i, updatedCake);
                break;
            }
        }
        writeCakesToFile(cakes);
    }

    // -------------------- ORDER FUNCTIONS --------------------

    public static void saveOrder(Order order) {
        try (BufferedWriter bw = new BufferedWriter(new FileWriter(ORDER_FILE, true))) {
            StringBuilder sb = new StringBuilder();
            sb.append(order.getOrderId()).append("|")
                    .append(order.getEmail()).append("|")
                    .append(order.getName()).append("|")
                    .append(order.getAddress()).append("|")
                    .append(order.getPhoneNumber()).append("|")  // <-- NEW
                    .append(order.getPaymentMethod()).append("|")
                    .append(order.getStatus()).append("|")
                    .append(order.getTotalAmount()).append("|")
                    .append(order.isPaid()).append("|");         // <-- NEW

            for (OrderItem item : order.getItems()) {
                sb.append(item.getCakeName()).append(":")
                        .append(item.getPrice()).append(":")
                        .append(item.getQuantity()).append(";");
            }

            bw.write(sb.toString());
            bw.newLine();
        } catch (IOException e) {
            System.err.println("Error writing order: " + e.getMessage());
        }
    }
    public static double getTotalPaidAmount() {
        List<Order> paidOrders = getPaidOrders();
        double total = 0.0;
        for (Order order : paidOrders) {
            total += order.getTotalAmount();
        }
        return total;
    }


    public static List<Order> readOrdersFromFile() {
        List<Order> orders = new ArrayList<>();
        try (BufferedReader br = new BufferedReader(new FileReader(ORDER_FILE))) {
            String line;
            while ((line = br.readLine()) != null) {
                String[] parts = line.split("\\|");
                if (parts.length >= 9) {  // <-- updated to 9 fields
                    Order order = new Order();
                    order.setOrderId(parts[0]);
                    order.setEmail(parts[1]);
                    order.setName(parts[2]);
                    order.setAddress(parts[3]);
                    order.setPhoneNumber(parts[4]);                       // <-- NEW
                    order.setPaymentMethod(parts[5]);
                    order.setStatus(parts[6]);
                    order.setTotalAmount(Double.parseDouble(parts[7]));
                    order.setPaid(Boolean.parseBoolean(parts[8]));       // <-- NEW

                    List<OrderItem> items = new ArrayList<>();
                    if (parts.length > 9) {
                        String[] itemStrs = parts[9].split(";");
                        for (String itemStr : itemStrs) {
                            if (!itemStr.trim().isEmpty()) {
                                String[] itemParts = itemStr.split(":");
                                if (itemParts.length == 3) {
                                    OrderItem item = new OrderItem();
                                    item.setCakeName(itemParts[0]);
                                    item.setPrice(Double.parseDouble(itemParts[1]));
                                    item.setQuantity(Integer.parseInt(itemParts[2]));
                                    items.add(item);
                                }
                            }
                        }
                    }

                    order.setItems(items);
                    orders.add(order);
                }
            }
        } catch (IOException e) {
            System.err.println("Error reading orders: " + e.getMessage());
        }
        return orders;
    }
}

