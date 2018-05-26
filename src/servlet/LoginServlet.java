package servlet;

import dao.UserDao;
import model.User;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;

@WebServlet("/LoginServlet")
public class LoginServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String email = request.getParameter("email");
        String password = request.getParameter("password");

        UserDao userDao = UserDao.getInstance();
        try {
            User user = userDao.getUser(email);
            if (user!=null){
                if (user.getPassword().equals(password)){
                    HttpSession session = request.getSession();
                    session.setAttribute("User", user);
                    RequestDispatcher rd = request.getRequestDispatcher("/index.jsp");
                    rd.forward(request, response);
                    return;
                }
                else {
                    RequestDispatcher rd = request.getRequestDispatcher("/login.jsp");
                    request.setAttribute("failMessage", "Грешен потребител или парола!");
                    rd.forward(request,response);
                }
        }
        }catch (Exception e) {
                RequestDispatcher rd = request.getRequestDispatcher("/login.jsp");
                request.setAttribute("failMessage", "Грешен потребител или парола!");
                rd.forward(request,response);
        }

    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
