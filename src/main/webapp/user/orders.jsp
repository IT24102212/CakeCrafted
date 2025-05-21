<%@ page import="java.util.List" %>
<%@ page import="models.Order" %>
<%@ page import="models.OrderItem" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Your Orders</title>
    <link rel="stylesheet" href="../css/style.css" />
    <link href="https://fonts.googleapis.com/css2?family=Cabin&family=Poiret+One&display=swap" rel="stylesheet" />
    <style>
        .order-card {
            background-color: #fff0f6;
            border-radius: 12px;
            padding: 20px;
            margin: 30px auto;
            width: 85%;
            box-shadow: 0 8px 16px rgba(0, 0, 0, 0.1);
            font-family: 'Cabin', sans-serif;
        }

        .order-title {
            text-align: center;
            font-family: 'Poiret One', cursive;
            margin-top: 2rem;
            font-size: 2rem;
            color: #e91e63;
        }

        .order-item-box {
            display: flex;
            justify-content: space-between;
            background: #fce4ec;
            padding: 10px;
            border-radius: 8px;
            margin-top: 8px;
            font-size: 0.95rem;
        }

        .order-item-box span {
            flex: 1;
            text-align: center;
            font-weight: 500;
        }

        .item-header {
            font-weight: bold;
            background-color: #f8bbd0;
            padding: 10px;
            margin-top: 15px;
            border-radius: 6px;
            display: flex;
            justify-content: space-between;
            color: #880e4f;
        }

        .item-header span {
            flex: 1;
            text-align: center;
        }

        .empty-order-box {
            text-align: center;
            font-size: 1.2rem;
            margin-top: 3rem;
            color: #555;
        }
    </style>
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
               <p><strong>Total Amount:</strong> ₹<%= order.getTotalAmount() %></p>

               <div class="item-header">
                   <span>Cake Name</span>
                   <span>Price</span>
                   <span>Quantity</span>
               </div>

               <%
                   List<OrderItem> items = order.getItems();
                   if (items != null && !items.isEmpty()) {
                       for (OrderItem item : items) {
               %>
                   <div class="order-item-box">
                       <span><%= item.getCakeName() %></span>
                       <span>₹<%= item.getPrice() %></span>
                       <span><%= item.getQuantity() %></span>
                   </div>
               <%
                       }
                   } else {
               %>
                   <div class="order-item-box">
                       <span colspan="3">No items found</span>
                   </div>
               <%
                   }
               %>
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
