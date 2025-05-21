<%@ page import="java.util.List" %>
<%@ page import="models.User" %>

<html>
<head>
    <title>Admin - Users</title>
    <link rel="stylesheet" href="../css/style.css" />

    <style>
        body {
            margin: 0;
            font-family: 'Poiret One', cursive;
            background: url('../images/bck1.webp') no-repeat center center fixed;
            background-size: cover;
            color: #e91e63;
            padding: 40px;
        }

        h1 {
            text-align: center;
            font-size: 48px;
            animation: slideDown 1s ease-out;
        }

        table {
            width: 80%;
            margin: 40px auto;
            border-collapse: collapse;
            background-color: rgba(255, 255, 255, 0.95);
            border-radius: 15px;
            overflow: hidden;
            animation: fadeIn 1.5s ease;
            box-shadow: 0 8px 20px rgba(0, 0, 0, 0.2);
        }

        th, td {
            padding: 16px;
            text-align: center;
            font-size: 18px;
        }

        th {
            background-color: #e91e63;
            color: #fff;
        }

        tr:nth-child(even) {
            background-color: #fce4ec;
        }

        tr:nth-child(odd) {
            background-color: #f8bbd0;
        }

        select {
            padding: 6px;
            border-radius: 4px;
            border: 1px solid #ccc;
        }

        button {
            padding: 6px 12px;
            border: none;
            background-color: #e91e63;
            color: #fff;
            border-radius: 4px;
            cursor: pointer;
            margin-left: 10px;
        }

        button:hover {
            background-color: #c2185b;
        }

        @keyframes fadeIn {
            from { opacity: 0; transform: translateY(20px); }
            to { opacity: 1; transform: translateY(0); }
        }

        @keyframes slideDown {
            from { opacity: 0; transform: translateY(-30px); }
            to { opacity: 1; transform: translateY(0); }
        }
    </style>
</head>
<body>
<jsp:include page="/components/header.jsp" />
<h1>All Users</h1>

<table border="1">
    <tr>
        <th>Email</th>
        <th>Role</th>
        <th>Change Role</th>
    </tr>
    <%
        List<User> users = (List<User>) request.getAttribute("users");
        if (users != null) {
            for (User user : users) {
    %>
    <tr>
        <td><%= user.getEmail() %></td>
        <td><%= user.getRole() %></td>
        <td>
            <form action="<%= request.getContextPath() %>/UpdateRoleServlet" method="post">
                <input type="hidden" name="email" value="<%= user.getEmail() %>" />
                <select name="newRole">
                    <option value="user" <%= user.getRole().equals("user") ? "selected" : "" %>>User</option>
                    <option value="ADMIN" <%= user.getRole().equals("ADMIN") ? "selected" : "" %>>Admin</option>
                    <option value="BAN" <%= user.getRole().equals("BAN") ? "selected" : "" %>>Ban</option>
                </select>
                <button type="submit">Update</button>
            </form>
        </td>
    </tr>
    <%
            }
        }
    %>
</table>
</body>
</html>
