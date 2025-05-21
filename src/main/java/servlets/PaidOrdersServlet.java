package servlets;

import models.Order;
import utils.FileStorageUtil;
import jakarta.servlet.*;
import jakarta.servlet.http.*;
import java.io.IOException;
import java.util.List;
import java.util.stream.Collectors;

public class PaidOrdersServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        System.out.println("22222222222");
        List<Order> allOrders = FileStorageUtil.readOrdersFromFile();

        // Filter only paid orders
        List<Order> paidOrders = allOrders.stream()
                .filter(Order::isPaid)
                .collect(Collectors.toList());

        // Calculate total amount of paid orders
        double totalPaidAmount = paidOrders.stream()
                .mapToDouble(Order::getTotalAmount)
                .sum();

        System.out.println(paidOrders);
        System.out.println(totalPaidAmount);
        request.setAttribute("payments", paidOrders);
        request.setAttribute("totalPaidAmount", totalPaidAmount);

        request.getRequestDispatcher("/admin/payments.jsp").forward(request, response);
    }
}
