<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.util.*, models.Cake, models.Order, models.OrderItem, utils.FileStorageUtil" %>

<html>
<head>
    <title>Admin - Manage Orders</title>
    <link rel="stylesheet" href="../css/style.css" />

    <style>
        body {
            margin: 0;
            padding: 40px;
            font-family: 'Poiret One', cursive;
            background: url('../images/bck1.webp') no-repeat center center fixed;
            background-size: cover;
            color: #e91e63;
        }

        h2 {
            text-align: center;
            font-size: 48px;
            margin-bottom: 30px;
            animation: fadeInDown 1s ease-out;
        }

        table {
            width: 95%;
            margin: 0 auto;
            border-collapse: collapse;
            background-color: rgba(255, 255, 255, 0.95);
            border-radius: 12px;
            overflow: hidden;
            box-shadow: 0 8px 20px rgba(0, 0, 0, 0.2);
            animation: fadeInUp 1.2s ease;
        }

        th, td {
            padding: 14px;
            text-align: center;
            font-size: 16px;
            border-bottom: 1px solid #ddd;
        }

        th {
            background-color: #e91e63;
            color: white;
        }

        tr:nth-child(even) {
            background-color: #fce4ec;
        }

        tr:nth-child(odd) {
            background-color: #f8bbd0;
        }

        select, button {
            padding: 6px 10px;
            border: none;
            border-radius: 5px;
            font-size: 14px;
        }

        select {
            background-color: #fff;
        }

        button {
            background-color: #e91e63;
            color: white;
            cursor: pointer;
        }

        button:hover {
            background-color: #c2185b;
        }

        @keyframes fadeInDown {
            from { opacity: 0; transform: translateY(-30px); }
            to { opacity: 1; transform: translateY(0); }
        }

        @keyframes fadeInUp {
            from { opacity: 0; transform: translateY(30px); }
            to { opacity: 1; transform: translateY(0); }
        }
    </style>
</head>
<body>
<jsp:include page="/components/header.jsp" />
    <h2>All Orders</h2>
    <table border="1" cellpadding="5" cellspacing="0">
        <thead>
            <tr>
                <th>Order ID</th>
                <th>Email</th>
                <th>Name</th>
                <th>Phone Number</th>
                <th>Total Amount</th>
                <th>Status</th>
                <th>Payment Method</th>
                <th>Paid</th>
                <th>Ordered Items</th>
                <th>Update Status</th>
            </tr>
        </thead>
        <tbody>
            <%
                List<Order> orders = (List<Order>) request.getAttribute("orders");
                if (orders != null) {
                    for (Order order : orders) {
            %>
                <tr>
                    <td><%= order.getOrderId() %></td>
                    <td><%= order.getEmail() %></td>
                    <td><%= order.getName() %></td>
                    <td><%= order.getPhoneNumber() %></td>
                    <td>Rs.<%= order.getTotalAmount() %></td>
                    <td><%= order.getStatus() %></td>
                    <td><%= order.getPaymentMethod() %></td>
                    <td><%= order.isPaid() %></td>
                    <td>
                        <%
                            List<models.OrderItem> items = order.getItems();
                            if (items != null && !items.isEmpty()) {
                                for (models.OrderItem item : items) {
                        %>
                            <div>
                                <strong><%= item.getCakeName() %></strong> - Rs.<%= item.getPrice() %> x <%= item.getQuantity() %>
                            </div>
                        <%
                                }
                            } else {
                        %>
                            <em>No items</em>
                        <%
                            }
                        %>
                    </td>
                    <td>
                        <form action="<%= request.getContextPath() %>/updateOrderStatus" method="post">
                            <input type="hidden" name="orderId" value="<%= order.getOrderId() %>" />
                            <select name="status">
                                <option value="Pending" <%= "Pending".equals(order.getStatus()) ? "selected" : "" %>>Pending</option>
                                <option value="Processing" <%= "Processing".equals(order.getStatus()) ? "selected" : "" %>>Processing</option>
                                <option value="Completed" <%= "Completed".equals(order.getStatus()) ? "selected" : "" %>>Completed</option>
                                <option value="Cancelled" <%= "Cancelled".equals(order.getStatus()) ? "selected" : "" %>>Cancelled</option>
                            </select>
                            <button type="submit">Update</button>
                        </form>
                    </td>
                </tr>
            <%
                    }
                }
            %>
        </tbody>
    </table>
</body>
</html>
