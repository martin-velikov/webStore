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
    <link href='css/titilium_font.css' rel='stylesheet' type='text/css'>
    <link href='css/roboto_font.css' rel='stylesheet' type='text/css'>
    <link href='css/railway_font.css' rel='stylesheet' type='text/css'>
    
    <!-- Bootstrap -->
    <link rel="stylesheet" href="css/bootstrap.min.css">
    
    <!-- Font Awesome -->
    <link rel="stylesheet" href="css/font-awesome.min.css">
    
    <!-- Custom CSS -->
    <link rel="stylesheet" href="css/owl.carousel.css">
    <link rel="stylesheet" href="style.css">
    <link rel="stylesheet" href="css/responsive.css">

      <script>
          function singleProduct(productId) {
              var request = new XMLHttpRequest();
              request.open("post", "/SingleProductServlet", true);
              request.send(JSON.stringify({productId: productId}));
              location.href = 'single-product.jsp';
          }
      </script>

  </head>
  <body onload="loadData(); getCartData();">

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
                <div class="col-sm-6">
                    <div class="logo">
                        <h1><a href="index.jsp"><img src="/img/logo.png"></a></h1>
                    </div>
                </div>
                
                <div class="col-sm-6">
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
                        <div class="product-breadcroumb">
                            <a href="">Home</a>
                            <a href="" id="nav-categoryName">Category Name</a>
                            <a href="" id="nav-ProductName">Sony Smart TV - 2015</a>
                        </div>
                        
                        <div class="row">
                            <div class="col-sm-6">
                                <div class="product-images">
                                    <div class="product-main-img" id="product-image">
                                        <img src="img/product-2.jpg" alt="">
                                    </div>
                                </div>
                            </div>
                            
                            <div class="col-sm-6">
                                <div class="product-inner">
                                    <h2 class="product-name" id="product-name">Sony Smart TV - 2015</h2>
                                    <div class="product-inner-price">
                                        <ins id="product-price">$700.00</ins>
                                    </div>    
                                    
                                    <form action="" class="cart">
                                        <div class="quantity">
                                            <input type="number" size="4" class="input-text qty text" title="Qty" value="1" name="quantity" min="1" step="1">
                                        </div>
                                        <button class="add_to_cart_button" type="submit">Добави в количката</button>
                                    </form>   
                                    <p>Налични: <span id="quantity"></span> бр.</p>
                                    <div class="product-inner-category">
                                        <p>Категория: <a href="" id="product-category">Summer</a>. </p>
                                    </div> 
                                    
                                    <div role="tabpanel">
                                        <ul class="product-tab" role="tablist">
                                            <li role="presentation" class="active"><a href="#home" aria-controls="home" role="tab" data-toggle="tab">Описание</a></li>
                                            <li role="presentation"><a href="#profile" aria-controls="profile" role="tab" data-toggle="tab">Отзиви</a></li>
                                        </ul>
                                        <div class="tab-content">
                                            <div role="tabpanel" class="tab-pane fade in active" id="home">
                                                <h2>Описание на продукта:</h2>
                                                <p id="product-description">Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nam tristique, diam in consequat iaculis, est purus iaculis mauris, imperdiet facilisis ante ligula at nulla. Quisque volutpat nulla risus, id maximus ex aliquet ut. Suspendisse potenti. Nulla varius lectus id turpis dignissim porta. Quisque magna arcu, blandit quis felis vehicula, feugiat gravida diam. Nullam nec turpis ligula. Aliquam quis blandit elit, ac sodales nisl. Aliquam eget dolor eget elit malesuada aliquet. In varius lorem lorem, semper bibendum lectus lobortis ac.</p>
                                            </div>
                                            <div role="tabpanel" class="tab-pane fade" id="profile">
                                                <h2>Отзиви</h2>
                                                <div class="submit-review">
                                                    <p><label for="name">Име</label> <input name="name" id="name" type="text"></p>
                                                    <p><label for="email">Email</label> <input name="email" id="email" type="email"></p>
                                                    <div class="rating-chooser">
                                                        <p>Вашият рейтинг</p>

                                                        <div class="rating-wrap-post">
                                                            <i class="fa fa-star"></i>
                                                            <i class="fa fa-star"></i>
                                                            <i class="fa fa-star"></i>
                                                            <i class="fa fa-star"></i>
                                                            <i class="fa fa-star"></i>
                                                        </div>
                                                    </div>
                                                    <p><label for="review">Вашият отзив</label> <textarea name="review" id="review" cols="30" rows="10"></textarea></p>
                                                    <p><input type="submit" value="Изпрати"></p>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    
                                </div>
                            </div>
                        </div>
                        
                        
                        <div class="related-products-wrapper">
                            <h2 class="related-products-title">Още продукти</h2>
                            <div class="related-products-carousel">
                                <%
                                    for(Product product : randomProducts) {
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
    <script src="js/owl.carousel.min.js"></script>
    <script src="js/jquery.sticky.js"></script>
    
    <!-- jQuery easing -->
    <script src="js/jquery.easing.1.3.min.js"></script>
    
    <!-- Initializer Script -->
    <script src="js/main.js"></script>
    
    <!-- Slider -->
    <script type="text/javascript" src="js/bxslider.min.js"></script>
    <script type="text/javascript" src="js/script.slider.js"></script>

    <%-- Other--%>
    <script type="text/javascript" src="/js/logout.js"></script>

  <script>
      function loadData() {
          var request = new XMLHttpRequest();
          var productData = {
              id_product: 0,
              product_brand: '',
              product_model: '',
              product_price: '',
              product_image: '',
              product_description: '',
              product_quantity: '',
              category: { id_category: '', category_name: ''}
          };
          request.open("get", "/SingleProductServlet?id=", true);
          request.onreadystatechange = function () {
              if (request.readyState == 4) {
                  if (request.status === 200) {
                      productData = JSON.parse(this.responseText);

                      document.getElementById("nav-categoryName").innerHTML = productData.category.category_name;
                      document.getElementById("nav-ProductName").innerHTML = productData.product_brand + " " + productData.product_model;
                      document.getElementById("product-name").innerHTML = productData.product_brand + " " + productData.product_model;
                      document.getElementById("product-price").innerHTML = productData.product_price + "лв";
                      document.getElementById("product-category").innerHTML = productData.category.category_name;
                      document.getElementById("product-description").innerHTML = productData.product_description;
                      document.getElementById("product-image").innerHTML = '<img src="'+productData.product_image+'" alt="">';
                      document.getElementById("quantity").innerHTML = productData.product_quantity;

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