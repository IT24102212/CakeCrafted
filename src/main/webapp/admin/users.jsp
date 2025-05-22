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
        <tr><th>Username</th><th>Role</th></tr>
        <%
            List<User> users = (List<User>) request.getAttribute("users");
            if (users != null) {
                for (User user : users) {
        %>
        <tr>
            <td><%= user.getUsername() %></td>
            <td><%= user.getRole() %></td>
        </tr>
        <%
                }
            }
        %>
    </table>
</body>
</html>
