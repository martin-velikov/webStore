
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
                        <% User user = (User) session.getAttribute("User"); %>
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
                    <h2>Моят Акаунт</h2>
                </div>
            </div>
        </div>
    </div>
</div>


<div class="single-product-area">
    <div class="zigzag-bottom"></div>
    <div class="container">
        <div class="row">
            <center>
            <h2>Моите данни:</h2>
            <h4>(можете да променяте данните си)</h4>
            <form action="/UpdateUser" method="post" style="width: 600px;">
            <label for="fName">Име:</label><br>
            <input type="text" id="fName" name="fName" value="<% out.println(user.getFirst_name()); %>"><br>
            <label for="lName">Фамилия:</label><br>
            <input type="text" id="lName" name="lName" value="<% out.println(user.getLast_name()); %>"><br>
            <label for="email">Email:</label><br>
            <input type="text" id="email" value="<% out.println(user.getEmail()); %>"><br>
            <label for="address">Адрес:</label><br>
            <input type="text" id="address" name="address" value="<% out.println(user.getAddress()); %>"><br>
            <label for="phone">Телефон:</label><br>
            <input type="text" id="phone" name="phone" value="<% out.println(user.getPhone()); %>"><br><br>
            <input type="submit" value="Промени">
            </form>
            </center>
        </div>
    </div>
</div>


<div class="footer-top-area">
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