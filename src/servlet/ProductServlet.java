package servlet;

import dao.CategoryDao;
import dao.ProductDao;
import model.Category;
import model.products.Product;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet("/ProductServlet")
public class ProductServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        Product product = new Product();
        product.setProduct_brand(request.getParameter("make"));
        product.setProduct_model(request.getParameter("model"));
        product.setProduct_quantity(Integer.parseInt(request.getParameter("quantity")));
        product.setProduct_price(Double.parseDouble(request.getParameter("price")));
        product.setProduct_description(request.getParameter("description"));
        product.setProduct_image(request.getParameter("image"));
        product.setComputers_cpu(request.getParameter("cpu"));
        product.setComputers_vga(request.getParameter("gpu"));
        product.setComputers_ram(request.getParameter("ram"));
        product.setComputers_hdd(request.getParameter("hdd"));
        product.setComputers_ssd(request.getParameter("ssd"));
        product.setMonitor_size(request.getParameter("inches"));
        product.setMonitor_resolution(request.getParameter("resolution"));
        product.setMonitor_matrix(request.getParameter("matrix"));
        product.setPc_psu(request.getParameter("psu"));
        product.setPc_mb(request.getParameter("mb"));

        RequestDispatcher rd = request.getRequestDispatcher("/admin.jsp");

        CategoryDao categoryDao = CategoryDao.getInstance();
        Category category = categoryDao.getCategory(request.getParameter("category"));
        if(category == null){
            request.setAttribute("errorMessage", "Няма такава категория");
            rd.forward(request, response);
            return;
        }
        product.setCategory(category);

        ProductDao productDao = ProductDao.getInstance();
        if(productDao.insert(product) != null){
            request.setAttribute("successMessage", "Продуктът е създаден успешно!");
            rd.forward(request, response);
        }else{
            request.setAttribute("failMessage", "Грешка при създаване на продукт");
            rd.forward(request, response);
        }
    }

    @Override
    protected void doDelete(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        super.doDelete(req, resp);
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
