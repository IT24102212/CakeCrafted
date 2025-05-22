package models;

public class Feedback {
    private String name;
    private String message;

    public Feedback(String name, String message) {
        this.name = name;
        this.message = message;
    }

    public String getName() {
        return name;
    }

    public String getMessage() {
        return message;
    }
}
