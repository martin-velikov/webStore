package servlet;

import com.google.gson.Gson;
import dao.ProductDao;
import model.products.Product;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

@WebServlet("/SearchServlet")
public class SearchServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        RequestDispatcher requestDispatcher = request.getRequestDispatcher("/product-search.jsp");
        Cookie cookie = new Cookie("searchProduct", request.getParameter("searchProducts"));
        response.addCookie(cookie);
        requestDispatcher.forward(request, response);
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        for(Cookie cookie : request.getCookies()){
            if(cookie.getName().equals("searchProduct")){
                ProductDao productDao = ProductDao.getInstance();
                List<Product> productList = productDao.getSearchProduct(cookie.getValue());

                PrintWriter writer = response.getWriter();
                writer.write(new Gson().toJson(productList));
                writer.close();
                cookie.setMaxAge(0);
                cookie.setPath("/");
                RequestDispatcher rd = request.getRequestDispatcher("/product-search.jsp");
                rd.forward(request, response);
                break;
            }
        }

    }
}
