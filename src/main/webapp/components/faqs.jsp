<%@ page import="models.FAQ" %>
<%@ page import="utils.FileStorageUtil" %>
<%@ page import="java.util.List" %>

<%
    List<FAQ> faqs = FileStorageUtil.getAllFAQs();
%>

<div style="
    background-color: #FFE4E1;
    border-radius: 12px;
    padding: 30px;
    width: 80%;
    margin: 40px auto;
    box-shadow: 0 8px 20px rgba(0, 0, 0, 0.2);
    font-family: 'Poiret One', cursive;
    color: #880e4f;
    animation: fadeInUp 1.2s ease;
">

    <h2 style="text-align: center; font-size: 36px; color: #e91e63; margin-bottom: 20px;">FAQs</h2>
    <%
        for (FAQ faq : faqs) {
    %>
        <div style="margin-bottom: 20px; border-bottom: 1px solid #f8bbd0; padding-bottom: 10px;">
            <p style="margin: 0;"><strong>Q:</strong> <%= faq.getQuestion() %></p>
            <p style="margin: 5px 0 0;"><strong>A:</strong> <%= faq.getAnswer() %></p>
        </div>
    <%
        }
        if (faqs.isEmpty()) {
    %>
        <p style="text-align: center;">No FAQs available.</p>
    <%
        }
    %>
</div>

<style>
    @keyframes fadeInUp {
        from { opacity: 0; transform: translateY(30px); }
        to { opacity: 1; transform: translateY(0); }
    }
</style>
