package servlets;

import models.Order;
import utils.FileStorageUtil;
import jakarta.servlet.*;
import jakarta.servlet.http.*;
import java.io.IOException;
import java.util.List;

public class AdminOrdersServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        List<Order> orders = FileStorageUtil.readOrdersFromFile();
        request.setAttribute("orders", orders);
        System.out.println("All Orders:");
        for (Order order : orders) {
            System.out.println(order);
        }
        request.getRequestDispatcher("/admin/orders.jsp").forward(request, response);
    }
}