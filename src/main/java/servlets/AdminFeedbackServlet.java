package servlets;

import jakarta.servlet.*;
import jakarta.servlet.http.*;
import models.Feedback;
import utils.FileStorageUtil;
import java.io.IOException;
import java.util.List;

public class AdminFeedbackServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        // Check role cookie
        String role = null;
        Cookie[] cookies = request.getCookies();
        if (cookies != null) {
            for (Cookie c : cookies) {
                if ("role".equals(c.getName())) {
                    role = c.getValue();
                    break;
                }
            }
        }

        if (!"ADMIN".equals(role)) {
            response.sendRedirect(request.getContextPath() + "/login.jsp");
            return;
        }

        List<Feedback> feedbacks = FileStorageUtil.readFeedbacks();
        request.setAttribute("feedbacks", feedbacks);
        request.getRequestDispatcher("/admin/feedback.jsp").forward(request, response);
    }
}
