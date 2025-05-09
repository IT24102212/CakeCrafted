import com.sun.net.httpserver.HttpServer;
import com.sun.net.httpserver.HttpHandler;
import com.sun.net.httpserver.HttpExchange;

import java.io.*;
import java.net.InetSocketAddress;
import java.net.URLDecoder;
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
            if (!exchange.getRequestMethod().equalsIgnoreCase("POST")) {
                exchange.sendResponseHeaders(405, -1); // Method Not Allowed
                return;
            }

            String body = new String(exchange.getRequestBody().readAllBytes());
            String[] parts = body.split("&");

            String name = URLDecoder.decode(parts[0].split("=")[1], "UTF-8");
            String email = URLDecoder.decode(parts[1].split("=")[1], "UTF-8");
            String password = URLDecoder.decode(parts[2].split("=")[1], "UTF-8");
            String role = URLDecoder.decode(parts[3].split("=")[1], "UTF-8");

            // For now, simulate success
            System.out.println("New user: " + name + " | " + email + " | Role: " + role);
            String response = "Registered successfully!";

            exchange.sendResponseHeaders(200, response.length());
            OutputStream os = exchange.getResponseBody();
            os.write(response.getBytes());
            os.close();
        }
    }

    static class LoginHandler implements HttpHandler {
        public void handle(HttpExchange exchange) throws IOException {
            if (!exchange.getRequestMethod().equalsIgnoreCase("POST")) {
                exchange.sendResponseHeaders(405, -1); // Method Not Allowed
                return;
            }

            String body = new String(exchange.getRequestBody().readAllBytes());
            String[] parts = body.split("&");

            String email = URLDecoder.decode(parts[0].split("=")[1], "UTF-8");
            String password = URLDecoder.decode(parts[1].split("=")[1], "UTF-8");

            // Simple mock logic
            String role = email.equals("admin@gmail.com") ? "admin" : "user";

            exchange.sendResponseHeaders(200, role.length());
            OutputStream os = exchange.getResponseBody();
            os.write(role.getBytes());
            os.close();
        }
    }

    static class StaticFileHandler implements HttpHandler {
        public void handle(HttpExchange exchange) throws IOException {
            String path = exchange.getRequestURI().getPath();
            if (path.equals("/")) {
                path = "/index.html";
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
