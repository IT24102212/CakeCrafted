<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Bakers - Cake Crafted</title>

    <!-- Styles -->
    <link rel="stylesheet" href="css/style.css" />
    <link href="https://fonts.googleapis.com/css2?family=Cabin&family=Poiret+One&display=swap" rel="stylesheet" />
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.14.0/css/all.min.css" />
    <script src="https://unpkg.com/scrollreveal"></script>
    <script src="js/app.js" defer></script>
</head>
<body>
<!-- HEADER -->
<jsp:include page="/components/header.jsp" />
<!-- HEADER -->
<header>
    <nav class="navbar">
        <a href="index.jsp" class="logo">Cake Crafted</a>
        <ul class="nav-list">
            <li><a href="index.jsp" class="nav-link">Home</a></li>
            <li><a href="about.jsp" class="nav-link">About</a></li>
            <li><a href="bakers.jsp" class="nav-link active">Bakers</a></li>
            <li><a href="cart.jsp" class="nav-link"><i class="fas fa-shopping-cart"></i> Cart</a></li>
        </ul>
    </nav>
</header>

<!-- HERO SECTION -->
<section class="hero small-hero" id="hero">
    <div class="container">
        <h1 class="animate-top">Meet Our Bakers</h1>
        <p class="animate-bottom">Our bakers are the heart of every creation, blending passion, skill, and creativity to craft cakes that not only taste amazing but look stunning.</p>
    </div>
</section>

<!-- BAKERS SECTION -->
<section class="bakers animate-top" style="background-color: #ffe4e1;">
    <div class="container">
        <div class="global-headline">
            <h2 class="sub-headline animate-top">Our</h2>
            <h3 class="headline animate-top" style="color:#e91e63;">Creative Bakers</h3>
            <div class="asterisk animate-top"><i class="fas fa-asterisk"></i></div>
        </div>
        <div class="bakers__container">
            <%-- Baker Cards --%>
            <jsp:include page="partials/baker_card.jsp">
                <jsp:param name="name" value="Sayuni" />
            </jsp:include>
            <jsp:include page="partials/baker_card.jsp">
                <jsp:param name="name" value="Bimsara" />
            </jsp:include>
            <jsp:include page="partials/baker_card.jsp">
                <jsp:param name="name" value="Mehali" />
            </jsp:include>
            <jsp:include page="partials/baker_card.jsp">
                <jsp:param name="name" value="Malshi" />
            </jsp:include>
        </div>
    </div>
</section>

<!-- CAKE TYPES SECTION -->
<jsp:include page="partials/cake_cards.jsp" />

<!-- FOOTER -->
<footer>
    <div class="container footer-content">
        <div class="footer-about animate-top">
            <h4>About Cake Crafted</h4>
            <p>We craft cakes that tell stories — baked fresh, made with heart, and delivered with joy.</p>
        </div>
        <div class="footer-social animate-bottom">
            <h4>Stay Connected</h4>
            <a href="#"><i class="fab fa-facebook-f"></i></a>
            <a href="#"><i class="fab fa-twitter"></i></a>
            <a href="#"><i class="fab fa-instagram"></i></a>
            <a href="#"><i class="fab fa-pinterest"></i></a>
        </div>
    </div>
</footer>

</body>
</html>
