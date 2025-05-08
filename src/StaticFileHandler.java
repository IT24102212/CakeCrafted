import com.sun.net.httpserver.HttpExchange;
import com.sun.net.httpserver.HttpHandler;

import java.io.*;
import java.net.URLConnection;
import java.nio.file.*;

public class StaticFileHandler implements HttpHandler {

    @Override
    public void handle(HttpExchange exchange) throws IOException {
        String filePath = "web" + exchange.getRequestURI().getPath();
        if (filePath.equals("web/")) {
            filePath = "web/index.html"; // Default route
        }

        File file = new File(filePath);
        if (!file.exists()) {
            exchange.sendResponseHeaders(404, 0);
            OutputStream os = exchange.getResponseBody();
            os.write("404 Not Found".getBytes());
            os.close();
            return;
        }

        String mimeType = URLConnection.guessContentTypeFromName(file.getName());
        exchange.getResponseHeaders().add("Content-Type", mimeType);
        byte[] fileBytes = Files.readAllBytes(file.toPath());

        exchange.sendResponseHeaders(200, fileBytes.length);
        OutputStream os = exchange.getResponseBody();
        os.write(fileBytes);
        os.close();
    }
}
