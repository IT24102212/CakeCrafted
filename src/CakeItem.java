public class CakeItem {
    public String id;
    public String name;
    public String category;
    public double price;

    public CakeItem(String id, String name, String category, double price) {
        this.id = id;
        this.name = name;
        this.category = category;
        this.price = price;
    }

    @Override
    public String toString() {
        return id + "," + name + "," + category + "," + price;
    }
}
