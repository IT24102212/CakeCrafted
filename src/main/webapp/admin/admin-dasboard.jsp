<%@ page contentType="text/html;charset=UTF-8" %>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8" />
  <meta name="viewport" content="width=device-width, initial-scale=1.0"/>


  <title>Admin Dashboard - Cake Crafted</title>

  <!-- External Resources -->
  <link rel="stylesheet" href="../css/style.css" />
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.14.0/css/all.min.css" />
  <link href="https://fonts.googleapis.com/css2?family=Poiret+One&family=Cabin&display=swap" rel="stylesheet" />
  <script src="https://unpkg.com/scrollreveal"></script>

  <style>
    body {
      background-image: url('../images/bck7.jpg');
      background-size: cover;
      background-repeat: no-repeat;
      background-position: center;
      font-family: 'Cabin', sans-serif;
        padding: 0;
          display: flex;
          flex-direction: column;
          min-height: 100vh;
          margin: 0;
    }

    header {
      background-color: #e91e63;
      color: white;
      padding: 1rem 2rem;
      text-align: center;
    }

    header h1 {
      margin: 0;
      font-size: 2rem;
      font-family: 'Poiret One', cursive;
    }

   .dashboard {
     padding: 2rem;
     display: flex;
     flex-direction: column;
     gap: 2rem;
   }

   .dashboard-top,
   .dashboard-bottom {
     display: grid;
     gap: 2rem;
   }

   .dashboard-top {
     grid-template-columns: repeat(3, 1fr);
   }

   .dashboard-bottom {
     grid-template-columns: repeat(3, 240px);
     justify-content: center; /* ✅ Center the bottom row */
   }



    .card {
      background-color: #fff7f0;
      border-radius: 12px;
      box-shadow: 0 8px 16px rgba(0, 0, 0, 0.1);
      padding: 2rem;
      text-align: center;
      transition: transform 0.3s ease;
      cursor: pointer;
      animation: fadeInUp 1s ease;
    }

    .card:hover {
      transform: translateY(-5px);
    }

    .card i {
      font-size: 2rem;
      color: #e91e63;
      margin-bottom: 1rem;
    }

    .card h3 {
      margin: 0;
      color: #333;
      font-size: 1.2rem;
    }

    .card p {
      margin-top: 0.5rem;
      color: #777;
    }

    .logout {
      margin-top: auto;
      text-align: center;
      padding: 2rem 0;
      font-color: #fff7f0;
    }

    .logout-btn {
      display: inline-block;
      padding: 0.75rem 1.5rem;
      background-color: #e91e63; /* pink background */
      color: #fff7f0;
      border-radius: 8px;
      font-weight: bold;
      text-decoration: none;
      font-size: 1rem;
      transition: background 0.3s ease;
    }

    .logout-btn:hover {
      background-color: #c2185b;
    }

    .logout a {
      color: #fff7f0;
      text-decoration: none;
      font-weight: bold;
      font-size: 1rem;
    }

    .logout a:hover {
      text-decoration: underline;
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
  </style>
</head>
<body>

<header>
  <h1>Admin Dashboard - Cake Crafted</h1>
</header>

<section class="dashboard">

  <div class="dashboard-top">
  <!-- Manage Cakes -->
  <a href="admin-cake.jsp" class="card animate-top">
    <i class="fas fa-birthday-cake"></i>
    <h3>Manage Cakes</h3>
    <p>Add, edit, or remove cakes</p>
  </a>

  <!-- Customers -->
  <a href="users" class="card animate-top">
    <i class="fas fa-users"></i>
    <h3>Customers</h3>
    <p>View and manage users</p>
  </a>

  <!-- Orders -->
  <a href="orders" class="card animate-top">
    <i class="fas fa-box"></i>
    <h3>Orders</h3>
    <p>Check and process orders</p>
  </a>
  </div>

  <!-- Payments -->
   <div class="dashboard-bottom">
  <a href="payments" class="card animate-top">
    <i class="fas fa-credit-card"></i>
    <h3>Payments</h3>
    <p>View payment history</p>
  </a>

   <a href="feedbacks" class="card animate-top">
     <i class="fas fa-comments"></i>
     <h3>Feedback</h3>
     <p>View user reviews</p>
   </a>
     <a href="faqs.jsp" class="card animate-top">
        <i class="fas fa-comments"></i>
        <h3>FAQ</h3>
        <p>View user reviews</p>
      </a>
   </div>

</section>

<div class="logout">

  <a href="/untitled/logout" class="logout-btn"><i class="fas fa-sign-out-alt"></i> Logout</a>
</div>



<script>
  // Scroll animation
  ScrollReveal().reveal('.animate-top', {
    origin: 'top',
    distance: '40px',
    duration: 1000,
    delay: 200,
    easing: 'ease-in-out'
  });
</script>

</body>
</html>
