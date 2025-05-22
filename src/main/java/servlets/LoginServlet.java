package servlets;

import models.User;
import utils.FileStorageUtil;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.*;

import java.io.IOException;
import java.util.List;

public class LoginServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {
        req.getRequestDispatcher("/user/login.jsp").forward(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {

        String username = req.getParameter("username");
        String password = req.getParameter("password");
        System.out.println("Received: " + username + " | " + password + " | " );

        if (username == null || password == null || username.isEmpty() || password.isEmpty()) {
            req.setAttribute("errorMessage", "Username and password cannot be empty.");
            req.getRequestDispatcher("/user/login.jsp").forward(req, resp);
            return;
        }

        List<User> users = FileStorageUtil.readUsersFromFile();

        User loggedInUser = null;
        for (User user : users) {
            if (user.getUsername().equals(username) && user.getPassword().equals(password)) {
                loggedInUser = user;
                break;
            }
        }

        if (loggedInUser != null) {
            HttpSession session = req.getSession();
            session.setAttribute("user", loggedInUser); // full user object
            session.setAttribute("email", loggedInUser.getUsername()); // assuming username is email
            session.setAttribute("role", loggedInUser.getRole());

            session.setMaxInactiveInterval(30 * 60); // 30 minutes

            // Set cookies
            Cookie emailCookie = new Cookie("email", loggedInUser.getUsername());
            emailCookie.setMaxAge(60 * 60); // 1 hour
            emailCookie.setPath("/");
            emailCookie.setHttpOnly(true);
            resp.addCookie(emailCookie);

            Cookie roleCookie = new Cookie("role", loggedInUser.getRole());
            roleCookie.setMaxAge(60 * 60); // 1 hour
            roleCookie.setPath("/");
            roleCookie.setHttpOnly(true);
            resp.addCookie(roleCookie);

            // Redirect
            if ("ADMIN".equalsIgnoreCase(loggedInUser.getRole())) {
                resp.sendRedirect("http://localhost:8080/untitled/admin/admin-dasboard.jsp");
            } else {
                resp.sendRedirect("http://localhost:8080/untitled/");
            }
        }

    }
}
