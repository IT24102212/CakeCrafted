<%@ page import="java.util.*, models.Cake, utils.FileStorageUtil" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Admin Cake Management - Cake Crafted</title>
    <link href="https://fonts.googleapis.com/css2?family=Poiret+One&family=Cabin&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.14.0/css/all.min.css" />
    <link rel="stylesheet" href="../css/style.css" />


    <style>
        body {
            background-image: url('../images/bck1.webp');
            background-size: cover;
            background-repeat: no-repeat;
            background-position: center;
            font-family: 'Cabin', sans-serif;
            margin: 0;
            padding: 2rem;
            animation: fadeIn 1s ease-in-out;
        }

        @keyframes fadeIn {
            from { opacity: 0; transform: translateY(20px); }
            to   { opacity: 1; transform: translateY(0); }
        }

        h1, h2 {
            color: #e91e63;
            font-family: 'Poiret One', cursive;
            text-align: center;
        }

        .form-wrapper {
            display: flex;
            justify-content: center;
            margin-bottom: 2rem;
        }

        form {
            background-color: rgba(255, 234, 244, 0.95);
            padding: 1.5rem;
            border-radius: 12px;
            width: 100%;
            max-width: 600px;
            box-shadow: 0 4px 10px rgba(0, 0, 0, 0.1);
        }

        input[type="text"],
        input[type="number"] {
            width: 100%;
            padding: 0.7rem;
            margin-bottom: 1rem;
            border-radius: 8px;
            border: 1px solid #ccc;
        }

        input[type="submit"] {
          background-color: #e91e63;
          color: white;
          border: none;
          padding: 0.7rem 1.5rem;
          border-radius: 8px;
          cursor: pointer;
          font-weight: bold;
          transition: background 0.3s ease;

          display: block;
          margin: 1rem auto; /* ← this centers the button */
        }


        input[type="submit"]:hover {
            background-color: #c2185b;
        }

        .table-wrapper {
          max-width: 95vw;
          overflow-x: auto;
          margin: 2rem auto;
          border-radius: 12px;
          box-shadow: 0 4px 10px rgba(0, 0, 0, 0.1);
        }

        table {
          width: 100%;
          min-width: 700px;
          font-size: 0.9rem;
          border-collapse: collapse;
          background-color: rgba(255, 247, 240, 0.95);
        }

        th, td {
          padding: 0.6rem 0.5rem;
          border: 1px solid #ddd;
          text-align: center;
        }

        th {
          background-color: #e91e63;
          color: white;
          font-size: 0.95rem;
        }

        td img {
          border-radius: 5px;
          max-width: 40px;
        }

        input[type="submit"] {
          padding: 0.4rem 0.7rem;
          font-size: 0.8rem;
          border-radius: 6px;
          background-color: #e91e63;
          color: white;
          border: none;
          cursor: pointer;
          transition: background 0.3s ease;
        }

        input[type="submit"]:hover {
          background-color: #c2185b;
        }

        .actions form {
            display: inline-block;
            margin: 0.2rem;
        }

        p {
            text-align: center;
            color: #e91e63;
        }

        .search-form {
          display: flex;
          justify-content: center;
          gap: 0.5rem;
          width: 100%;
          max-width: 400px;
        }

        .search-input {
          flex: 1;
          padding: 0.7rem;
          border-radius: 8px;
          border: 1px solid #ccc;
          font-size: 1rem;
          margin-top:15px
        }

        .search-btn {
          padding: 0.7rem 1rem;
          background-color: #e91e63;
          color: white;
          border: none;
          border-radius: 8px;
          cursor: pointer;
          font-weight: bold;
          transition: background 0.3s ease;
        }

        .search-btn:hover {
          background-color: #c2185b;
        }


.navbar {
    display: flex;
    justify-content: space-between;
    align-items: center;
    padding: 1.5rem 1.5rem;
    background-color: #e91e63;
    color:white;
    box-shadow: 0 4px 6px rgba(0,0,0,0.05);
    position: sticky;
    top: 0;
    bottom :  1.5rem;
    height:3rem;
    z-index: 1000;
}
.nav-list li a:hover,
.nav-list li a.active {
    color:#fdd835;
}

        .navbar .logo {
          font-family: 'Poiret One', cursive;
          font-size: 1.5rem;
          color: white;
          text-decoration: none;
        }

        .nav-list {
          list-style: none;
          display: flex;
          gap: 1.5rem;
          margin: 0;
          padding: 0;
        }

        .nav-list li a {
          color: white;
          text-decoration: none;
          font-weight: bold;
        }

        .navbar-search-form {
          display: flex;
          align-items: center;
          gap: 0.5rem;
        }

        .navbar-search-input {
          padding: 0.5rem 1rem;
          border-radius: 8px;
          border: none;
          font-size: 1rem;
          outline: none;
        }

        .navbar-search-btn {
          padding: 0.5rem 1rem;
          background-color: white;
          color: #e91e63;
          border: none;
          border-radius: 8px;
          cursor: pointer;
          font-weight: bold;
        }

        .navbar-search-btn:hover {
          background-color: #f8bbd0;
        }
.heading-bg {
  background-color: #e91e63;     /* Pink theme color */
  color: white;
  padding: 1rem 2rem;
  text-align: center;
  border-radius: 10px;
  font-family: 'Poiret One', cursive;
  margin: 2rem auto 1.5rem;
  width: fit-content;
  box-shadow: 0 4px 12px rgba(0, 0, 0, 0.1);
}


    </style>
</head>
<body>
<jsp:include page="/components/header.jsp" />

<h1 class="heading-bg">Admin - Cake Management</h1>

<br>


<!-- CREATE NEW CAKE FORM -->
<h2>Create New Cake</h2>
<br>
<div class="form-wrapper">
  <form action="<%= request.getContextPath() %>/cake" method="post">
      <input type="text" name="id" placeholder="Cake ID" required />
      <input type="text" name="name" placeholder="Name" required />
      <input type="text" name="flavor" placeholder="Flavor" required />
      <input type="text" name="size" placeholder="Size" required />
      <input type="text" name="imageUrl" placeholder="Image URL" />
      <input type="number" step="0.01" name="price" placeholder="Price" required />
      <input type="submit" value="Create Cake" />
  </form>
</div>
<br>
<br>


<%
    String cakeId = request.getParameter("cakeId");
    if (cakeId != null) {
        Cake cake = FileStorageUtil.getCakeById(cakeId);
        if (cake != null) {
%>
    <div class="modal-backdrop">
        <div class="modal-box">
            <h2>Cake Details</h2>
            <p><strong>ID:</strong> <%= cake.getId() %></p>
            <p><strong>Name:</strong> <%= cake.getName() %></p>
            <p><strong>Flavor:</strong> <%= cake.getFlavor() %></p>
            <p><strong>Size:</strong> <%= cake.getSize() %></p>
            <p><strong>Price:</strong> ₹<%= cake.getPrice() %></p>
            <p><strong>Image:</strong><br>
                <img src="<%= cake.getImageUrl() %>" width="150" style="margin-top: 10px;" />
            </p>
            <br>
            <a href="#" onclick="document.querySelector('.modal-backdrop').style.display='none';" class="btn-close">Close</a>
        </div>
    </div>
<%
        } else {
            out.println("<div class='modal-box error'>Cake not found!</div>");
        }
    }
%>


<!-- CAKE LIST TABLE -->
<h1>All Cakes</h1>
<div class="table-wrapper">
  <table>
    <tr>
        <th>ID</th>
        <th>Name</th>
        <th>Flavor</th>
        <th>Size</th>
        <th>Price</th>
        <th>Image</th>
        <th>Actions</th>
    </tr>
    <%
        List<Cake> cakes = FileStorageUtil.getAllCakes();
        for (Cake cake : cakes) {
    %>
    <tr>
        <td><%= cake.getId() %></td>
        <td><%= cake.getName() %></td>
        <td><%= cake.getFlavor() %></td>
        <td><%= cake.getSize() %></td>
        <td>Rs.<%= cake.getPrice() %></td>
        <td><img src="<%= cake.getImageUrl() %>" width="40" /></td>
        <td class="actions">
            <div style="display: flex; gap: 0.3rem; justify-content: center;">
                <form action="<%= request.getContextPath() %>/cake" method="post">
                    <input type="hidden" name="_method" value="DELETE" />
                    <input type="hidden" name="id" value="<%= cake.getId() %>" />
                    <input type="submit" value="Delete" />
                </form>
                <form action="edit-cake.jsp" method="get">
                    <input type="hidden" name="id" value="<%= cake.getId() %>" />
                    <input type="submit" value="Edit" />
                </form>
            </div>
        </td>
    </tr>
    <% } %>
  </table>
</div>

<!-- GET CAKE BY ID -->
<h2>Search Cake by ID</h2>
<div class="form-wrapper">
  <form method="get" class="search-form">
    <input type="text" name="cakeId" placeholder="Enter Cake ID..." class="search-input" required />
    <input type="submit" value="🔍 Search" class="search-btn" />
  </form>
</div>

</body>
</html>
