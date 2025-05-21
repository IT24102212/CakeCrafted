<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.util.*, models.Order" %>

<html>
<head>
    <title>Paid Orders</title>
    <link rel="stylesheet" href="../css/style.css" />
    <style>
        body {
            padding: 40px;
            font-family: 'Poiret One', cursive;
            background: url('../images/bck1.webp') no-repeat center center fixed;
            background-size: cover;
            color: #e91e63;
        }

        h2 {
            text-align: center;
            font-size: 48px;
        }

        .summary {
            text-align: center;
            font-size: 24px;
            margin-bottom: 20px;
            background-color: #fff3f8;
            padding: 15px;
            border-radius: 8px;
            box-shadow: 0 4px 10px rgba(0,0,0,0.1);
        }

        table {
            width: 90%;
            margin: 0 auto;
            border-collapse: collapse;
            background-color: rgba(255, 255, 255, 0.95);
            border-radius: 12px;
            overflow: hidden;
            box-shadow: 0 8px 20px rgba(0, 0, 0, 0.2);
        }

        th, td {
            padding: 14px;
            text-align: center;
            border-bottom: 1px solid #ddd;
        }

        th {
            background-color: #e91e63;
            color: white;
        }

        tr:nth-child(even) { background-color: #fce4ec; }
        tr:nth-child(odd) { background-color: #f8bbd0; }
    </style>
</head>
<body>
<jsp:include page="/components/header.jsp" />
    <h2>Paid Orders</h2>
    <div class="summary">
        Total Paid Amount: Rs.<%= request.getAttribute("totalPaidAmount") %>
    </div>

    <table>
        <thead>
            <tr>

                <th>Email</th>
                <th>Name</th>
                <th>Phone</th>
                <th>Amount</th>

                <th>Payment Method</th>
            </tr>
        </thead>
        <tbody>
        <%
            List<Order> paidOrders = (List<Order>) request.getAttribute("payments");
            if (paidOrders != null) {
                for (Order order : paidOrders) {
        %>
            <tr>
                <td><%= order.getEmail() %></td>
                <td><%= order.getName() %></td>
                <td><%= order.getPhoneNumber() %></td>
                <td>₹<%= order.getTotalAmount() %></td>
                <td><%= order.getPaymentMethod() %></td>
            </tr>
        <%
                }
            }
        %>
        </tbody>
    </table>
</body>
</html>
