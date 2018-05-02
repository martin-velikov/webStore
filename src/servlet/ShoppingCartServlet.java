package servlet;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;

//TODO change name to /AddToShoppingCartServlet
@WebServlet("/ShoppingCartServlet")
public class ShoppingCartServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String[] idsArray = request.getParameterValues("ids[]");
        String[] quantitiesArray = request.getParameterValues("quantities[]");
        String shouldAlter = request.getParameter("shouldAlter");
        List<String> ids;
        List<String> quantities;
        if(idsArray != null && idsArray.length != 0){
            ids = Arrays.asList(idsArray);
        }else{
            ids = new ArrayList<>();
        }
        if(quantitiesArray != null && quantitiesArray.length != 0){
            quantities = Arrays.asList(quantitiesArray);
        }else{
            quantities = new ArrayList<>();
        }

        String id = request.getParameter("id");
        String quantity = request.getParameter("quantity");
        if(id != null){
            ids.add(id);
        }
        if(quantity != null){
            quantities.add(quantity);
        }
        for(Cookie cookie : request.getCookies()){
            for(int i = 0; i< ids.size(); i++) {
                if (cookie.getName().equals(ids.get(i))) {
                    if ("true".equals(shouldAlter)) {
                        quantity = quantities.get(i);
                    } else {
                        int oldQuantity = Integer.parseInt(cookie.getValue());
                        quantity = String.valueOf(++oldQuantity);
                    }
                    id = ids.get(i);
                }
            }
            if(id == null || quantity == null){
                continue;
            }
            Cookie cookieToSend = new Cookie(id, quantity);
            if("0".equals(quantity)){
                cookieToSend.setMaxAge(0);
            }
            response.addCookie(cookieToSend);
        }
        response.sendRedirect("cart.jsp");
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
