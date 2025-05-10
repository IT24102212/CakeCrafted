public class CakeOrder {
    public String orderId;
    public String email;
    public String cakeName;
    public int quantity;
    public String date;
    public String status;

    public CakeOrder(String orderId, String email, String cakeName, int quantity, String date, String status) {
        this.orderId = orderId;
        this.email = email;
        this.cakeName = cakeName;
        this.quantity = quantity;
        this.date = date;
        this.status = status;
    }

    @Override
    public String toString() {
        return orderId + "," + email + "," + cakeName + "," + quantity + "," + date + "," + status;
    }
}
