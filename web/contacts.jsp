
<%@ page import="dao.ProductDao" %>
<%@ page import="model.products.Product" %>
<%@ page import="model.User" %>
<%@ page import="org.hibernate.Session" %>
<%@ page import="dao.UserDao" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <%@page pageEncoding="UTF-8" %>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>ТехСвят - моят технологичен свят</title>
    <link rel="shortcut icon" type="image/x-icon" href="/img/favicon.ico" />

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
    <%-- Other--%>
    <script type="text/javascript" src="/js/mainFunctionality.js"></script>

</head>
<body onload="getCartData();">

<div class="header-area">
    <div class="container">
        <div class="row">
            <div class="col-md-8">
                <div class="user-menu">
                    <ul>
                        <%User user = (User) session.getAttribute("User"); %>
                        <% if (user != null) {
                            out.println("<li><a href=\"user.jsp\"><i class=\"fa fa-user\"></i> Моят акаунт</a></li>");
                        }%>
                        <li><a href="cart.jsp"><i class="fa fa-user"></i> Моята количка</a></li>
                    </ul>
                </div>
            </div>

            <div class="col-md-4">
                <div class="header-right">
                    <ul class="list-unstyled list-inline">
                        <%
                            if(user != null){
                                out.println("<li><a href=\"user.jsp\"><i class=\"fa fa-user\"></i>Здравей, " + user.getFirst_name()+"</a></li>" +
                                        "<li><a onclick=\"logout();\" style=\"cursor: pointer;\">Изход от акаунт</a></li>");
                            } else {
                                out.println("<li><a href=\"login.jsp\"><i class=\"fa fa-user\"></i> Влез в акаунт</a></li>");
                            }
                        %>
                    </ul>
                </div>
            </div>
        </div>
    </div>
</div> <!-- End header area -->

<div class="site-branding-area">
    <div class="container">
        <div class="row">
            <div class="col-sm-4">
                <div class="logo">
                    <h1><a href="index.jsp"><img src="/img/logo.png"></a></h1>
                </div>
            </div>

            <div class="col-sm-4">
                <div class="single-sidebar" style="margin-top: 40px;">
                    <form action="/SearchServlet" method="post">
                        <input type="text" id="searchBar" name="searchProducts" placeholder="Какво търсите днес?" style="float: left; width: 70%;">
                        <input type="submit" value="Намери" style="float: left; width: 30%;">
                    </form>
                </div>
            </div>

            <div class="col-sm-4">
                <div class="shopping-item">
                    <a href="cart.jsp">Количка - <span class="cart-amunt" id="cartTotal">0</span>лв <i class="fa fa-shopping-cart"></i> <span class="product-count" id="cartItems">0</span></a>
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
                    <li><a href="shop.jsp">Магазин</a></li>
                    <li><a href="cart.jsp">Количка</a></li>
                    <li><a href="categories.jsp">Категории</a></li>
                    <li class="active"><a href="contacts.jsp">Контакти</a></li>
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
                    <h2>Контакти</h2>
                </div>
            </div>
        </div>
    </div>
</div>


<div class="single-product-area">
    <div class="zigzag-bottom"></div>
    <div class="container">
        <div class="row">
            <img src="img/location.jpg" alt="" style="margin-bottom: 95px;">
            <div class="col-md-6">
                <div class="form-contact" style="float: right;">
                <div class="form__head">
                    <h3>Задайте ни въпрос</h3>

                    <hr>
                </div><!-- /.form-header -->

                <div class="form__body">
                    <input type="text" placeholder="Вашето име">

                    <input type="Email" placeholder="Вашият email адрес">

                    <input type="text" placeholder="Тема">

                    <textarea type="textarea" placeholder="Задайте въпросът си тук ..."></textarea>
                </div><!-- /.form__body -->

                <div class="form__actions">
                    <input type="Submit" class="button" value="Изпрати">
                </div><!-- /.form__actions -->
            </div><!-- /.form-contact main-/-left-->

            
            </div>
            <div class="col-md-6">
                <div class="contacts-large">
                <div class="contacts__head">
                    <h3>Свържете се с нас</h3>

                    <hr>
                </div><!-- /.contacts__head -->

                <div class="contacts__body">
                    <p>Ако имате проблем или въпрос, който искате да ни зададете, не се страхувайте да ни попитате, като ни изпратите мейл, или ни се обадите на посочените телефони!</p>
                </div><!-- /.contacts__body -->

                <div class="contacts__head">
                    <h3>Информация за контакти</h3>

                    <hr>
                </div><!-- /.contacts__head -->

                <div class="contacts__body">
                    <ul>
                        <li>
                            <i class="fa fa-home" aria-hidden="true"></i>

                            <span>гр.Варна ул.Генерал Колев 52</span>
                        </li>
                        
                        <li>
                            <i class="fa fa-envelope-o" aria-hidden="true"></i>

                            <span>Email: techworldbulgaria@gmail.com</span>
                        </li>
                        
                        <li>
                            <i class="fa fa-globe" aria-hidden="true"></i>

                            <span>www.techworldbulgaria.com</span>
                        </li>
                        
                        <li>
                            <i class="fa fa-headphones" aria-hidden="true"></i>

                            <span>(+359) 896 888 888</span>
                        </li>
                    </ul>
                </div><!-- /.contacts__body -->
            </div><!-- /.contacts-large main-/-right -->
            </div>
        </div>
    </div>
</div>


<div class="footer-top-area">
    <div class="container">
        <div class="row">
            <div class="col-md-3 col-sm-6">
                <div class="footer-about-us">
                    <h2>тех<span>Свят</span></h2>
                    <p>ТехСвят разполага с огромно разнообразие от продукти, както за обикновения потребител, така и за хардуерни ентусиасти! Заповядайте и разгледайте богатият ни асортимент от компютърни и мрежови компоненти, аксесоари и много други! Ниските цени са предимство да изберете нас!</p>
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
                        <li><a href="user.jsp">Моят акаунт</a></li>
                        <li><a href="cart.jsp">Моята количка</a></li>
                        <li><a href="shop.jsp">Магазин</a></li>
                        <li><a href="categories.jsp">Категории</a></li>
                        <li><a href="contacts.jsp">Контакти</a></li>
                    </ul>
                </div>
            </div>

            <div class="col-md-3 col-sm-6">
                <div class="footer-menu">
                    <h2 class="footer-wid-title">Категории</h2>
                    <ul>
                        <li><a href="categories.jsp">Настолни компютри</a></li>
                        <li><a href="categories.jsp">Лаптопи</a></li>
                        <li><a href="categories.jsp">Компоненти</a></li>
                        <li><a href="categories.jsp">Периферия</a></li>
                        <li><a href="categories.jsp">Мрежови компоненти</a></li>
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

<div class="footer-bottom-area">
    <div class="container">
        <div class="row">
            <div class="col-md-8">
                <div class="copyright">
                    <p>&copy; 2017 martDesign. Всички права запазени. <a href="#" target="_blank">dizainatNaMartin.com</a></p>
                </div>
            </div>
        </div>
    </div>
</div> <!-- End footer bottom area -->

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
</body>
</html>