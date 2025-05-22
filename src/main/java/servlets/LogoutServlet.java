package servlets;

import jakarta.servlet.http.*;

import java.io.IOException;

public class LogoutServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws IOException {
        HttpSession session = req.getSession(false);
        if (session != null) {
            session.invalidate();
        }

        // Remove cookies
        Cookie[] cookies = req.getCookies();
        if (cookies != null) {
            for (Cookie cookie : cookies) {
                if ("email".equals(cookie.getName()) || "role".equals(cookie.getName())) {
                    cookie.setMaxAge(0);
                    cookie.setPath("/"); // Ensure path matches original
                    resp.addCookie(cookie);
                }
            }
        }

        resp.sendRedirect("http://localhost:8080/untitled/");
    }
}
