package servlet;

import com.google.gson.Gson;
import dao.ProductDao;
import model.products.Product;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

@WebServlet("/CategoryListServlet")
public class CategoryListServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        RequestDispatcher rd = request.getRequestDispatcher("/categories.jsp");
        String categoryName = request.getParameter("category").toLowerCase();

        ProductDao productDao = ProductDao.getInstance();

        List<Product> products = productDao.getProductsForCategory(categoryName);
        PrintWriter writer = response.getWriter();
        writer.write(new Gson().toJson(products));
        writer.close();

        rd.forward(request, response);
    }
}
