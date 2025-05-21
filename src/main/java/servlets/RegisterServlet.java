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
        String email = request.getParameter("username");
        String password = request.getParameter("password");
        String role = "user";
        System.out.println("Received: " + email + " | " + password + " | " + role);

        // Check if the user already exists
        if (FileStorageUtil.userExists(email)) {
            request.setAttribute("message", "Useremail already exists.");
            request.getRequestDispatcher("/user/register.jsp").forward(request, response);

        } else {
            // Create user object
            User newUser = new User(email, password, role);

            // Save user to file (users.txt)
            FileStorageUtil.saveUser(newUser);

            // Redirect to login page after successful registration
            response.sendRedirect("http://localhost:8080/untitled/user/login.jsp");
        }
    }
}
