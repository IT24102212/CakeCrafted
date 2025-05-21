<%@ page import="java.util.*, models.Cake" %>
<%
    Map<String, Map<String, Object>> cart = (Map<String, Map<String, Object>>) session.getAttribute("cart");
    String email = null;
    String role = null;

    Cookie[] cookies = request.getCookies();
    if (cookies != null) {
        for (Cookie cookie : cookies) {
            if ("email".equals(cookie.getName())) {
                email = cookie.getValue();
            }
            if ("role".equals(cookie.getName())) {
                role = cookie.getValue();
            }
        }
    }

    // ✅ Redirect to login if email is not found
    if (email == null) {
        response.sendRedirect(request.getContextPath() + "/user/login.jsp");
        return;
    }

    double total = 0;
%>

<html>
<head>
    <title>Checkout</title>
    <link rel="stylesheet" href="../css/style.css" />
    <link href="https://fonts.googleapis.com/css2?family=Cabin&family=Poiret+One&display=swap" rel="stylesheet" />
    <script src="https://js.stripe.com/v3/"></script> <!-- Stripe JS -->
</head>
<body class="checkout-bg">

<jsp:include page="/components/header.jsp" />
<h2 class="checkout-title">Checkout</h2>

<% if (cart == null || cart.isEmpty()) { %>
    <div class="empty-cart-box">
        <p>Your cart is empty.</p>
    </div>
<% } else { %>
    <form class="checkout-form animate-fade" action="<%= request.getContextPath() %>/place-order" method="post">
        <label>Email:</label>
        <input type="email" name="email" value="<%= email != null ? email : "" %>" readonly required>

        <label>Name:</label>
        <input type="text" name="name" required>
<label>Phone Number:</label>
<input type="tel" name="phoneNumber" pattern="[0-9]{10}" required>
        <label>Address:</label>
        <textarea name="address" required></textarea>

        <label>Payment Method:</label>
        <div class="payment-options">
            <label><input type="radio" name="paymentMethod" value="COD" checked> Cash on Delivery</label>
            <label><input type="radio" name="paymentMethod" value="Online"> Online Payment</label>
        </div>

        <!-- Stripe card element container -->
        <div id="card-element" class="stripe-card" style="display: none;"></div>
        <div id="card-errors" class="stripe-error" style="color: red;"></div>
        <input type="hidden" name="stripeToken" id="stripeToken">

        <h3 class="summary-heading">Order Summary</h3>
        <ul class="order-summary">
            <%
                for (Map<String, Object> item : cart.values()) {
                    Cake cake = (Cake) item.get("cake");
                    int qty = (int) item.get("quantity");
                    double itemTotal = cake.getPrice() * qty;
                    total += itemTotal;
            %>
                <li><%= cake.getName() %> - <%= cake.getPrice() %> * <%= qty %> = <%= itemTotal %></li>
            <% } %>
        </ul>

        <p class="total-price"><strong>Total:</strong> <%= String.format("%.2f", total) %></p>
        <input class="btn-primary" type="submit" value="Place Order">
    </form>
<% } %>

<!-- Stripe integration script -->
<script>
    const stripe = Stripe(""); // ✅ Replace with your Stripe Publishable Key
    const elements = stripe.elements();
    const card = elements.create("card", {
        style: {
            base: {
                fontSize: '16px',
                color: '#32325d',
                fontFamily: 'Cabin, sans-serif',
                '::placeholder': {
                    color: '#aab7c4'
                }
            },
            invalid: {
                color: '#fa755a',
                iconColor: '#fa755a'
            }
        }
    });

    const cardElement = document.getElementById("card-element");

    document.querySelectorAll('input[name="paymentMethod"]').forEach((input) => {
        input.addEventListener("change", function () {
            if (this.value === "Online") {
                cardElement.style.display = "block";
                card.mount("#card-element");
            } else {
                cardElement.style.display = "none";
                card.unmount();
            }
        });
    });

    const form = document.querySelector(".checkout-form");
    form.addEventListener("submit", async function (e) {
        const selected = document.querySelector('input[name="paymentMethod"]:checked').value;
        if (selected === "Online") {
            e.preventDefault();
            const { token, error } = await stripe.createToken(card);
            if (error) {
                document.getElementById("card-errors").textContent = error.message;
            } else {
                document.getElementById("stripeToken").value = token.id;
                form.submit();
            }
        }
    });
</script>

</body>
</html>
