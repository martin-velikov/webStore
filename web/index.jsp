<%@ page import="model.User" %>
<%@ page import="dao.ProductDao" %>
<%@ page import="model.products.Product" %>
<%@ page import="java.util.List" %>
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
    <link href='css/roboto_font.css' rel='stylesheet' type='text/css'>
    <link href='css/railway_font.css' rel='stylesheet' type='text/css'>
    
    <!-- Bootstrap -->
    <link rel="stylesheet" href="/css/bootstrap.min.css">
    
    <!-- Font Awesome -->
    <link rel="stylesheet" href="/css/font-awesome.min.css">
    
    <!-- Custom CSS -->
    <link rel="stylesheet" href="/css/owl.carousel.css">
    <link rel="stylesheet" href="/style.css">
    <link rel="stylesheet" href="/css/responsive.css">

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
                              if (user.getEmail().equals("admin@admin.ad")) {
                                  out.println("<li><a href=\"admin.jsp\"><i class=\"fa fa-user\"></i> Администраторски панел</a></li>");
                              }
                          }
                          %>
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
                        <li class="active"><a href="index.jsp">Начало</a></li>
                        <li><a href="shop.jsp">Магазин</a></li>
                        <li><a href="cart.jsp">Количка</a></li>
                        <li><a href="categories.jsp">Категории</a></li>
                        <li><a href="contacts.jsp">Контакти</a></li>
                    </ul>
                </div>  
            </div>
        </div>
    </div> <!-- End mainmenu area -->
    
    <div class="slider-area">
        	<!-- Slider -->
			<div class="block-slider block-slider4">
				<ul class="" id="bxslider-home4">
					<li>
						<img src="/img/h4-slide.jpg" alt="Slide">
						<div class="caption-group">
							<h2 class="caption title">
								Nvidia GeForce <span class="primary">1080 <strong>Ti</strong></span>
							</h2>
							<h4 class="caption subtitle">11GB GDDR5X</h4>
							<a class="caption button-radius" onclick="singleProduct(20);"><span class="icon"></span>Грабни сега !</a>
						</div>
					</li>
					<li><img src="/img/h4-slide2.jpg" alt="Slide">
						<div class="caption-group">
							<h2 class="caption title">
								GB Z270X-GAMING 8 <span class="primary">LGA1151 </span>
							</h2>
							<a class="caption button-radius" onclick="singleProduct(22);"><span class="icon"></span>Грабни сега !</a>
						</div>
					</li>
					<li><img src="/img/h4-slide3.jpg" alt="Slide">
						<div class="caption-group">
							<h2 class="caption title">
								Intel <span class="primary">Core <strong>i5</strong></span>
							</h2>
							<h4 class="caption subtitle">6-ядрен</h4>
							<a class="caption button-radius" onclick="singleProduct(21);"><span class="icon"></span>Грабни сега !</a>
						</div>
					</li>
					<li><img src="/img/h4-slide4.jpg" alt="Slide">
						<div class="caption-group">
						  <h2 class="caption title">
								Redragon  <span class="primary">Devarajas <strong>K556-RK RGB</strong></span>
							</h2>
							<h4 class="caption subtitle">Механична клавиатура с RGB подсветка</h4>
							<a class="caption button-radius" onclick="singleProduct(23);"><span class="icon"></span>Грабни сега !</a>
						</div>
					</li>
				</ul>
			</div>
			<!-- ./Slider -->
    </div> <!-- End slider area -->
    
    <div class="promo-area">
        <div class="zigzag-bottom"></div>
        <div class="container">
            <div class="row">
                <div class="col-md-3 col-sm-6">
                    <div class="single-promo promo1">
                        <i class="fa fa-refresh"></i>
                        <p>30 дни право на връщане</p>
                    </div>
                </div>
                <div class="col-md-3 col-sm-6">
                    <div class="single-promo promo2">
                        <i class="fa fa-truck"></i>
                        <p>Безплатна доставка до дома</p>
                    </div>
                </div>
                <div class="col-md-3 col-sm-6">
                    <div class="single-promo promo3">
                        <i class="fa fa-lock"></i>
                        <p>Проверка на пратката</p>
                    </div>
                </div>
                <div class="col-md-3 col-sm-6">
                    <div class="single-promo promo4">
                        <i class="fa fa-gift"></i>
                        <p>Най-качествените продукти</p>
                    </div>
                </div>
            </div>
        </div>
    </div> <!-- End promo area -->
    
    <div class="maincontent-area">
        <div class="zigzag-bottom"></div>
        <div class="container">
            <div class="row">
                <div class="col-md-12">
                    <div class="latest-product">
                        <h2 class="section-title">Последни продукти</h2>

                        <div class="product-carousel">
                            <%
                                ProductDao productDao = ProductDao.getInstance();
                                List<Product> randomProducts = productDao.getRandomProducts(5);
                                for(Product product : randomProducts){
                                    out.println(
                                            "<form action=\"/SingleProductServlet\" method=\"post\" id=\"singleProductForm\">"+
                                            "<div class=\"single-product\">\n" +
                                            "                                <div class=\"product-f-image\">\n" +
                                            "                                    <img src=\""+product.getProduct_image()+"\" alt=\"\">\n" +
                                            "                                    <div class=\"product-hover\">\n" +
                                            "                                        <input type=\"hidden\" name=\"productId\" value=\""+product.getId()+"\">" +
                                            "                                        <a href=\"#\" class=\"add-to-cart-link\"><i class=\"fa fa-shopping-cart\"></i> Добави в количката</a>\n" +
                                            "                                        <a class=\"view-details-link\" onclick=\"singleProduct("+product.getId()+");\"><i class=\"fa fa-link\"></i>Информация</a>\n" +
                                            "                                    </div>\n" +
                                            "                                </div>\n" +
                                            "                                \n" +
                                            "                                <h2><a href=\"single-product.jsp\">" + product.getProduct_brand() + " " + product.getProduct_model() + "</a></h2>\n" +
                                            "                                \n" +
                                            "                                <div class=\"product-carousel-price\">\n" +
                                            "                                    <ins>" + product.getProduct_price() + " лв</ins> <del>" + (product.getProduct_price()+((product.getProduct_price()/100)*10)) + " лв</del>\n" +
                                            "                                </div> \n" +
                                            "                            </div>\n" +
                                            "</form>                    ");
                                }
                            %>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div> <!-- End main content area -->
    
    <div class="brands-area">
        <div class="zigzag-bottom"></div>
        <div class="container">
            <div class="row">
                <div class="col-md-12">
                    <div class="brand-wrapper">
                        <div class="brand-list">
                            <img src="/img/brand1.png" alt="">
                            <img src="/img/brand2.png" alt="">
                            <img src="/img/brand3.png" alt="">
                            <img src="/img/brand4.png" alt="">
                            <img src="/img/brand5.png" alt="">
                            <img src="/img/brand6.png" alt="">
                            <img src="/img/brand1.png" alt="">
                            <img src="/img/brand2.png" alt="">
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div> <!-- End brands area -->
       
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
    
    <!-- Slider -->
    <script type="text/javascript" src="/js/bxslider.min.js"></script>
	<script type="text/javascript" src="/js/script.slider.js"></script>

    <%-- Other--%>
    <script type="text/javascript" src="/js/mainFunctionality.js"></script>

  <script>
      function singleProduct(productId) {
          var request = new XMLHttpRequest();
          request.open("post", "/SingleProductServlet", true);
          request.send(JSON.stringify({productId: productId}));
          location.href = 'single-product.jsp';
      }
  </script>
  </body>
</html>