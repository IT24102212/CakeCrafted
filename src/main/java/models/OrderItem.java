package models;

public class OrderItem {
    private String cakeName;
    private double price;
    private int quantity;

    public String getCakeName() {
        return cakeName;
    }

    public void setCakeName(String cakeName) {
        this.cakeName = cakeName;
    }

    public double getPrice() {
        return price;
    }

    public void setPrice(double price) {
        this.price = price;
    }

    public int getQuantity() {
        return quantity;
    }

    public void setQuantity(int quantity) {
        this.quantity = quantity;
    }

    // Set cake details into this OrderItem
    public void setCake(Cake cake) {
        if (cake != null) {
            this.cakeName = cake.getName();
            this.price = cake.getPrice();
        }
    }
}
