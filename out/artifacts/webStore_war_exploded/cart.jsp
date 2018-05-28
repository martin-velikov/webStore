<%@ page import="dao.ProductDao" %>
<%@ page import="model.products.Product" %>
<%@ page import="java.util.*" %>
<%@ page import="model.User" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <%@page pageEncoding="UTF-8" %>
    <meta charset="utf-8">
    <meta http-equiv="Content-Type" content="text/html; charset=windows-1251">
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
        function searchProducts() {
            var search = document.getElementById("searchBar").value;

            if (search == '' || search == null) {
                return;
            }
            $.ajax({
                url: '/SearchServlet',
                data: {
                    searchProducts: search
                },
                type: 'POST'
            });
        }
    </script>
    <script>
        function singleProduct(productId) {
            var request = new XMLHttpRequest();
            request.open("post", "/SingleProductServlet", true);
            request.send(JSON.stringify({productId: productId}));
            location.href = 'single-product.jsp';
        }
    </script>

    <%-- Other--%>
    <script type="text/javascript" src="/js/mainFunctionality.js"></script>

</head>
<body onload="getCartData()">

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
                    <li class="active"><a href="cart.jsp">Количка</a></li>
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
                    <form action="/SearchServlet" method="post">
                        <input type="text" id="searchBar" name="searchProducts" placeholder="Какво търсите днес?">
                    <input type="submit" value="Намери">
                    </form>

                </div>

                <div class="single-sidebar">
                    <h2 class="sidebar-title">Продукти</h2>
                    <%
                        ProductDao productDao = ProductDao.getInstance();
                        List<Product> randomProducts = productDao.getRandomProducts(4);
                        for(Product product : randomProducts) {
                            out.println("<div class=\"thubmnail-recent\">" +
                                    "<img src=\"" + product.getProduct_image() + "\" class=\"recent-thumb\">" +
                                    "<h2><a onclick=\"singleProduct("+product.getId()+");\">" + product.getProduct_brand() + "" + " " + product.getProduct_model() + "</a></h2>" +
                                    "<div class=\"product-sidebar-price\">" +
                                    "<ins>" + product.getProduct_price() + "" + " лв.</ins>" +
                                    "</div>" +
                                    "</div>");
                        }
                            %>
                </div>
            </div>

            <div class="col-md-8">
                <div class="product-content-right">
                    <div class="woocommerce">
                        <table cellspacing="0" class="shop_table cart" id="cartTable">
                            <%
                                if (null != request.getAttribute("failMessage")) {
                                    out.println(request.getAttribute("failMessage"));
                                }
                            %>
                            <thead id="thead">
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
                                            "                                                <a title=\"Remove this item\" class=\"remove\" href=\"#\" onclick=\"removeItem("+product.getId()+");\">×</a>\n" +
                                            "                                            </td>\n" +
                                            "\n" +
                                            "                                            <td class=\"product-thumbnail\">\n" +
                                            "                                                <a href=\"single-product.jsp\"><img width=\"145\" height=\"145\" alt=\"poster_1_up\" class=\"shop_thumbnail\" src=\"" + product.getProduct_image() + "\"></a>\n" +
                                            "                                            </td>\n" +
                                            "\n" +
                                            "                                            <td class=\"product-name\">\n" +
                                            "                                                <a href=\"single-product.jsp\">" + product.getProduct_brand() +" "+ product.getProduct_model() + "</a>\n" +
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
                                    <center><div id="actions"></div></center>
                                    <input type="submit" value="Обнови количката" name="update_cart"
                                           class="button" onclick="getValues('/ShoppingCartServlet')">
                                    <input type="submit" value="Поръчай" name="proceed"
                                            class="button"
                                            onclick="order('/OrderServlet');">
                                    <br>
                                    <center>
                                    <form action="https://www.paypal.com/cgi-bin/webscr" method="post" target="_top">
                                        <input type="hidden" name="cmd" value="_s-xclick">
                                        <input type="hidden" name="hosted_button_id" value="HCDKTMP2665X8">
                                        <input type="hidden" name="on0" value="&#1050;&#1091;&#1087;&#1080; &#1095;&#1088;е&#1079; PayPal"><br><h3>&#1050;&#1091;&#1087;&#1080; &#1095;&#1088;е&#1079; PayPal</h3>
                                        <input type="image" src="https://www.paypalobjects.com/en_US/i/btn/btn_buynowCC_LG.gif" border="0" name="submit" alt="PayPal - The safer, easier way to pay online!">
                                        <img alt="" border="0" src="https://www.paypalobjects.com/en_US/i/scr/pixel.gif" width="1" height="1">
                                    </form>
                                    </center>

                                </td>
                            </tr>
                            </tbody>
                        </table>
                        <%--</form>--%>

                        <div class="cart-collaterals">


                            <div class="cross-sells">
                                <h2>Може би се интересувате от...</h2>
                                <ul class="products">
                                    <%
                                     randomProducts = productDao.getRandomProducts(3);
                                        for(Product product : randomProducts) {
                                            out.println(
                                                    "<li class=\"product\">" +
                                                            "<a onclick=\"singleProduct("+product.getId()+");\">" +
                                                            "<img width=\"325\" height=\"325\" class=\"attachment-shop_catalog wp-post-image\" src=\""+product.getProduct_image()+"\">" +
                                                            "<h3>"+product.getProduct_brand() +" "+ product.getProduct_model()+"</h3>" +
                                                            "<span class=\"price\"><span class=\"amount\">"+product.getProduct_price()+" лв</span></span>" +
                                                            "</a>" +
                                                            "                                        <a class=\"add_to_cart_button\" data-quantity=\"1\" data-product_sku=\"\"\n" +
                                                            "                                           data-product_id=\"22\" rel=\"nofollow\" href=\"single-product.jsp\">Вижте\n" +
                                                            "                                            повече</a>\n" +
                                                            "                                    </li>"
                                            );
                                        }
                                    %>
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
                        <li><a href="categories.jsp">Ъпгрейд</a></li>
                        <li><a href="categories.jsp">Периферия</a></li>
                        <li><a href="categories.jsp">Wireless and Networking</a></li>
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

                } else if (request.status == 404) {
                    document.getElementById("actions").innerHTML = "Няма толкова налични бройки!"
                }

                else {
                    location.href="/login.jsp";
                }
            }
        };
        request.send(JSON.stringify(data));
    }
</script>
<script>
    function removeItem(id) {
        var cookies = get_cookies_array();
        for(var name in cookies) {
            if(name == id){
                document.cookie = name + '=; Max-Age=0';
                location.reload();
            }
        }
    }
</script>

<script>
    function get_cookies_array() {

        var cookies = { };

        if (document.cookie && document.cookie != '') {
            var split = document.cookie.split(';');
            for (var i = 0; i < split.length; i++) {
                var name_value = split[i].split("=");
                name_value[0] = name_value[0].replace(/^ /, '');
                cookies[decodeURIComponent(name_value[0])] = decodeURIComponent(name_value[1]);
            }
        }

        return cookies;

    }
</script>


</body>
</html>