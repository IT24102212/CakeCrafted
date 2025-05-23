<%@ page contentType="text/html;charset=UTF-8" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Home - Cake Crafted</title>

    <!-- Styles -->
    <link rel="stylesheet" href="./css/style.css" />
    <link href="https://fonts.googleapis.com/css2?family=Cabin&family=Poiret+One&display=swap" rel="stylesheet" />
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.14.0/css/all.min.css" />
</head>

<body>

<!-- HEADER -->
<jsp:include page="/components/header.jsp" />

<!-- HERO SECTION -->
<section class="hero">
    <div class="container">
        <h1 class="animate-top">Welcome to Cake Crafted</h1>
        <p class="animate-bottom">Baking joy into every occasion with handcrafted cakes and pastries.</p>
        <a href="/untitled/user/cakes.jsp" class="btn-primary hero-btn animate-fade">Order Now</a>
    </div>
</section>


<!-- FEATURES SECTION -->
<section class="about-section">
    <div class="container about-grid">
        <div class="about-text animate-left" style="margin-left: 4rem;">
            <h2 style="font-size: 2.2rem;">Freshly Baked</h2>
            <p style="font-size: 1.2rem;">
                Our cakes are made with the finest ingredients, baked daily with love and creativity. Custom designs for birthdays, weddings, and more.
            </p>
        </div>

        <div class="about-image animate-right">
            <img src="images/pink-cake-final-3.jpg" alt="Cake" style="width: 80%; max-width: 300px; float: right;" />
        </div>
    </div>
</section>

<!-- CUSTOMER REVIEWS SECTION -->
<section class="reviews" style="background-image: url('images/bck4.jpg'); background-size: cover; background-position: center;">
    <div class="container" style="background-color: rgba(255, 255, 255, 0.9); padding: 4rem 2rem; border-radius: 12px;">
        <h2 class="headline headline-dark" style="color: #e91e63;">What Our Customers Say</h2>
        <div class="review-grid animate-bottom">
            <div class="review-card">
                <p>"Absolutely delicious! The chocolate cake was rich and moist. Loved it!"</p>
                <h4>- Sayuni</h4>
            </div>
            <div class="review-card">
                <p>"Amazing designs and on-time delivery. My daughter loved the birthday cake!"</p>
                <h4>- Nethuli</h4>
            </div>
            <div class="review-card">
                <p>"Highly recommend Cake Crafted for any celebration. Great taste and quality."</p>
                <h4>- Tharushi</h4>
            </div>
        </div>
    </div>
</section>
<jsp:include page="/components/faqs.jsp" />

<!-- FOOTER -->
<footer>
    <div class="container footer-content">
        <div class="footer-about">
            <h4 style="color: #e91e63;">About Cake Crafted</h4>
            <p>Your favorite custom cake shop bringing creativity and sweetness to your celebrations.</p>
        </div>
        <div class="footer-social">
            <h4>Connect With Us</h4>
            <a href="#"><i class="fab fa-facebook"></i></a>
            <a href="#"><i class="fab fa-instagram"></i></a>
            <a href="#"><i class="fab fa-twitter"></i></a>
        </div>
    </div>
</footer>

<!-- Scripts -->
<script src="https://unpkg.com/scrollreveal"></script>
<script src="js/app.js" defer></script>
</body>
</html>