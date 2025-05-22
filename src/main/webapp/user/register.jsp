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
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Register - Cake Crafted</title>
    <link rel="stylesheet" href="<%= request.getContextPath() %>/css/style.css" />
    <link href="https://fonts.googleapis.com/css2?family=Cabin&family=Poiret+One&display=swap" rel="stylesheet">
    <style>
        /* Navbar styles */
        header {
            background-color: #fff0f6;
            padding: 1rem 3rem;
            box-shadow: 0 2px 5px rgba(0,0,0,0.1);
            position: sticky;
            top: 0;
            z-index: 1000;
        }
        .navbar {
            display: flex;
            align-items: center;
            justify-content: space-between;
        }
        .logo {
            font-family: 'Poiret One', cursive;
            font-size: 1.8rem;
            color: #e91e63;
            text-decoration: none;
            font-weight: bold;
        }
        .nav-list {
            list-style: none;
            display: flex;
            gap: 1.5rem;
            margin: 0;
            padding: 0;
        }
        .nav-link {
            text-decoration: none;
            font-family: 'Cabin', sans-serif;
            font-weight: 600;
            color: #e91e63;
            transition: color 0.3s ease;
        }
        .nav-link:hover, .nav-link.active {
            color: #c2185b;
        }

        /* Register page styles */
        body {
          background-image: url('../images/cupback.jpg');
            background-size: cover;
            background-repeat: no-repeat;
            background-position: center;
            font-family: 'Poiret One', cursive;
            display: flex;
            justify-content: center;
            align-items: center;
            min-height: 100vh;
            margin: 0;
            flex-direction: column;
        }

        .register-container {
            background-color: #ffeaf4;
            padding: 2rem 3rem;
            border-radius: 12px;
            box-shadow: 0 4px 12px rgba(0, 0, 0, 0.1);
            width: 350px;
            margin-top: 2rem;
        }

        h2 {
            text-align: center;
            color: #e91e63;
            margin-bottom: 1.5rem;
        }

        input[type="text"],
        input[type="password"] {
            width: 100%;
            padding: 0.75rem;
            margin-bottom: 1rem;
            border: 1px solid #ccc;
            border-radius: 8px;
            font-size: 1rem;
        }

   @keyframes fadeInUp {
            from {
                opacity: 0;
                transform: translateY(30px);
            }
            to {
                opacity: 1;
                transform: translateY(0);
            }
        }
        input[type="submit"] {
            width: 100%;
            padding: 0.75rem;
            background-color: #e91e63;
            color: white;
            font-weight: bold;
            border: none;
            border-radius: 8px;
            cursor: pointer;
            transition: background 0.3s ease;
        }

        input[type="submit"]:hover {
            background-color: #c2185b;
        }
          .register-link {
                    margin-top: 1rem;
                    font-size: 0.9rem;
                }

                .register-link a {
                    color: #e91e63;
                    text-decoration: none;
                    font-weight: bold;
                }

                .register-link a:hover {
                    text-decoration: underline;
                }
                .form-group {
                    margin-bottom: 1rem;
                }

                .form-group label {
                    display: block;
                    margin-bottom: 0.5rem;
                    font-weight: bold;
                    color: #e91e63;
                }

                .form-group input {
                    width: 100%;
                    padding: 0.75rem;
                    border: 1px solid #ccc;
                    border-radius: 8px;
                    font-size: 1rem;
                }


        .error-message {
            color: red;
            text-align: center;
            margin-bottom: 1rem;
        }
    </style>
</head>
<body>



<div class="register-container">
    <h2>Register</h2>

    <% if (request.getAttribute("message") != null) { %>
        <p class="error-message"><%= request.getAttribute("message") %></p>
    <% } %>

    <form action="<%= request.getContextPath() %>/register" method="post">
       <div class="form-group">
           <label for="username">Email:</label>
           <input type="email" id="username" name="username" required />
       </div>

       <div class="form-group">
           <label for="password">Password:</label>
           <input type="password" id="password" name="password" required />
       </div>

       <div class="form-group">
           <label for="role">Role:</label>
           <input type="text" id="role" name="role" required />
       </div>


        <input type="submit" value="Register" />

        <!-- Login Link -->
        <div class="register-link">
            Already have an account?
            <a href="<%= request.getContextPath() %>/user/login.jsp">Login</a>
        </div>

    </form>
</div>

</body>
</html>