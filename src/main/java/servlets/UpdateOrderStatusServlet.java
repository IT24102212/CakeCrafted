package servlets;

import models.Order;
import utils.FileStorageUtil;
import jakarta.servlet.*;
import jakarta.servlet.http.*;
import java.io.IOException;
import java.util.List;

public class UpdateOrderStatusServlet extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String orderId = request.getParameter("orderId");
        String newStatus = request.getParameter("status");

        List<Order> orders = FileStorageUtil.readOrdersFromFile();

        for (Order order : orders) {
            if (order.getOrderId().equals(orderId)) {
                order.setStatus(newStatus);

                // ✅ Update isPaid based on status
                if ("Completed".equalsIgnoreCase(newStatus)) {
                    order.setPaid(true);
                } else if ("Cancelled".equalsIgnoreCase(newStatus)) {
                    order.setPaid(false);
                }

                break;
            }
        }

        FileStorageUtil.writeOrdersToFile(orders);

        response.sendRedirect(request.getContextPath() + "/admin/orders");
    }
}
