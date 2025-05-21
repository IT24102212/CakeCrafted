<%@ page import="java.util.List" %>
<%@ page import="models.Order" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Your Orders</title>
    <link rel="stylesheet" href="../css/style.css" />
    <link href="https://fonts.googleapis.com/css2?family=Cabin&family=Poiret+One&display=swap" rel="stylesheet" />
</head>
<body class="orders-bg">
<jsp:include page="/components/header.jsp" />
<h1 class="order-title">Your Orders</h1>

<%
    List<Order> orders = (List<Order>) request.getAttribute("orders");
    if (orders != null && !orders.isEmpty()) {
        for (Order order : orders) {
%>
            <div class="order-card animate-fade">
                <p><strong>Order ID:</strong> <%= order.getOrderId() %></p>
                <p><strong>Status:</strong> <%= order.getStatus() %></p>
                <p><strong>Email:</strong> <%= order.getEmail() %></p>
                <p><strong>Address:</strong> <%= order.getAddress() %></p>
                <p><strong>Payment Method:</strong> <%= order.getPaymentMethod() %></p>
                <p><strong>Total Amount:</strong> Rs.<%= order.getTotalAmount() %></p>
            </div>
<%
        }
    } else {
%>
    <div class="empty-order-box">
        <p>No orders found.</p>
    </div>
<%
    }
%>
</body>
</html>
