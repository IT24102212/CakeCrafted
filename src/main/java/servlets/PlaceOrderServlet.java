package servlets;

import models.Cake;
import models.Order;
import models.OrderItem;
import jakarta.servlet.*;
import jakarta.servlet.http.*;
import utils.FileStorageUtil;
import java.io.IOException;
import java.util.*;

// Stripe imports
import com.stripe.Stripe;
import com.stripe.exception.StripeException;
import com.stripe.model.Charge;
import com.stripe.param.ChargeCreateParams;

public class PlaceOrderServlet extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String email = request.getParameter("email");
        String name = request.getParameter("name");
        String address = request.getParameter("address");
        String phoneNumber = request.getParameter("phoneNumber");
        String paymentMethod = request.getParameter("paymentMethod");
        String stripeToken = request.getParameter("stripeToken");

        HttpSession session = request.getSession();
        Map<String, Map<String, Object>> cart = (Map<String, Map<String, Object>>) session.getAttribute("cart");

        if (cart == null || cart.isEmpty()) {
            response.sendRedirect("cakes.jsp");
            return;
        }

        List<OrderItem> items = new ArrayList<>();
        double total = 0;

        for (Map<String, Object> item : cart.values()) {
            Cake cake = (Cake) item.get("cake");
            int quantity = (int) item.get("quantity");

            OrderItem orderItem = new OrderItem();
            orderItem.setCake(cake);
            orderItem.setQuantity(quantity);
            orderItem.setPrice(cake.getPrice());

            items.add(orderItem);
            total += cake.getPrice() * quantity;
        }

        boolean isPaid = false;


        if ("Online".equals(paymentMethod)) {
            try {
                Stripe.apiKey = "";

                ChargeCreateParams params = ChargeCreateParams.builder()
                        .setAmount((long) (total * 100))
                        .setCurrency("lkr")
                        .setDescription("Cake Crafted Order")
                        .setSource(stripeToken)
                        .build();

                Charge charge = Charge.create(params);
                isPaid = charge.getPaid();

            } catch (StripeException e) {
                e.printStackTrace();
                request.setAttribute("error", "Payment failed: " + e.getMessage());
                request.getRequestDispatcher("/user/checkout.jsp").forward(request, response);
                return;
            }
        }


        Order order = new Order();
        order.setOrderId(UUID.randomUUID().toString());
        order.setEmail(email);
        order.setName(name);
        order.setAddress(address);
        order.setPhoneNumber(phoneNumber);
        order.setPaymentMethod(paymentMethod);
        order.setStatus("Pending");
        order.setItems(items);
        order.setTotalAmount(total);
        order.setPaid(isPaid);

        ServletContext context = getServletContext();
        List<Order> orders = (List<Order>) context.getAttribute("orders");
        if (orders == null) {
            orders = new ArrayList<>();
        }
        orders.add(order);
        context.setAttribute("orders", orders);

        FileStorageUtil.saveOrder(order);

        session.removeAttribute("cart");

        response.sendRedirect("/untitled/user/orders");
    }
}
