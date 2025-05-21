<%@ page contentType="text/html;charset=UTF-8" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Login - Cake Crafted</title>

    <!-- Fonts & Main Styles -->
    <link href="https://fonts.googleapis.com/css2?family=Poiret+One&family=Cabin&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="css/style.css">

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
         flex-direction: column;
         height: 100vh;
         margin: 0;
         animation: fadeInBody 1s ease-in-out;
       }

       @keyframes fadeInBody {
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
            font-size: 2rem;
            font-family: 'Poiret One', cursive;
            margin-bottom: 1rem;
        }

        p {
            font-size: 1.1rem;
            color: #333;
        }

        .login-message-box {
            background-color: #ffeaf4;
            padding: 2rem 3rem;
            border-radius: 12px;
            text-align: center;
            box-shadow: 0 4px 10px rgba(0, 0, 0, 0.08);
        }

        .register-link {
            margin-top: 1rem;
            font-size: 1rem;
            color: #444;
        }

        .register-link a {
            color: #e91e63;
            font-weight: bold;
            text-decoration: none;
        }

        .register-link a:hover {
            text-decoration: underline;
        }
    </style>
</head>
<body>

<div class="login-message-box">
    <h2>You are registered successfully!</h2>



</div>

</body>
</html>
