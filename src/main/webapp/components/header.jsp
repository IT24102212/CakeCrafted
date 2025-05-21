<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    String role = null;
    String email = null;
    String currentPath = request.getRequestURI();

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

   <% if ("user".equalsIgnoreCase(role)) { %>
 <li><a href="/untitled/about.jsp" class="nav-link <%= currentPath.endsWith("about.jsp") ? "active" : "" %>">About</a></li>
               <li><a href="/untitled/user/cakes.jsp" class="nav-link <%= currentPath.endsWith("cakes.jsp") ? "active" : "" %>">Cakes</a></li>
               <li><a href="/untitled/user/view-cart.jsp" class="nav-link <%= currentPath.endsWith("view-cart.jsp") ? "active" : "" %>"><i class="fas fa-shopping-cart"></i></a></li>
  <li><a href="/untitled/user/orders" class="nav-link">Orders</a></li>
   <% } %>

            <% if ("ADMIN".equalsIgnoreCase(role)) { %>
                <li><a href="/untitled/admin/admin-dasboard.jsp" class="nav-link <%= currentPath.endsWith("dashboard.jsp") ? "active" : "" %>">Admin</a></li>
                <li><a href="/untitled/admin/admin-cake.jsp" class="nav-link <%= currentPath.endsWith("admin-cake.jsp") ? "active" : "" %>">Cakes</a></li>
                 <li><a href="/untitled/admin/users" class="nav-link <%= currentPath.endsWith("users") ? "active" : "" %>">Customers</a></li>
                  <li><a href="/untitled/admin/orders" class="nav-link <%= currentPath.endsWith("orders") ? "active" : "" %>">orders</a></li>
                   <li><a href="/untitled/admin/payments" class="nav-link <%= currentPath.endsWith("payments") ? "active" : "" %>">Payment</a></li>
                    <li><a href="/untitled/admin/feedbacks" class="nav-link <%= currentPath.endsWith("feedback") ? "active" : "" %>">Feedback</a></li>
                    <li><a href="/untitled/admin/faqs.jsp" class="nav-link <%= currentPath.endsWith("faqs.jsp") ? "active" : "" %>">FAQ</a></li>
            <% } %>
                <% if (email == null) { %>
                 <li><a href="/untitled/about.jsp" class="nav-link <%= currentPath.endsWith("about.jsp") ? "active" : "" %>">About</a></li>
                               <li><a href="/untitled/user/cakes.jsp" class="nav-link <%= currentPath.endsWith("cakes.jsp") ? "active" : "" %>">Cakes</a></li>
                               <li><a href="/untitled/user/view-cart.jsp" class="nav-link <%= currentPath.endsWith("view-cart.jsp") ? "active" : "" %>"><i class="fas fa-shopping-cart"></i></a></li>


                   <% } %>
            <% if (email != null) { %>
                <li><a href="/untitled/logout" class="nav-link">Logout</a></li>
            <% } else { %>
                <li><a href="/untitled/user/login.jsp" class="nav-link <%= currentPath.endsWith("login.jsp") ? "active" : "" %>">Login</a></li>
            <% } %>
        </ul>
    </nav>
</header>
