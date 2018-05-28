<%@ page import="model.User" %>
<%@ page contentType="text/html; charset=UTF-8" %>
<!DOCTYPE html>
<html lang="en">
  <head>
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
                        <li class="active"><a href="index.jsp">Начало</a></li>
                        <li><a href="shop.jsp">Магазин</a></li>
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
                        <h2>Регистрация на потребител</h2>
                    </div>
                </div>
            </div>
        </div>
    </div> <!-- End Page title area -->
    
    
    <div class="single-product-area" style="text-align: center;">
        
        <div class="container">
            <div class="form-container form-container--small">
                <%
                    if(null!=request.getAttribute("successMessage"))
                    {
                        out.println(request.getAttribute("successMessage"));
                    }
                    if(null!=request.getAttribute("failMessage"))
                    {
                        out.println(request.getAttribute("failMessage"));
                    }
                %>
                <form action="RegisterServlet" method="POST" class="login-form">
                    <label for="first_name">Име:</label><br>
                    <input id="first_name" type="text" class="form-control" placeholder="Моля, въведете вашето име" name="first_name" required><br>
                    <label for="last_name">Фамилия:</label><br>
                    <input id="last_name" type="text" class="form-control" placeholder="Моля, въведете вашaтa фамилия" name="last_name" required><br>
                    <label id="phone" for="phone">Телефон:</label><br>
                    <input type="text" class="form-control" placeholder="Моля, въведете вашият телефонен номер" name="phone" required><br>
                    <label for="address">Адрес:</label><br>
                    <input id="address" type="text" class="form-control" placeholder="Моля, въведете вашият адрес" name="address" required><br>
                    <label for="email">Email:</label><br>
                    <input id="email" type="text" class="form-control" placeholder="Моля, въведете вашият Email" name="email" required><br>
                    <label for="password">Парола:</label><br>
                    <input id="password" type="password" class="form-control" placeholder="Моля, въведете вашата парола(минимум 8 символа)" name="password" required>
                    <label for="picture">Профилна снимка (не е задължително):</label><br>
                    <input id="picture" type="file" name="pic" accept="image/*" class="form-control" name="picture">
                    <input type="submit" class="btn-primary" value="Регистрирай" name="">
                    <br>

                </form>
            </div><!-- /.form-container -->
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
  </body>
</html>