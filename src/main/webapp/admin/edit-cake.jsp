<%@ page import="models.Cake, utils.FileStorageUtil" %>
<%
    String id = request.getParameter("id");
    Cake cake = FileStorageUtil.getCakeById(id);
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Edit Cake - Cake Crafted</title>
    <link href="https://fonts.googleapis.com/css2?family=Poiret+One&family=Cabin&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="../css/style.css" />


    <style>
        body {
             background-image: url('../images/bck7.jpg');
                        background-size: cover;
                        background-repeat: no-repeat;
               background-position: center;
            font-family: 'Cabin', sans-serif;
            display: flex;
            justify-content: center;
            align-items: center;
            min-height: 100vh;
            margin: 0;


        }

        .edit-container {
            background-color: #ffeaf4;
            padding: 2rem 3rem;
            border-radius: 12px;
            box-shadow: 0 6px 12px rgba(0, 0, 0, 0.1);
            width: 400px;
            text-align: center;
            animation: fadeIn 1s ease-in-out;

        }

        h2 {
            color: #e91e63;
            font-family: 'Poiret One', cursive;
            margin-bottom: 1rem;
        }

        form {
            display: flex;
            flex-direction: column;
        }

        label,
        input[type="text"],
        input[type="number"] {
            margin-bottom: 1rem;
            font-size: 1rem;
            font-family: 'Cabin', sans-serif;
        }

        input[type="text"],
        input[type="number"] {
            padding: 0.6rem;
            border-radius: 8px;
            border: 1px solid #ccc;
        }

        input[type="submit"] {
            background-color: #e91e63;
            color: white;
            font-weight: bold;
            border: none;
            padding: 0.75rem;
            border-radius: 8px;
            cursor: pointer;
            transition: background 0.3s ease;
        }

        input[type="submit"]:hover {
            background-color: #c2185b;
        }

        .back-link {
            margin-top: 1.5rem;
            display: inline-block;
            color: #e91e63;
            text-decoration: none;
            font-weight: bold;
        }

        .back-link:hover {
            text-decoration: underline;
        }

        p {
            color: #e91e63;
            font-size: 1.1rem;
        }
    </style>
</head>
<body>

<div class="edit-container">
    <h2>Edit Cake: <%= id %></h2>
    <% if (cake != null) { %>
        <form method="post" action="<%= request.getContextPath() %>/cake">
            <input type="hidden" name="_method" value="PUT" />
            <input type="hidden" name="id" value="<%= cake.getId() %>" />

            Name: <input type="text" name="name" value="<%= cake.getName() %>" required />
            Flavor: <input type="text" name="flavor" value="<%= cake.getFlavor() %>" required />
            Size: <input type="text" name="size" value="<%= cake.getSize() %>" required />
            Image URL: <input type="text" name="imageUrl" value="<%= cake.getImageUrl() %>" />
            Price: <input type="number" step="0.01" name="price" value="<%= cake.getPrice() %>" required />

            <input type="submit" value="Update" />
        </form>
    <% } else { %>
        <p>Cake not found.</p>
    <% } %>

    <a href="admin-cake.jsp" class="back-link"> Back</a>
</div>

</body>
</html>
