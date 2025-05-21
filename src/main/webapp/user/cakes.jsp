<%@ page import="models.Cake, utils.FileStorageUtil, java.util.List" %>
<%
    List<Cake> cakes = FileStorageUtil.getAllCakes();
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Cakes - Cake Crafted</title>

    <!-- Styles and Fonts -->
    <link rel="stylesheet" href="../css/style.css" />
    <link href="https://fonts.googleapis.com/css2?family=Cabin&family=Poiret+One&display=swap" rel="stylesheet" />
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.14.0/css/all.min.css" />

    <!-- Scroll Reveal -->
    <script src="https://unpkg.com/scrollreveal"></script>
    <script src="../js/app.js" defer></script>


</head>
<body>

<!-- HEADER -->
<jsp:include page="/components/header.jsp" />

<!-- HERO SECTION -->
<section class="hero " id="hero" >
    <div class="container">
        <h1 class="animate-top">Explore Our Cakes</h1>
           <p class="animate-bottom">Enter a world of magic and sweetness where every cake holds a story and every bite is pure enchantment. <br>
                View our cakes and taste the fantasy!</p>
    </div>
</section>


<!-- DYNAMIC CAKE LIST SECTION -->
<section class="cake-types" style="
    padding: 50px;
    background-image: url('../images/bck10.webp');
    background-size: cover;
    background-position: center;
    background-repeat: no-repeat;
">
    <div class="container">
        <h2 style="text-align: center; color: #e91e63; font-size: 48px;" class="animate-top">Our Cake Collection</h2>
        <div class="cake-grid" style="display: flex; flex-wrap: wrap; justify-content: center; gap: 30px; margin-top: 40px;">

            <% for (Cake cake : cakes) { %>
                <div class="cake-card animate-left" style="
                    width: 250px;
                    border: 2px solid #e91e63;
                    border-radius: 15px;
                    overflow: hidden;
                    text-align: center;
                    background: rgba(255, 255, 255, 0.9);
                    transition: transform 0.3s ease, box-shadow 0.3s ease;
                ">
                    <img src="<%= cake.getImageUrl() %>" alt="<%= cake.getName() %>" style="
                        width: 100%;
                        height: 180px;
                        object-fit: cover;
                        border-top-left-radius: 15px;
                        border-top-right-radius: 15px;
                    ">
                    <h3 style="color: #e91e63; padding: 15px;"><%= cake.getName() %></h3>
                    <p>Flavor: <%= cake.getFlavor() %></p>
                    <p>Size: <%= cake.getSize() %></p>
                    <p><strong>Rs. <%= cake.getPrice() %></strong></p>
                    <form method="post" action="<%= request.getContextPath() %>/cart">
                        <input type="hidden" name="cakeId" value="<%= cake.getId() %>" />
                        <button type="submit" style="
                            background-color: #e91e63;
                            color: white;
                            border: none;
                            padding: 10px 20px;
                            margin-bottom: 15px;
                            border-radius: 8px;
                            cursor: pointer;
                            transition: background-color 0.3s ease;
                        " onmouseover="this.style.backgroundColor='#d81b60'" onmouseout="this.style.backgroundColor='#e91e63'">
                            Add to Cart
                        </button>
                    </form>
                </div>
            <% } %>

        </div>
    </div>
</section>

<!-- VIEW CART LINK -->
<div style="text-align: center; margin-top: 30px;">
    <a href="view-cart.jsp" class="nav-link" style="font-size: 18px; color: #e91e63; text-decoration: underline;">
        View Cart
    </a>
</div>
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