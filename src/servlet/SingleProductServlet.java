package servlet;

import com.google.gson.Gson;
import com.google.gson.annotations.SerializedName;
import com.google.gson.reflect.TypeToken;
import dao.CategoryDao;
import dao.ProductDao;
import model.Category;
import model.products.Product;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.BufferedReader;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

@WebServlet("/SingleProductServlet")
public class SingleProductServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        RequestDispatcher requestDispatcher = request.getRequestDispatcher("/single-product.jsp");
        Cookie cookie = new Cookie("productId", request.getParameter("productId"));
        response.addCookie(cookie);
        requestDispatcher.forward(request, response);
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        ProductDao productDao = ProductDao.getInstance();
        for(Cookie cookie : request.getCookies()){
            if(cookie.getName().equals("productId")){
                Product product = productDao.getProductCopy(Long.valueOf(cookie.getValue()));
                String json = new Gson().toJson(product);
                PrintWriter printWriter = response.getWriter();
                printWriter.write(json);
                printWriter.close();
                cookie.setMaxAge(0);
                cookie.setPath("/");
                break;
            }
        }

        RequestDispatcher requestDispatcher = request.getRequestDispatcher("/single-product.jsp");

        requestDispatcher.forward(request, response);
    }

    static class Response{
         int productId;
    }
}
