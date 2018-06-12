package servlet;

import com.google.gson.Gson;
import com.google.gson.reflect.TypeToken;
import dao.OrderDao;
import model.orders.Order;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.BufferedReader;
import java.io.IOException;

@WebServlet("/UpdateOrderServlet")
public class UpdateOrderServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        String newStatus = request.getParameter("orderStatus");
        int orderId = Integer.parseInt(request.getParameter("orderId"));
        StringBuffer jb = new StringBuffer();
        String line = null;
        try {
            BufferedReader reader = request.getReader();
            while ((line = reader.readLine()) != null)
                jb.append(line);
        } catch (Exception e) { /*report an error*/ }
        Response resp = null;
        try{
            resp = new Gson().fromJson(jb.toString(), new TypeToken<Response>() {}.getType());
            OrderDao orderDao = OrderDao.getInstance();
            for (Order order : orderDao.getAllEntities("Order")) {
                if (order.getId_order() == orderId) {
                    order.setStatus(newStatus);
                    try{
                        orderDao.update(order);
                    } catch (Exception e) {
                        RequestDispatcher rd = request.getRequestDispatcher("admin.jsp");
                        request.setAttribute("failMessage","Проблем с промяната на статус!");
                        rd.forward(request,response);
                        break;
                    }

                    RequestDispatcher rd = request.getRequestDispatcher("admin.jsp");
                    request.setAttribute("successMessage","Успешно променен статус на поръчка!");
                    rd.forward(request,response);
                    break;
                    }
                }

        }catch (Exception e) { }
    }

    static class Response{
        int orderId;
        String orderStatus;
    }

}


