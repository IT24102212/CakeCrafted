<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>About - Cake Crafted</title>

    <!-- Styles -->
    <link rel="stylesheet" href="css/style.css" />
    <link href="https://fonts.googleapis.com/css2?family=Cabin&family=Poiret+One&display=swap" rel="stylesheet" />
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.14.0/css/all.min.css" />
</head>

<body>

<!-- HEADER -->
<jsp:include page="/components/header.jsp" />

<!-- HERO SECTION -->
<section class="hero2 small-hero hero-left">
    <div class="container">
        <h1 class="animate-top">Who We Are?</h1>
        <br>
        <p class="animate-bottom">
            We are a team of cake enthusiasts crafting <br>
            custom cakes that make every occasion unforgettable.<br>
            With creativity and love for baking, we bring your sweetest moments to life.
        </p>
    </div>
</section>


<!-- ABOUT SECTION -->
<section class="about-section">
    <div class="container about-grid">
        <div class="about-image animate-left">
            <img src="images/cupcake.png" alt="Cake" style="width: 400px; height: auto;" />
        </div>
        <div class="about-text animate-right" style="margin-left: 30px;">
            <h2 style="font-size: 80px">Our Story</h2>
            <p>We started with a dream to deliver joy through cakes. Every bite is a celebration crafted with care and creativity.</p>
            <p>From birthdays to weddings, we make each event sweeter with our custom designs and flavors.</p>
        </div>
    </div>
</section>

<!-- REVIEW PART -->
<section class="join-us" style="background-image: url('images/OIP (1).jpg'); background-size: cover; background-position: center; background-repeat: no-repeat;">
    <div class="container">
        <div class="row">
            <section class="review-form animate-left" style="padding: 80px; background-color: #fff0f5;">
                <h2 style="color: #e91e63;">Leave a Review</h2>
                <form action="submitReview" method="post">
                    <input type="text" name="name" placeholder="Your Name" required style="margin: 10px; padding: 10px; width: 300px;"><br>
                    <textarea name="message" placeholder="Your Review" required style="margin: 10px; padding: 10px; width: 300px; height: 100px;"></textarea><br>
                    <button type="submit" style="background-color: #e91e63; color: white; border: none; padding: 10px 20px;">Submit</button>
                </form>
            </section>

            <div class="image padding-right animate-right">
                <img src="images/stall.png" alt="bread" style="width: 450px; height: auto; float: right;" />
            </div>
        </div>
    </div>
</section>

<!-- FOOTER -->
<footer>
    <div class="container footer-content">
        <div class="footer-about">
            <h4>About Cake Crafted</h4>
            <p>Cake Crafted brings warmth and sweetness to your celebrations. Baked fresh, made with love.</p>
        </div>
        <div class="footer-social">
            <h4>Follow Us</h4>
            <a href="#"><i class="fab fa-facebook"></i></a>
            <a href="#"><i class="fab fa-instagram"></i></a>
            <a href="#"><i class="fab fa-twitter"></i></a>
        </div>
    </div>
</footer>

<!-- ✅ SCRIPTS -->
<script src="https://unpkg.com/scrollreveal"></script>
<script src="js/app.js" defer></script>
</body>
</html>
