<!-- /WEB-INF/pages/users/login.jsp -->
<%@ page contentType="text/html;charset=UTF-8" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Login - Cake Crafted</title>

    <!-- Fonts & Icons -->
    <link href="https://fonts.googleapis.com/css2?family=Cabin&family=Poiret+One&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.14.0/css/all.min.css" />

    <!-- Optional Global Stylesheet -->
    <link rel="stylesheet" href="css/style.css" />

    <style>
        /* Body Styling */
        body {
            margin: 0;
            font-family: 'Cabin', sans-serif;
            background-image: url('../images/cupback.jpg');
            background-size: cover;
            background-repeat: no-repeat;
            background-position: center;
            min-height: 100vh;
            padding-top: 80px; /* Space for fixed navbar */
            display: flex;
            justify-content: center;
            align-items: flex-start;
        }

        /* Navbar Styles */
        header {
            background-color: #ffe4ec;
            padding: 10px 20px;
            position: fixed;
            top: 0;
            left: 0;
            width: 100%;
            z-index: 999;
            box-shadow: 0 2px 6px rgba(0, 0, 0, 0.1);
        }

        .navbar {
            display: flex;
            justify-content: space-between;
            align-items: center;
            max-width: 1200px;
            margin: auto;
        }

        .navbar-logo {
            font-family: 'Poiret One', cursive;
            font-size: 1.5rem;
            color: #e91e63;
            text-decoration: none;
        }

        .navbar-menu {
            display: flex;
            gap: 25px;
        }

        .navbar-menu a {
            text-decoration: none;
            font-weight: bold;
            color: #333;
            font-family: 'Cabin', sans-serif;
            transition: color 0.3s ease;
        }

        .navbar-menu a:hover {
            color: #e91e63;
        }

        /* Login Box Styling */
        .login-box {
            background-color: rgba(255, 234, 244, 0.95);
            padding: 2rem 3rem;
            border-radius: 12px;
            box-shadow: 0 4px 12px rgba(0, 0, 0, 0.15);
            width: 350px;
            text-align: center;
            animation: fadeInUp 1s ease-in-out;
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

        h2 {
            color: #e91e63;
            font-family: 'Poiret One', cursive;
            font-size: 2rem;
            margin-bottom: 1.5rem;
        }

        label {
            display: block;
            text-align: left;
            margin-bottom: 0.25rem;
            font-weight: bold;
            color: #444;
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

        input[type="submit"] {
            width: 100%;
            background-color: #e91e63;
            color: white;
            padding: 0.75rem;
            border: none;
            border-radius: 8px;
            font-weight: bold;
            font-size: 1rem;
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
    </style>
</head>
<body>



<!-- Login Box -->
<div class="login-box">
    <h2>Login</h2>
    <form action="<%= request.getContextPath() %>/login" method="post">
        <label for="username">Email:</label>
        <input type="email" id="username" name="username" required />

        <label for="password">Password:</label>
        <input type="password" id="password" name="password" required />


        <input type="submit" value="Login" />

        <!-- Register Link -->
        <div class="register-link">
            Don’t have an account?
            <a href="<%= request.getContextPath() %>/user/register.jsp">Register</a>
        </div>
    </form>
</div>

</body>
</html>