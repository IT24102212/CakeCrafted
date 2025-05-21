<%@ page import="models.FAQ" %>
<%@ page import="utils.FileStorageUtil" %>
<%@ page import="java.util.List" %>

<html>
<head>
    <title>FAQs</title>
</head>
<body>
    <h1>Frequently Asked Questions</h1>
    <%
        List<FAQ> faqs = FileStorageUtil.getAllFAQs();
        for (FAQ faq : faqs) {
    %>
        <div style="margin-bottom: 20px;">
            <strong>Q:</strong> <%= faq.getQuestion() %><br>
            <strong>A:</strong> <%= faq.getAnswer() %>
        </div>
    <%
        }
    %>
</body>
</html>
