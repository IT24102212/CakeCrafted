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

        String useremail = req.getParameter("username");
        String password = req.getParameter("password");
        System.out.println("Received: " + useremail + " | " + password + " | ");

        if (useremail == null || password == null || useremail.isEmpty() || password.isEmpty()) {
            req.setAttribute("errorMessage", "Email and password cannot be empty.");
            req.getRequestDispatcher("/user/login.jsp").forward(req, resp);
            return;
        }

        List<User> users = FileStorageUtil.readUsersFromFile();
        User loggedInUser = null;

        for (User user : users) {
            if (user.getEmail().equals(useremail) && user.getPassword().equals(password)) {
                loggedInUser = user;
                break;
            }
        }

        if (loggedInUser != null) {
            String role = loggedInUser.getRole();

            if ("BAN".equalsIgnoreCase(role)) {
                req.setAttribute("errorMessage", "Your account has been banned. Please contact support.");
                req.getRequestDispatcher("/user/login.jsp").forward(req, resp);
                return;
            }

            HttpSession session = req.getSession();
            session.setAttribute("user", loggedInUser);
            session.setAttribute("email", loggedInUser.getEmail());
            session.setAttribute("role", role);
            session.setMaxInactiveInterval(30 * 60); // 30 minutes

            // Set cookies
            Cookie emailCookie = new Cookie("email", loggedInUser.getEmail());
            emailCookie.setMaxAge(60 * 60); // 1 hour
            emailCookie.setPath("/");
            emailCookie.setHttpOnly(true);
            resp.addCookie(emailCookie);

            Cookie roleCookie = new Cookie("role", role);
            roleCookie.setMaxAge(60 * 60); // 1 hour
            roleCookie.setPath("/");
            roleCookie.setHttpOnly(true);
            resp.addCookie(roleCookie);

            // Redirect
            if ("ADMIN".equalsIgnoreCase(role)) {
                resp.sendRedirect("http://localhost:8080/untitled/admin/admin-dasboard.jsp");
            } else {
                resp.sendRedirect("http://localhost:8080/untitled/");
            }

        } else {
            req.setAttribute("errorMessage", "Invalid email or password.");
            req.getRequestDispatcher("/user/login.jsp").forward(req, resp);
        }
    }
}
