<%@ page import="java.util.*, models.Cake" %>
<%
    Map<String, Map<String, Object>> cart = (Map<String, Map<String, Object>>) session.getAttribute("cart");
    double total = 0;
%>

<html>
<head>
    <title>Your Cart</title>
    <link rel="stylesheet" href="../css/style.css" />
    <link href="https://fonts.googleapis.com/css2?family=Cabin&family=Poiret+One&display=swap" rel="stylesheet" />
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.14.0/css/all.min.css" />
    <style>
        body {
            font-family: 'Cabin', sans-serif;
            background-image: url('../images/bc1.jpg');
            background-size: cover;
            background-repeat: no-repeat;
            margin: 0;
            padding: 0;
        }

        h2 {
            text-align: center;
            margin: 2rem 0;
            font-size: 2.5rem;
            color: #e91e63;
        }

        ul.cart-list {
            max-width: 900px;
            margin: 0 auto;
            padding: 0;
            list-style: none;
        }

        ul.cart-list li {
            background: #fff;
            margin: 1rem 0;
            padding: 1.5rem 2rem;
            border-radius: 1rem;
            box-shadow: 0 4px 12px rgba(0, 0, 0, 0.08);
            display: flex;
            align-items: center;
            justify-content: space-between;
            gap: 1.5rem;
            flex-wrap: wrap;
        }

        .cart-left {
            display: flex;
            align-items: center;
            gap: 1rem;
            flex: 1;
        }

        .cart-left img {
            width: 100px;
            height: 100px;
            object-fit: cover;
            border-radius: 1rem;
        }

        .cart-info {
            display: flex;
            flex-direction: column;
            gap: 0.3rem;
        }

        .cart-actions {
            display: flex;
            flex-direction: column;
            gap: 0.5rem;
            align-items: flex-end;
        }

        .quantity-controls {
            display: flex;
            align-items: center;
            gap: 0.5rem;
        }

        input[type="submit"],
        button {
            background-color: #e91e63;
            color: white;
            border: none;
            padding: 0.5rem 1rem;
            border-radius: 0.5rem;
            cursor: pointer;
            font-weight: bold;
        }

        button:hover,
        input[type="submit"]:hover {
            background-color: #c2185b;
        }

        h3 {
            text-align: center;
            font-size: 1.8rem;
            color: #333;
        }

        .checkout-btn {
            display: block;
            width: fit-content;
            margin: 2rem auto;
            background-color: #ff4081;
            padding: 0.8rem 2rem;
            color: white;
            border-radius: 2rem;
            text-decoration: none;
            font-weight: bold;
            transition: background-color 0.3s ease;
        }

        .checkout-btn:hover {
            background-color: #e91e63;
        }

        p {
            text-align: center;
            color: #777;
            font-size: 1.2rem;
        }

        .empty-cart-box {
            margin-top: 100px;
        }
    </style>
</head>
<body>

<!-- HEADER -->
<jsp:include page="/components/header.jsp" />

<h2>Your Cart</h2>

<% if (cart != null && !cart.isEmpty()) { %>
    <ul class="cart-list">
        <% for (Map<String, Object> item : cart.values()) {
            Cake cake = (Cake) item.get("cake");
            int qty = (int) item.get("quantity");
            double itemTotal = cake.getPrice() * qty;
            total += itemTotal;
        %>
            <li>
                <div class="cart-left">
                    <img src="<%= cake.getImageUrl() %>" alt="<%= cake.getName() %>">
                    <div class="cart-info">
                        <strong><%= cake.getName() %></strong>
                        <span><%= cake.getPrice() %> * <%= qty %> = <strong><%= itemTotal %></strong></span>
                    </div>
                </div>

                <div class="cart-actions">
                    <form action="<%= request.getContextPath() %>/remove-from-cart" method="post">
                        <input type="hidden" name="cakeId" value="<%= cake.getId() %>">
                        <input type="submit" value="Remove">
                    </form>

                    <form action="<%= request.getContextPath() %>/cart-quantity" method="post" class="quantity-controls">
                        <input type="hidden" name="cakeId" value="<%= cake.getId() %>">
                        <button name="action" value="decrease">-</button>
                        <span><%= qty %></span>
                        <button name="action" value="increase">+</button>
                    </form>
                </div>
            </li>
        <% } %>
    </ul>

    <h3>Total: <%= total %></h3>
    <a class="checkout-btn" href="checkout.jsp">Proceed to Checkout</a>

<% } else { %>
    <div class="empty-cart-box">
        <p>Your cart is empty.</p>
    </div>
<% } %>

</body>
</html>
