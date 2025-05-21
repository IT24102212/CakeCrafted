<%@ page import="java.util.List" %>
<%@ page import="models.Feedback" %>
<html>
<head>
    <title>Admin - User Feedback</title>
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

        h1 {
            text-align: center;
            font-size: 48px;
            margin-bottom: 30px;
            animation: fadeInDown 1s ease-out;
        }

        table {
            width: 80%;
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
            text-align: left;
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
    <h1>User Feedback</h1>
    <table border="1">
        <tr><th>Name</th><th>Message</th></tr>
        <%
            List<Feedback> feedbacks = (List<Feedback>) request.getAttribute("feedbacks");
            if (feedbacks != null) {
                for (Feedback fb : feedbacks) {
        %>
        <tr>
            <td><%= fb.getName() %></td>
            <td><%= fb.getMessage() %></td>
        </tr>
        <%
                }
            }
        %>
    </table>
</body>
</html>
