package servlet;

import dao.ProductDao;
import model.products.Product;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet("/UpdateProductServlet")
public class UpdateProductServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String brand = request.getParameter("alterBrand");
        String model = request.getParameter("alterName");
        Double price = Double.parseDouble(request.getParameter("alterPrice"));
        int quantity = Integer.parseInt(request.getParameter("alterQuantity"));
        String description = request.getParameter("alterDescription");

        Product product = new Product();
        product.setProduct_brand(brand);
        product.setProduct_model(model);
        product.setProduct_price(price);
        product.setProduct_quantity(quantity);
        product.setProduct_description(description);

        ProductDao productDao = ProductDao.getInstance();
        productDao.update(product);
        RequestDispatcher rd = request.getRequestDispatcher("/single-product.jsp");
        request.setAttribute("Success","Промяната е изпълнена успешно!");
        rd.forward(request,response);
    }
}
