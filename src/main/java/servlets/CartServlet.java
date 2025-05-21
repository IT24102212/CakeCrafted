package servlets;

import models.Cake;
import utils.FileStorageUtil;
import jakarta.servlet.*;
import jakarta.servlet.http.*;
import java.io.IOException;
import java.util.*;

public class CartServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String cakeId = request.getParameter("cakeId");
        Cake cake = FileStorageUtil.getCakeById(cakeId);

        HttpSession session = request.getSession();
        Map<String, Map<String, Object>> cart = (Map<String, Map<String, Object>>) session.getAttribute("cart");

        if (cart == null) {
            cart = new HashMap<>();
        }

        if (cart.containsKey(cakeId)) {
            int currentQty = (int) cart.get(cakeId).get("quantity");
            cart.get(cakeId).put("quantity", currentQty + 1);
        } else {
            Map<String, Object> cartItem = new HashMap<>();
            cartItem.put("cake", cake);
            cartItem.put("quantity", 1);
            cart.put(cakeId, cartItem);
        }

        session.setAttribute("cart", cart);
        response.sendRedirect(request.getContextPath() + "/user/view-cart.jsp");
    }
}
