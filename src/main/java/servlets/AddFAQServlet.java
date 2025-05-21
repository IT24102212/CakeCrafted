package servlets;

import jakarta.servlet.*;
import jakarta.servlet.http.*;
import utils.FileStorageUtil;
import java.io.IOException;

public class AddFAQServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String question = request.getParameter("question");
        String answer = request.getParameter("answer");
        System.out.println(question + answer);
        if (question != null && answer != null) {
            FileStorageUtil.addFAQ(question, answer);
        }

        response.sendRedirect("admin/faqs.jsp");
    }
}
