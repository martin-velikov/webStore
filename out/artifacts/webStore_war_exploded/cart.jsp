<%@ page import="dao.ProductDao" %>
<%@ page import="model.products.Product" %>
<%@ page import="java.util.*" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <%@page pageEncoding="UTF-8" %>
    <meta charset="utf-8">
    <meta http-equiv="Content-Type" content="text/html; charset=windows-1251">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>ТехСвят - моят технологичен свят</title>
    <link rel="shortcut icon" type="image/x-icon" href="/img/favicon.ico"/>

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
                    <a href="cart.jsp">Количка - <span class="cart-amunt">$100</span> <i
                            class="fa fa-shopping-cart"></i> <span class="product-count">5</span></a>
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
                    <li class="active"><a href="cart.jsp">Количка</a></li>
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
                    <h2>Моята количка</h2>
                </div>
            </div>
        </div>
    </div>
</div> <!-- End Page title area -->


<div class="single-product-area">
    <div class="zigzag-bottom"></div>
    <div class="container">
        <div class="row">
            <div class="col-md-4">
                <div class="single-sidebar">
                    <h2 class="sidebar-title">Търсене</h2>
                    <form action="#">
                        <input type="text" placeholder="Какво търсите днес?">
                        <input type="submit" value="Намери">
                    </form>
                </div>

                <div class="single-sidebar">
                    <h2 class="sidebar-title">Продукти</h2>
                    <div class="thubmnail-recent">
                        <img src="/img/product-thumb-1.jpg" class="recent-thumb" alt="">
                        <h2><a href="single-product.jsp">Sony Smart TV - 2015</a></h2>
                        <div class="product-sidebar-price">
                            <ins>$700.00</ins>
                            <del>$800.00</del>
                        </div>
                    </div>
                    <div class="thubmnail-recent">
                        <img src="/img/product-thumb-1.jpg" class="recent-thumb" alt="">
                        <h2><a href="single-product.jsp">Sony Smart TV - 2015</a></h2>
                        <div class="product-sidebar-price">
                            <ins>$700.00</ins>
                            <del>$800.00</del>
                        </div>
                    </div>
                    <div class="thubmnail-recent">
                        <img src="/img/product-thumb-1.jpg" class="recent-thumb" alt="">
                        <h2><a href="single-product.jsp">Sony Smart TV - 2015</a></h2>
                        <div class="product-sidebar-price">
                            <ins>$700.00</ins>
                            <del>$800.00</del>
                        </div>
                    </div>
                    <div class="thubmnail-recent">
                        <img src="/img/product-thumb-1.jpg" class="recent-thumb" alt="">
                        <h2><a href="single-product.jsp">Sony Smart TV - 2015</a></h2>
                        <div class="product-sidebar-price">
                            <ins>$700.00</ins>
                            <del>$800.00</del>
                        </div>
                    </div>
                </div>


            </div>

            <div class="col-md-8">
                <div class="product-content-right">
                    <div class="woocommerce">
                        <center>
                            <%
                                if (null != request.getAttribute("successMessage")) {
                                    out.println(request.getAttribute("successMessage"));
                                    System.out.println(request.getAttribute("successMessage"));
                                    for (Cookie cookie : request.getCookies()) {
                                        System.out.println(cookie.getName() + " : " + cookie.getValue());
                                    }
                                }
                                if (null != request.getAttribute("failMessage")) {
                                    out.println(request.getAttribute("failMessage"));
                                }
                            %>
                        </center>
                        <%--<form method="post" action="#">--%>
                        <table cellspacing="0" class="shop_table cart" id="cartTable">
                            <thead>
                            <tr>
                                <th class="product-remove">&nbsp;</th>
                                <th class="product-thumbnail">&nbsp;</th>
                                <th class="product-name">Продукт</th>
                                <th class="product-price">Цена</th>
                                <th class="product-quantity">Количество</th>
                                <th class="product-subtotal">Общо</th>
                            </tr>
                            </thead>
                            <tbody>
                            <%
                                Map<Long, Integer> idsToQuantitiesMap = new HashMap<>();
                                ProductDao productDao = ProductDao.getInstance();
                                if (request == null || request.getCookies() == null) {
                                    return;
                                }
                                for (Cookie cookie : request.getCookies()) {
                                    try {
                                        idsToQuantitiesMap.put(Long.valueOf(cookie.getName()), Integer.valueOf(cookie.getValue()));
                                    } catch (NumberFormatException e) {
                                        continue;
                                    }
                                }
                                if (idsToQuantitiesMap.keySet().size() == 0) {
                                    //TODO message
                                    return;
                                }
                                List<Product> productList = productDao.getProductsByIds(Arrays.asList(idsToQuantitiesMap.keySet().toArray(new Long[0])));
                                for (Product product : productList) {
                                    out.println("                                        <tr class=\"cart_item\">\n" +
                                            "                                            <td class=\"product-remove\">\n" +
                                            "                                                <a title=\"Remove this item\" class=\"remove\" href=\"#\">×</a>\n" +
                                            "                                            </td>\n" +
                                            "\n" +
                                            "                                            <td class=\"product-thumbnail\">\n" +
                                            "                                                <a href=\"single-product.jsp\"><img width=\"145\" height=\"145\" alt=\"poster_1_up\" class=\"shop_thumbnail\" src=\"" + product.getProduct_image() + "\"></a>\n" +
                                            "                                            </td>\n" +
                                            "\n" +
                                            "                                            <td class=\"product-name\">\n" +
                                            "                                                <a href=\"single-product.jsp\">" + product.getProduct_brand() + "\" \"" + product.getProduct_model() + "</a>\n" +
                                            "                                            </td>\n" +
                                            "\n" +
                                            "                                            <td class=\"product-price\">\n" +
                                            "                                                <span class=\"amount\">" + String.format("%.2f", product.getProduct_price()) + "лв</span>\n" +
                                            "                                            </td>\n" +
                                            "\n" +
                                            "                                            <td id=\"tdQuantity\" class=\"product-quantity\">\n" +

                                            "                                                    " +
                                            "                                                    <input type=\"number\" size=\"4\" class=\"input-text qty text\" title=\"Qty\" value=\"" + idsToQuantitiesMap.get(product.getId()) + "\" min=\"0\" step=\"1\" id=\"quantity\" name=\"quantity\">\n" +
                                            "                                                    " +

                                            "                                            </td>\n" +
                                            "\n" +
                                            "                                            <td id=\"tdProductId\" class=\"product-subtotal\">\n" +
                                            "       <input type=\"hidden\" value=\"" + product.getId_product() + "\" id=\"productId\">" +
                                            "                                                <span class=\"amount\">" + String.format("%.2f", product.getProduct_price() * idsToQuantitiesMap.get(product.getId())) + "лв</span>\n" +
                                            "                                            </td>\n" +
                                            "                                        </tr>");
                                }
                            %>

                            <tr>
                                <td class="actions" colspan="6">
                                    <input type="submit" value="Обнови количката" name="update_cart"
                                           class="button" onclick="getValues('/ShoppingCartServlet')">
                                    <button type="button" value="Поръчай" name="proceed"
                                            class="checkout-button button"
                                            onclick="/*getValues('/OrderServlet'); refreshPage();*/order('/OrderServlet');">
                                        Поръчай
                                    </button>
                                </td>
                            </tr>
                            </tbody>
                        </table>
                        <%--</form>--%>

                        <div class="cart-collaterals">


                            <div class="cross-sells">
                                <h2>Може би се интересувате от...</h2>
                                <ul class="products">
                                    <li class="product">
                                        <a href="single-product.jsp">
                                            <img width="325" height="325" alt="T_4_front"
                                                 class="attachment-shop_catalog wp-post-image" src="/img/product-2.jpg">
                                            <h3>Ship Your Idea</h3>
                                            <span class="price"><span class="amount">£20.00</span></span>
                                        </a>

                                        <a class="add_to_cart_button" data-quantity="1" data-product_sku=""
                                           data-product_id="22" rel="nofollow" href="single-product.jsp">Вижте
                                            повече</a>
                                    </li>

                                    <li class="product">
                                        <a href="single-product.jsp">
                                            <img width="325" height="325" alt="T_4_front"
                                                 class="attachment-shop_catalog wp-post-image" src="/img/product-4.jpg">
                                            <h3>Ship Your Idea</h3>
                                            <span class="price"><span class="amount">£20.00</span></span>
                                        </a>

                                        <a class="add_to_cart_button" data-quantity="1" data-product_sku=""
                                           data-product_id="22" rel="nofollow" href="single-product.jsp">Вижте
                                            повече</a>
                                    </li>

                                    <li class="product">
                                        <a href="single-product.jsp">
                                            <img width="325" height="325" alt="T_4_front"
                                                 class="attachment-shop_catalog wp-post-image" src="/img/product-2.jpg">
                                            <h3>Ship Your Idea</h3>
                                            <span class="price"><span class="amount">£20.00</span></span>
                                        </a>

                                        <a class="add_to_cart_button" data-quantity="1" data-product_sku=""
                                           data-product_id="22" rel="nofollow" href="single-product.jsp">Вижте
                                            повече</a>
                                    </li>
                                </ul>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
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
                    <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Perferendis sunt id doloribus vero quam
                        laborum quas alias dolores blanditiis iusto consequatur, modi aliquid eveniet eligendi iure
                        eaque ipsam iste, pariatur omnis sint! Suscipit, debitis, quisquam. Laborum commodi veritatis
                        magni at?</p>
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

<div class="footer-bottom-area">
    <div class="container">
        <div class="row">
            <div class="col-md-8">
                <div class="copyright">
                    <p>&copy; 2017 martDesign. Всички права запазени. <a href="#"
                                                                         target="_blank">dizainatNaMartin.com</a></p>
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

<!-- Slider -->
<script type="text/javascript" src="/js/bxslider.min.js"></script>
<script type="text/javascript" src="/js/script.slider.js"></script>
<script>
    function getValues(url) {

        var idArray = [];
        var quantityArray = [];
        var table = document.getElementById("cartTable");
        var rCount = table.rows.length;
        for (var i = 1; i < rCount - 1; i++) {
            var quantity = table.rows[i].cells[4].children[0].value;
            var id = table.rows[i].cells[5].children[0].value;
            //TODO put these values in arrays and call the ShoppingCardServlet
            idArray.push(id);
            quantityArray.push(quantity);
        }
        $.ajax({
            url: url,
            data: {
                ids: idArray,
                quantities: quantityArray,
                shouldAlter: true
            },
            type: 'POST'
        });
    }
</script>
<script>
    function refreshPage() {
        alert("Поръчката е направена успешно!");
        location.reload();
    }
</script>
<script>
    function order(url) {

        var data = [];
        var table = document.getElementById("cartTable");
        var rCount = table.rows.length;
        for (var i = 1; i < rCount - 1; i++) {
            var quantity = table.rows[i].cells[4].children[0].value;
            var id = table.rows[i].cells[5].children[0].value;
            data.push({
                quantity: quantity,
                id: id
            });
        }
        //TODO if data is empty don't send the request
        if(data.length == 0){
            return;
        }
        var request = new XMLHttpRequest();
        request.open("post", url, true);
        request.onreadystatechange = function () {
            if (request.readyState == 4) {
                if (request.status === 200) {
                    document.getElementById("cartTable").innerHTML = this.responseText;

                } else {
                    alert("omaza sa");
                }
            }
        };
        request.send(JSON.stringify(data));
    }
</script>
</body>
</html>