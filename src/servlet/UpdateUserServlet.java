package servlet;

import dao.BaseDao;
import dao.UserDao;
import model.User;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet("/UpdateUserServlet")
public class UpdateUserServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String fname = request.getParameter("fName");
        String lname = request.getParameter("lName");
        String email = request.getParameter("email");
        String address = request.getParameter("address");
        String phone = request.getParameter("phone");

        User user = new User();
        user.setFirst_name(fname);
        user.setLast_name(lname);
        user.setEmail(email);
        user.setAddress(address);
        user.setPhone(phone);

        UserDao userDao = UserDao.getInstance();
        userDao.update(user);


        RequestDispatcher rd = request.getRequestDispatcher("/user.jsp");
        request.setAttribute("Success","Промяната е изпълнена успешно!");
        rd.forward(request,response);

    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
