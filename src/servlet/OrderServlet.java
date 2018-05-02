package servlet;

import dao.OrderDao;
import dao.ProductDao;
import dao.UserDao;
import model.orders.Order;
import model.orders.OrderItem;
import model.products.Product;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Date;
import java.util.List;

@WebServlet("/OrderServlet")
public class OrderServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String[] idsArray = request.getParameterValues("ids[]");
        String[] quantitiesArray = request.getParameterValues("quantities[]");
        List<String> ids = null;
        List<String> quantities = null;
        if(idsArray != null && idsArray.length != 0){
            ids = Arrays.asList(idsArray);
        }else{
            //TODO no ids supplied... handle the error
        }
        if(quantitiesArray != null && quantitiesArray.length != 0){
            quantities = Arrays.asList(quantitiesArray);
        }else{
            //TODO no quantities supplied... handle the error
        }

        Order order = new Order();
        List<OrderItem> orderItemList = new ArrayList<>();
        ProductDao productDao = ProductDao.getInstance();
        List<Long> longIds = new ArrayList<>();
        for(String stringId : ids){
            longIds.add(Long.valueOf(stringId));
        }
        List<Product> products = productDao.getProductsByIds(longIds);
        for(int i = 0; i< ids.size(); i++){
            OrderItem orderItem = new OrderItem();
            for(Product product : products){
                if(longIds.get(i).equals(product.getId())){
                    orderItem.setProduct(product);
                    orderItem.setPrice(product.getProduct_price());
                    orderItem.setQuantity(Integer.valueOf(quantities.get(i)));
                }
            }
                if (orderItem.getProduct() != null) {
                    orderItemList.add(orderItem);
                }

        }
        order.setOrderItems(orderItemList);
        order.setDate(new Date());
        order.setStatus("Поръчката е приета");
        order.setUser(UserDao.getInstance().getAllEntities("User").get(0));
        RequestDispatcher rd = request.getRequestDispatcher("/cart.jsp");
        OrderDao orderDao = OrderDao.getInstance();
        if(orderDao.insert(order) != null){
            for (Cookie cookie : request.getCookies()){
                if(cookie.getName().equals("JSESSIONID")){
                    continue;
                }
                Cookie cookie1 = new Cookie(cookie.getName(), "");
                cookie1.setMaxAge(0);
                cookie1.setPath("/");
                response.addCookie(cookie1);
            }
            request.setAttribute("successMessage", "Поръчката е приета!");
            rd.forward(request, response);

        }else{
            request.setAttribute("failMessage", "Проблем с поръчката!");
            rd.forward(request, response);
        }
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
