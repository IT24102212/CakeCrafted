import com.sun.net.httpserver.HttpServer;
import com.sun.net.httpserver.HttpHandler;
import com.sun.net.httpserver.HttpExchange;

import java.io.*;
import java.net.InetSocketAddress;
import java.nio.file.Files;
import java.nio.file.Paths;

public class CakeCraftedServer {
    public static void main(String[] args) throws IOException {
        HttpServer server = HttpServer.create(new InetSocketAddress(8080), 0);

        // API endpoints
        server.createContext("/register", new RegisterHandler());
        server.createContext("/login", new LoginHandler());

        // Static file server for HTML
        server.createContext("/", new StaticFileHandler());

        server.setExecutor(null);
        server.start();
        System.out.println("CakeCrafted server running at http://localhost:8080");
    }

    static class RegisterHandler implements HttpHandler {
        public void handle(HttpExchange exchange) throws IOException {
            String[] parts = exchange.getRequestURI().getQuery().split("&");
            String name = parts[0].split("=")[1];
            String email = parts[1].split("=")[1];
            String password = parts[2].split("=")[1];
            String role = parts[3].split("=")[1];

            // Fake registration result for now
            boolean success = true; // pretend it's saved in DB
            String response = success ? "Registered successfully!" : "Email already exists!";
            exchange.sendResponseHeaders(200, response.length());
            OutputStream os = exchange.getResponseBody();
            os.write(response.getBytes());
            os.close();
        }
    }

    static class LoginHandler implements HttpHandler {
        public void handle(HttpExchange exchange) throws IOException {
            String[] parts = exchange.getRequestURI().getQuery().split("&");
            String email = parts[0].split("=")[1];
            String password = parts[1].split("=")[1];

            // Fake login logic for now
            String role = email.equals("admin@gmail.com") ? "admin" : "user";
            String response = "Login success:" + role;

            exchange.sendResponseHeaders(200, response.length());
            OutputStream os = exchange.getResponseBody();
            os.write(response.getBytes());
            os.close();
        }
    }

    static class StaticFileHandler implements HttpHandler {
        public void handle(HttpExchange exchange) throws IOException {
            String path = exchange.getRequestURI().getPath();
            if (path.equals("/")) {
                path = "/index.html"; // default page
            }

            File file = new File("web" + path);
            if (!file.exists()) {
                String response = "404 - File Not Found";
                exchange.sendResponseHeaders(404, response.length());
                OutputStream os = exchange.getResponseBody();
                os.write(response.getBytes());
                os.close();
                return;
            }

            byte[] bytes = Files.readAllBytes(Paths.get(file.getPath()));
            exchange.sendResponseHeaders(200, bytes.length);
            OutputStream os = exchange.getResponseBody();
            os.write(bytes);
            os.close();
        }
    }
}
