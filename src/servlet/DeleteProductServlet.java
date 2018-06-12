package servlet;

import com.google.gson.Gson;
import com.google.gson.reflect.TypeToken;
import dao.OrderDao;
import dao.ProductDao;
import model.orders.Order;
import model.products.Product;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.BufferedReader;
import java.io.IOException;

@WebServlet("/DeleteProductServlet")
public class DeleteProductServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int idProduct = Integer.parseInt(request.getParameter("idProduct"));


        ProductDao productDao = ProductDao.getInstance();

        productDao.delete(Product.class,productDao.getProductById(idProduct).getId_product());
        RequestDispatcher rd = request.getRequestDispatcher("/single-product.jsp");
        request.setAttribute("Success", "Продуктът е изтрит успешно!");
        rd.forward(request, response);
    }
}
