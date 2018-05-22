
<%@ page import="dao.ProductDao" %>
<%@ page import="model.products.Product" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <%@page pageEncoding="UTF-8" %>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>ТехСвят - моят технологичен свят</title>
    <link rel="shortcut icon" type="image/x-icon" href="../../Desktop/magazin/img/favicon.ico" />

    <!-- Google Fonts -->
    <link href='/css/titilium_font.css' rel='stylesheet' type='text/css'>
    <link href='/css/roboto_font.css' rel='stylesheet' type='text/css'>
    <link href='/css/railway_font.css' rel='stylesheet' type='text/css'>

    <!-- Bootstrap -->
    <link rel="stylesheet" href="/css/bootstrap.min.css">

    <!-- Font Awesome -->
    <link rel="stylesheet" href="/css/font-awesome.min.css">

    <!-- Custom CSS -->
    <link rel="stylesheet" href="/css/owl.carousel.css">
    <link rel="stylesheet" href="/style.css">
    <link rel="stylesheet" href="/css/responsive.css">

</head>
<body>

<div class="header-area">
    <div class="container">
        <div class="row">
            <div class="col-md-8">
                <div class="user-menu">
                    <ul>
                        <li><a href="user.jsp"><i class="fa fa-user"></i> Моят акаунт</a></li>
                        <li><a href="cart.jsp"><i class="fa fa-user"></i> Моята количка</a></li>
                    </ul>
                </div>
            </div>

            <div class="col-md-4">
                <div class="header-right">
                    <ul class="list-unstyled list-inline">
                        <li><a href="login.jsp"><i class="fa fa-user"></i> Влез в акаунт</a></li>
                    </ul>
                </div>
            </div>
        </div>
    </div>
</div> <!-- End header area -->

<div class="site-branding-area">
    <div class="container">
        <div class="row">
            <div class="col-sm-6">
                <div class="logo">
                    <h1><a href="index.jsp"><img src="/img/logo.png"></a></h1>
                </div>
            </div>

            <div class="col-sm-6">
                <div class="shopping-item">
                    <a href="cart.jsp">Количка - <span class="cart-amunt">$100</span> <i class="fa fa-shopping-cart"></i> <span class="product-count">5</span></a>
                </div>
            </div>
        </div>
    </div>
</div> <!-- End site branding area -->

<div class="mainmenu-area">
    <div class="container">
        <div class="row">
            <div class="navbar-collapse collapse">
                <ul class="nav navbar-nav">
                    <li><a href="index.jsp">Начало</a></li>
                    <li class="active"><a href="shop.jsp">Магазин</a></li>
                    <li><a href="cart.jsp">Количка</a></li>
                    <li><a href="#">Категории</a></li>
                    <li><a href="contacts.jsp">Контакти</a></li>
                </ul>
            </div>
        </div>
    </div>
</div> <!-- End mainmenu area -->

<div class="product-big-title-area">
    <div class="container">
        <div class="row">
            <div class="col-md-12">
                <div class="product-bit-title text-center">
                    <h2>Магазин</h2>
                </div>
            </div>
        </div>
    </div>
</div>


<div class="single-product-area">
    <div class="zigzag-bottom"></div>
    <div class="container">
        <div class="row">
            <div class="category-list" id="category-list">
                <ul>
                    <li>
                        <img src="img\accessory.jpg" onclick="loadData('Accessory');">
                    </li>

                    <li>
                        <img src="img\components.jpg" onclick="loadData('Components');">
                    </li>

                    <li>
                        <img src="img\laptop.jpg" onclick="loadData('Laptop');">
                    </li>

                    <li>
                        <img src="img\pc.jpg" onclick="loadData('Personal_Computer');">
                    </li>

                    <li>
                        <img src="img\monitor.jpg" onclick="loadData('Monitor');">
                    </li>

                    <li>
                        <img src="img\networking.jpg" onclick="loadData('Networking');">
                    </li>

                    <li>
                        <img src="img\peripherals.jpg" onclick="loadData('Peripherals');">
                    </li>
                </ul>
            </div><!-- /.category-list -->
        </div>
    </div>
</div>


<div class="footer-top-area">
    <div class="zigzag-bottom"></div>
    <div class="container">
        <div class="row">
            <div class="col-md-3 col-sm-6">
                <div class="footer-about-us">
                    <h2>тех<span>Свят</span></h2>
                    <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Perferendis sunt id doloribus vero quam laborum quas alias dolores blanditiis iusto consequatur, modi aliquid eveniet eligendi iure eaque ipsam iste, pariatur omnis sint! Suscipit, debitis, quisquam. Laborum commodi veritatis magni at?</p>
                    <div class="footer-social">
                        <a href="#" target="_blank"><i class="fa fa-facebook"></i></a>
                        <a href="#" target="_blank"><i class="fa fa-twitter"></i></a>
                        <a href="#" target="_blank"><i class="fa fa-youtube"></i></a>
                        <a href="#" target="_blank"><i class="fa fa-linkedin"></i></a>
                    </div>
                </div>
            </div>

            <div class="col-md-3 col-sm-6">
                <div class="footer-menu">
                    <h2 class="footer-wid-title">Навигация </h2>
                    <ul>
                        <li><a href="#">Моят акаунт</a></li>
                        <li><a href="#">Моята количка</a></li>
                        <li><a href="#">История на поръчките</a></li>
                        <li><a href="#">Магазин</a></li>
                        <li><a href="#">Контакти</a></li>
                    </ul>
                </div>
            </div>

            <div class="col-md-3 col-sm-6">
                <div class="footer-menu">
                    <h2 class="footer-wid-title">Категории</h2>
                    <ul>
                        <li><a href="#">Настолни компютри</a></li>
                        <li><a href="#">Лаптопи</a></li>
                        <li><a href="#">Ъпгрейд</a></li>
                        <li><a href="#">Периферия</a></li>
                        <li><a href="#">Wireless and Networking</a></li>
                    </ul>
                </div>
            </div>

            <div class="col-md-3 col-sm-6">
                <div class="footer-newsletter">
                    <h2 class="footer-wid-title">Вестник</h2>
                    <p>Абонирайте се за нашият вестник и получавайте винаги най-новите и актуални оферти от нас!</p>
                    <div class="newsletter-form">
                        <form action="#">
                            <input type="email" placeholder="Въведете вашият имейл">
                            <input type="submit" value="Абонирай се">
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div> <!-- End footer top area -->

<!-- Latest jQuery form server -->
<script src="https://code.jquery.com/jquery.min.js"></script>

<!-- Bootstrap JS form CDN -->
<script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.2.0/js/bootstrap.min.js"></script>

<!-- jQuery sticky menu -->
<script src="/js/owl.carousel.min.js"></script>
<script src="/js/jquery.sticky.js"></script>

<!-- jQuery easing -->
<script src="/js/jquery.easing.1.3.min.js"></script>

<!-- Initializer Script -->
<script src="/js/main.js"></script>

<script>
    function loadData(categoryName) {
        var request = new XMLHttpRequest();
        var productData = {
            id_product: 0,
            product_brand: '',
            product_model: '',
            product_price: '',
            product_description: '',
            category: { id_category: '', category_name: ''}
        };

        request.open("get", '/CategoryListServlet?category=' + categoryName, true);
        request.onreadystatechange = function () {
            if (request.readyState == 4) {
                if (request.status === 200) {
                    productData = JSON.parse(this.responseText);
                    document.getElementById("category-list").innerHTML = "";
                    for(var i = 0; i < productData.length; i++) {
                        var image = productData[i].product_image;
                        var brand = productData[i].product_brand;
                        var model = productData[i].product_model;
                        var price = productData[i].product_price;
                        var id = productData[i].id_product;

                        document.getElementById("category-list").innerHTML += "<div class=\"col-md-3 col-sm-6\">" +
                            "<div class=\"single-shop-product\">" +
                            "<form action=\"ShoppingCartServlet\" method=\"POST\">" +
                            "<div class=\"product-upper\">" +
                            "<img src=\""+image+"\">" +
                            "</div>" +
                            "<h2><a href=\"#\">"+brand+" "+model+"</a></h2>" +
                            "<div class=\"product-carousel-price\">" +
                            "<ins>"+ price+"лв</ins>"+
                            "</div>" +
                            "<div class=\"product-option-shop\">" +
                            "<input type=\"hidden\" value=\"\" + "+id+" name=\"id\">" +
                            "<input type=\"hidden\" value=\"1\" name=\"quantity\">" +
                            "<input type=\"hidden\" value=\"false\" name=\"shouldAlter\">" +
                            "<input type=\"Submit\" class=\"add_to_cart_button\" value=\"Добави в количката\" >" +
                            "</div>" +
                            "</form>" +
                            "</div>" +
                            "</div>";
                    }
                    document.getElementById("category-list").innerHTML += "<div class=\"row\">" +
                        "<div class=\"col-md-12\">" +
                        "<div class=\"product-pagination text-center\"><input type='Submit' class='add_to_cart_button' value='Върни ме' onclick='location.reload()'>" +
                        "</div>" +
                            "</div>" +
                            "</div>"

                } else {
                    alert("omaza sa");
                }
            }
        };
        request.send();
    }
</script>
</body>
</html>