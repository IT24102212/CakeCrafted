package servlets;

import models.User;
import utils.FileStorageUtil;
import jakarta.servlet.*;
import jakarta.servlet.http.*;
import java.io.IOException;



public class RegisterServlet extends HttpServlet {

    // DoPost method handles form submission
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String username = request.getParameter("username");
        String password = request.getParameter("password");
        String role = request.getParameter("role");
        System.out.println("Received: " + username + " | " + password + " | " + role);

        // Check if the user already exists
        if (FileStorageUtil.userExists(username)) {
            request.setAttribute("message", "Username already exists.");
            request.getRequestDispatcher("/user/register.jsp").forward(request, response);
        } else {
            // Create user object
            User newUser = new User(username, password, role);

            // Save user to file (users.txt)
            FileStorageUtil.saveUser(newUser);

            // Redirect to login page after successful registration
            response.sendRedirect("http://localhost:8080/untitled/user/login.jsp");
        }
    }
}
