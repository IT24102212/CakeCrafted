package servlets;

import models.Order;
import utils.FileStorageUtil;
import jakarta.servlet.*;
import jakarta.servlet.http.*;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

public class UserOrdersServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String email = null;
        String role = null;

        // Get cookies
        Cookie[] cookies = request.getCookies();
        if (cookies != null) {
            for (Cookie cookie : cookies) {
                if ("email".equals(cookie.getName())) {
                    email = cookie.getValue();
                }
                if ("role".equals(cookie.getName())) {
                    role = cookie.getValue();
                }
            }
        }
        // If email not found, redirect to login
        if (email == null) {
            response.sendRedirect(request.getContextPath() + "/user/login.jsp");
            return;
        }

        // Load all orders
        List<Order> allOrders = FileStorageUtil.readOrdersFromFile();

        // Filter orders by email
        List<Order> userOrders = new ArrayList<>();
        for (Order order : allOrders) {
            if (email.equals(order.getEmail())) {
                userOrders.add(order);
            }
        }

        // Send filtered orders to frontend JSP
        request.setAttribute("orders", userOrders);
        request.getRequestDispatcher("/user/orders.jsp").forward(request, response);
    }
}
