<%@ page import="test.ManageStudent" %>
<%@ page import="dao.CategoryDao" %>
<%@ page import="model.Category" %>
<%@ page import="model.User" %>
<!DOCTYPE html>
<html lang="en">
  <head>
    <%@page pageEncoding="UTF-8" %>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>ТехСвят - моят технологичен свят</title>
    <link rel="shortcut icon" type="image/x-icon" href="img/favicon.ico" />
    
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

  </head>
  <body onload="getCartData()">

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
                          <%  User user = (User) session.getAttribute("User");
                              if(user != null){
                                  out.println("<li><a href=\"user.jsp\"><i class=\"fa fa-user\"></i>Здравей, " + user.getFirst_name()+"</a></li>" +
                                          "<li><a onclick=\"logout();\" style=\"cursor: pointer;\">Изход от акаунт</a></li>");
                              } else {
                                  out.println("<li><a href=\"login.jsp\"><i class=\"fa fa-user\"></i> Влез в акаунт</a></li>");
                              } %>
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
                        <h1><a href="index.jsp"><img src="img/logo.png"></a></h1>
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
                        <h2>Администратор</h2>
                    </div>
                </div>
            </div>
        </div>
    </div> <!-- End Page title area -->
    
    
    <div class="single-product-area" style="text-align: center;">
        
        <div class="container">
            <div class="form-container">
                <h4>Моля изберете:</h4>
                <div class="actions">
                <input type="button" id="addProduct" class="btn-primary" value="Добавяне на продукт" name="">

                    <form action="ProductServlet" method="POST" class="login-form" id="addForm" style="display: none;">
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
                        <div class="col-md-6">
                            <div class="form-select">
                                <label for="selectCategory">Моля, изберете категория:</label>
                                <select id="selectCategory" class="selectCategory" name="category">
                                    <% CategoryDao categoriesDao = CategoryDao.getInstance();
                                        for(Category category : categoriesDao.getAllEntities("Category"))
                                            out.println("<option>"+category.getCategory_name()+"</option>");
                                    %>
                                </select>
                            </div><!-- /.form-select -->

                        
                            <br>    
                            <label for="make">Марка:</label><br>
                            <input type="text" id="make" class="form-control" placeholder="Въведете марка" name="make"><br>
                            <label for="model">Модел:</label><br>
                            <input type="text" id="model" class="form-control" placeholder="Въведете модел" name="model">
                            <label for="quantity">Количество:</label><br>
                            <input type="number" id="quantity" class="form-control" placeholder="Въведете количество" name="quantity">
                            <label for="price">Цена:</label><br>
                            <input type="text" id="price" class="form-control" placeholder="Въведете цена" name="price">
                            <label for="description">Описание:</label><br>
                            <textarea class="form-control" id="description" rows="10" cols="30" style="resize: none;" placeholder="Въведете описание" name="description"></textarea>
                            <label for="image">Снимка на продукта:</label><br>
                            <input type="file" id="image" name="pic" accept="image/*" class="form-control" name="image">
                        </div><!-- /.col-md-6 -->


                        <div class="col-md-6">
                            <label for="inches">Размер на монитора:</label><br>
                            <input type="text" id="inches" class="form-control" placeholder="Въведете размер на монитора в инчове" name="inches">
                            <label for="resolution">Резолюция на монитора:</label><br>
                            <input type="text" id="resolution" class="form-control" placeholder="Въведете резолюция на монитора" name="resolution">
                            <label for="matrix">Матрица на монитора:</label><br>
                            <input type="text" id="matrix" class="form-control" placeholder="Въведете тип матрица на монитора" name="matrix">
                            <label for="cpu">Процесор:</label><br>
                            <input type="text" id="cpu" class="form-control" placeholder="Въведете процесор" name="cpu">
                            <label for="gpu">Графична карта:</label><br>
                            <input type="text" id="gpu" class="form-control" placeholder="Въведете графична карта" name="gpu">
                            <label for="ram">РАМ памет:</label><br>
                            <input type="text" id="ram" class="form-control" placeholder="Въведете РАМ памет" name="ram">
                            <label for="hdd">Твърд диск:</label><br>
                            <input type="text" id="hdd" class="form-control" placeholder="Въведете твърд диск" name="hdd">
                            <label for="ssd">SSD:</label><br>
                            <input type="text" id="ssd" class="form-control" placeholder="Въведете SSD" name="ssd">
                            <label for="psu">Захранване:</label><br>
                            <input type="text" id="psu" class="form-control" placeholder="Въведете захранване" name="psu">
                            <label for="mb">Дънна платка:</label><br>
                            <input type="text" id="mb" class="form-control" placeholder="Въведете дънна платка" name="mb">
                        </div><!-- /.col-md-6 -->


                        <input type="submit" class="btn-primary" value="Добави" name="">


                    </form>
                <input type="button" id="alterProduct" class="btn-primary" value="Промяна на продукт" name="">
                </div><!-- /.actions -->
                <%--<form action="?" method="post" class="login-form" id="addForm">--%>
               <%--<label for="email">Email:</label><br>--%>
                    <%--<input type="text" class="form-control" placeholder="Моля, въведете вашият Email"><br>--%>
                    <%--<label for="password">Парола:</label><br>--%>
                    <%--<input type="password" class="form-control" placeholder="Моля, въведете вашата парола">--%>
                    <%--<input type="submit" class="btn-primary" value="Вход" name=""> --%>
                <%--</form>--%>
            </div><!-- /.form-container -->
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

    <script type="text/javascript">
        $("#addProduct").click(function(){
    $("#addForm").toggle();
});
    </script>

    <%-- Other--%>
    <script type="text/javascript" src="/js/mainFunctionality.js"></script>
  </body>
</html>