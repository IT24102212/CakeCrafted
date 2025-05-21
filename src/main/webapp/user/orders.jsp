<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.util.*, models.Order, models.OrderItem" %>

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
            width: 90%;
            margin: 0 auto 40px auto;
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

        .items-table {
            margin: 10px auto;
            width: 85%;
            border: 1px solid #ccc;
        }

        .items-table th {
            background-color: #f06292;
        }

        .items-table td, .items-table th {
            padding: 8px;
            font-size: 14px;
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
    <h2>All Orders</h2>
    <table border="1" cellpadding="5" cellspacing="0">
        <thead>
            <tr>
                <th>Order ID</th>
                <th>Email</th>
                <th>Name</th>
                <th>PhoneNumber</th>
                <th>Total Amount</th>
                <th>Status</th>
                <th>Paid</th>
                <th>Payment Method</th>
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
                    <td><%= order.isPaid() ? "Yes" : "No" %></td>
                    <td><%= order.getPaymentMethod() %></td>

                </tr>
                <tr>
                    <td colspan="9">
                        <table class="items-table" border="1">
                            <thead>
                                <tr>
                                    <th>Cake Name</th>
                                    <th>Price</th>
                                    <th>Quantity</th>
                                </tr>
                            </thead>
                            <tbody>
                                <%
                                    List<OrderItem> items = order.getItems();
                                    if (items != null && !items.isEmpty()) {
                                        for (OrderItem item : items) {
                                %>
                                    <tr>
                                        <td><%= item.getCakeName() %></td>
                                        <td>Rs.<%= item.getPrice() %></td>
                                        <td><%= item.getQuantity() %></td>
                                    </tr>
                                <%
                                        }
                                    } else {
                                %>
                                    <tr>
                                        <td colspan="3">No items found</td>
                                    </tr>
                                <%
                                    }
                                %>
                            </tbody>
                        </table>
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
