package servlets;

import jakarta.servlet.*;
import jakarta.servlet.http.*;
import java.io.IOException;
import java.util.*;

public class CartQuantityServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String cakeId = request.getParameter("cakeId");
        String action = request.getParameter("action");

        HttpSession session = request.getSession();
        Map<String, Map<String, Object>> cart = (Map<String, Map<String, Object>>) session.getAttribute("cart");

        if (cart == null || !cart.containsKey(cakeId)) {
            response.sendRedirect(request.getContextPath() + "/user/view-cart.jsp");
            return;
        }

        int qty = (int) cart.get(cakeId).get("quantity");

        if ("increase".equals(action)) {
            cart.get(cakeId).put("quantity", qty + 1);
        } else if ("decrease".equals(action)) {
            if (qty > 1) {
                cart.get(cakeId).put("quantity", qty - 1);
            } else {
                cart.remove(cakeId);
            }
        }

        session.setAttribute("cart", cart);
        response.sendRedirect(request.getContextPath() + "/user/view-cart.jsp");
    }
}
