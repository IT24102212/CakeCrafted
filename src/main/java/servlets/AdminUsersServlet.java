package servlets;

import jakarta.servlet.*;
import jakarta.servlet.http.*;
import models.User;
import utils.FileStorageUtil;

import java.io.IOException;
import java.util.List;

public class AdminUsersServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        // Step 1: Check if user is admin from cookie
        String role = null;
        Cookie[] cookies = request.getCookies();
        if (cookies != null) {
            for (Cookie cookie : cookies) {
                if ("role".equals(cookie.getName())) {
                    role = cookie.getValue();
                    break;
                }
            }
        }

        if (role == null || !role.equals("ADMIN")) {
            response.sendRedirect(request.getContextPath() + "/user/login.jsp");
            return;
        }

        // Step 2: Load users
        List<User> users = FileStorageUtil.readUsersFromFile();

        // Step 3: Forward to JSP
        request.setAttribute("users", users);
        request.getRequestDispatcher("/admin/users.jsp").forward(request, response);
    }
}
