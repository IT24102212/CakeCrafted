package servlets;

import jakarta.servlet.*;
import jakarta.servlet.http.*;
import java.io.IOException;
import java.util.*;

public class RemoveFromCartServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String cakeId = request.getParameter("cakeId");
        HttpSession session = request.getSession();
        Map<String, Map<String, Object>> cart = (Map<String, Map<String, Object>>) session.getAttribute("cart");

        if (cart != null) {
            cart.remove(cakeId);
        }

        session.setAttribute("cart", cart);
        response.sendRedirect(request.getContextPath() + "/user/view-cart.jsp");
    }
}
