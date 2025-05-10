public class CakeUser {
    public String name, email, password, role;

    public CakeUser(String name, String email, String password, String role) {
        this.name = name;
        this.email = email;
        this.password = password;
        this.role = role;
    }

    @Override
    public String toString() {
        return name + "," + email + "," + password + "," + role;
    }
}
