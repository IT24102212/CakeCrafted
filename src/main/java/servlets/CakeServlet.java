package servlets;

import models.Cake;
import utils.FileStorageUtil;
import jakarta.servlet.*;
import jakarta.servlet.http.*;
import java.io.*;
import java.util.List;

public class CakeServlet extends HttpServlet {

    // Create a new cake
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String methodOverride = req.getParameter("_method");
        if ("DELETE".equalsIgnoreCase(methodOverride)) {
            doDelete(req, resp);
            return;
        } else if ("PUT".equalsIgnoreCase(methodOverride)) {
            doPut(req, resp);
            return;
        }

        // Regular create logic
        String id = req.getParameter("id");
        String name = req.getParameter("name");
        String flavor = req.getParameter("flavor");
        String size = req.getParameter("size");
        String imageUrl = req.getParameter("imageUrl");
        String priceStr = req.getParameter("price");

        // Validate inputs
        if (id == null || name == null || flavor == null || size == null || imageUrl == null || priceStr == null ||
                id.trim().isEmpty() || name.trim().isEmpty() || flavor.trim().isEmpty() || size.trim().isEmpty() || imageUrl.trim().isEmpty() || priceStr.trim().isEmpty()) {
            resp.setStatus(HttpServletResponse.SC_BAD_REQUEST);
            resp.getWriter().write("Missing required fields.");
            return;
        }

        double price;
        try {
            price = Double.parseDouble(priceStr.trim());
        } catch (NumberFormatException e) {
            resp.setStatus(HttpServletResponse.SC_BAD_REQUEST);
            resp.getWriter().write("Invalid price format.");
            return;
        }

        System.out.println("Received: " + name + " | " + imageUrl + " | " + price);

        // Check for duplicates
        if (FileStorageUtil.cakeExists(id)) {
            resp.setStatus(HttpServletResponse.SC_CONFLICT);
            resp.getWriter().write("Cake already exists.");
            return;
        }

        Cake cake = new Cake(id, name, flavor, size, imageUrl, price);
        FileStorageUtil.saveCake(cake);
        resp.setStatus(HttpServletResponse.SC_CREATED);
        resp.sendRedirect(req.getContextPath() + "/admin/admin-cake.jsp");

    }

    // Get all cakes
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        List<Cake> cakes = FileStorageUtil.getAllCakes();
        for (Cake cake : cakes) {
            resp.getWriter().println("Cake ID: " + cake.getId() + ", Name: " + cake.getName() + ", Flavor: " + cake.getFlavor());
        }
    }

    // Update cake details
    protected void doPut(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String id = req.getParameter("id");
        String name = req.getParameter("name");
        String flavor = req.getParameter("flavor");
        String size = req.getParameter("size");
        String imageUrl = req.getParameter("imageUrl");
        double price = Double.parseDouble(req.getParameter("price"));

        // Fetch the cake and update details
        Cake updatedCake = new Cake(id, name, flavor, size, imageUrl, price);
        FileStorageUtil.updateCake(updatedCake);
        resp.sendRedirect(req.getContextPath() + "/admin/admin-cake.jsp");

    }

    // Delete cake by ID
    protected void doDelete(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        System.out.println("Received: " );
        String id = req.getParameter("id");

        // Delete the cake
        System.out.println("Received: " + id + " | " );
        FileStorageUtil.deleteCakeById(id);
        resp.sendRedirect(req.getContextPath() + "/admin/admin-cake.jsp");

    }
}
