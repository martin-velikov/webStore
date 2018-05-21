package servlet;

import com.google.gson.Gson;
import com.google.gson.reflect.TypeToken;
import dao.OrderDao;
import dao.ProductDao;
import dao.UserDao;
import model.User;
import model.orders.Order;
import model.orders.OrderItem;
import model.products.Product;
import org.hibernate.Session;

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
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Date;
import java.util.List;

import static com.sun.deploy.net.protocol.ProtocolType.HTTP;

@WebServlet("/OrderServlet")
public class OrderServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        RequestDispatcher rd = request.getRequestDispatcher("/cart.jsp");
        response.setHeader("Content-Type","text/xml; charset=utf-8");
        StringBuffer jb = new StringBuffer();
        String line = null;
        try {
            BufferedReader reader = request.getReader();
            while ((line = reader.readLine()) != null)
                jb.append(line);
        } catch (Exception e) { /*report an error*/ }
        List<OrderModel> list = null;
        try{
           list = new Gson().fromJson(jb.toString(), new TypeToken<List<OrderModel>>() {}.getType());
        }catch (Exception e) {
            response.setStatus(500);
            PrintWriter writer = response.getWriter();
            writer.write("Internal server error!");
            writer.close();
            rd.forward(request, response);
            return;
        }
        if(list.isEmpty()){
            response.setStatus(422);
            PrintWriter writer = response.getWriter();
            writer.write("List is empty!");
            writer.close();
            rd.forward(request, response);
            return;
        }
        Order order = new Order();
        List<OrderItem> orderItemList = new ArrayList<>();
        ProductDao productDao = ProductDao.getInstance();
        for(OrderModel orderModel : list){
            Product product = productDao.getProductCopy(orderModel.id);
            OrderItem orderItem = new OrderItem();
            orderItem.setProduct(product);
            orderItem.setPrice(product.getProduct_price());
            orderItem.setQuantity(orderModel.quantity);
            orderItemList.add(orderItem);
        }

        order.setOrderItems(orderItemList);
        order.setDate(new Date());
        order.setUser((User) request.getSession().getAttribute("User"));
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
            response.setStatus(200);
            PrintWriter writer = response.getWriter();
            writer.write("Поръчката е приета!");
            writer.close();
            rd.forward(request, response);

        }else{
            PrintWriter writer = response.getWriter();
            writer.write("Проблем с поръчката!");
            writer.close();
            rd.forward(request, response);
        }
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}

 class OrderModel{
    long id;
    int quantity;
}