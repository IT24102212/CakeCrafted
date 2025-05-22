package models;

public class Cake {
    private String id;
    private String name;
    private String flavor;   // Flavor of the cake
    private String size;     // Size of the cake (e.g., small, medium, large)
    private String imageUrl; // Image URL for the cake
    private double price;    // Price of the cake

    // Constructor
    public Cake(String id, String name, String flavor, String size, String imageUrl, double price) {
        this.id = id;
        this.name = name;
        this.flavor = flavor;
        this.size = size;
        this.imageUrl = imageUrl;
        this.price = price;
    }

    // fromString method to create a Cake object from a comma-separated string
    public static Cake fromString(String cakeString) {
        String[] parts = cakeString.split(",");
        return new Cake(parts[0], parts[1], parts[2], parts[3], parts[4], Double.parseDouble(parts[5]));
    }

    // toString method to convert Cake object to a comma-separated string
    @Override
    public String toString() {
        return id + "," + name + "," + flavor + "," + size + "," + imageUrl + "," + price;
    }

    // Getters and Setters
    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getFlavor() {
        return flavor;
    }

    public void setFlavor(String flavor) {
        this.flavor = flavor;
    }

    public String getSize() {
        return size;
    }

    public void setSize(String size) {
        this.size = size;
    }

    public String getImageUrl() {
        return imageUrl;
    }

    public void setImageUrl(String imageUrl) {
        this.imageUrl = imageUrl;
    }

    public double getPrice() {
        return price;
    }

    public void setPrice(double price) {
        this.price = price;
    }
}
