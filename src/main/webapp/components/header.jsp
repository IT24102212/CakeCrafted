<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    String role = null;
    String email = null;
    String currentPath = request.getRequestURI(); // e.g., "/untitled/user/cakes.jsp"

    Cookie[] cookies = request.getCookies();
    if (cookies != null) {
        for (Cookie cookie : cookies) {
            if ("role".equals(cookie.getName())) {
                role = cookie.getValue();
            }
            if ("email".equals(cookie.getName())) {
                email = cookie.getValue();
            }
        }
    }
%>

<header>
    <nav class="navbar">
        <a href="/" class="logo">Cake Crafted</a>
        <ul class="nav-list">
            <li><a href="/untitled/" class="nav-link <%= currentPath.equals("/") ? "active" : "" %>">Home</a></li>
               <li><a href="/untitled/about.jsp" class="nav-link <%= currentPath.endsWith("about.jsp") ? "active" : "" %>">About</a></li>
               <li><a href="/untitled/user/cakes.jsp" class="nav-link <%= currentPath.endsWith("cakes.jsp") ? "active" : "" %>">Cakes</a></li>
               <li><a href="/untitled/user/view-cart.jsp" class="nav-link <%= currentPath.endsWith("view-cart.jsp") ? "active" : "" %>"><i class="fas fa-shopping-cart"></i></a></li>

   <% if ("user".equalsIgnoreCase(role)) { %>

   <% } %>

            <% if ("ADMIN".equalsIgnoreCase(role)) { %>
                <li><a href="/untitled/admin/admin-dasboard.jsp" class="nav-link <%= currentPath.endsWith("dashboard.jsp") ? "active" : "" %>">Admin</a></li>
                <li><a href="/untitled/admin/admin-cake.jsp" class="nav-link <%= currentPath.endsWith("admin-cake.jsp") ? "active" : "" %>">Cakes</a></li>
                 <li><a href="/untitled/admin/users.jsp" class="nav-link <%= currentPath.endsWith("users") ? "active" : "" %>">Customers</a></li>
                  <li><a href="/untitled/admin/orders.jsp" class="nav-link <%= currentPath.endsWith("orders.jsp") ? "active" : "" %>">orders</a></li>
                   <li><a href="/untitled/admin/payment.jsp" class="nav-link <%= currentPath.endsWith("payment.jsp") ? "active" : "" %>">Payment</a></li>
                    <li><a href="/untitled/admin/feedback.jsp" class="nav-link <%= currentPath.endsWith("feedback.jsp") ? "active" : "" %>">Feedback</a></li>
            <% } %>
            <% if ("user".equalsIgnoreCase(role)) { %>
                            <li><a href="/untitled/" class="nav-link <%= currentPath.endsWith("index.jsp") ? "active" : "" %>">Home</a></li>
                            <li><a href="/untitled/about.jsp" class="nav-link <%= currentPath.endsWith("about.jsp") ? "active" : "" %>">About</a></li>
                             <li><a href="/untitled/user/cakes.jsp" class="nav-link <%= currentPath.endsWith("cakes.jsp") ? "active" : "" %>">Cakes</a></li>
                                <li><a href="/untitled/user/view-cart.jsp" class="nav-link <%= currentPath.endsWith("view-cart.jsp") ? "active" : "" %>"><i class="fas fa-shopping-cart"></i></a></li>
                              <li><a href="/untitled/user/orders" class="nav-link <%= currentPath.endsWith("orders.jsp") ? "active" : "" %>">Orders</a></li>
                                <li><a href="/untitled/admin/feedback.jsp" class="nav-link <%= currentPath.endsWith("feedback.jsp") ? "active" : "" %>">Feedback</a></li>
                        <% } %>
                <% if (email = null) { %>
                           <li><a href="/untitled/" class="nav-link <%= currentPath.endsWith("index.jsp") ? "active" : "" %>">Home</a></li>
                           <li><a href="/untitled/about.jsp" class="nav-link <%= currentPath.endsWith("about.jsp") ? "active" : "" %>">About</a></li>
                            <li><a href="/untitled/user/orders" class="nav-link">Orders</a></li>
                   <% } %>
            <% if (email != null) { %>
                <li><a href="/untitled/logout" class="nav-link">Logout</a></li>
            <% } else { %>
                <li><a href="/untitled/user/login.jsp" class="nav-link <%= currentPath.endsWith("login.jsp") ? "active" : "" %>">Login</a></li>
            <% } %>
        </ul>
    </nav>
</header>
