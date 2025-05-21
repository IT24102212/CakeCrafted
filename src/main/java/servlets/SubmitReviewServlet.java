package servlets;

import jakarta.servlet.*;
import jakarta.servlet.http.*;
import models.Feedback;
import utils.FileStorageUtil;
import java.io.IOException;

public class SubmitReviewServlet extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String name = request.getParameter("name");
        String message = request.getParameter("message");

        Feedback feedback = new Feedback(name, message);
        FileStorageUtil.saveFeedback(feedback);

        response.sendRedirect("about.jsp"); // go back to about page after submit
    }
}
