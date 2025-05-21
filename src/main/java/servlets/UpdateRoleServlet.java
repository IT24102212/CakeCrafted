package servlets;

import jakarta.servlet.*;
import jakarta.servlet.http.*;
import models.User;
import utils.FileStorageUtil;
import java.io.IOException;

public class UpdateRoleServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String useremail = request.getParameter("email");
        String newRole = request.getParameter("newRole");
        System.out.println(useremail + "111111");
        System.out.println(newRole + "111111");

        if (useremail != null && newRole != null) {
            FileStorageUtil.updateUserRole(useremail, newRole);
        }

        // Redirect to admin user list page
        response.sendRedirect("http://localhost:8080/untitled/admin/users");
    }
}
