package servlet;

import dao.UserDao;
import model.User;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.regex.Pattern;

@WebServlet("/RegisterServlet")
public class RegisterServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        RequestDispatcher rd = request.getRequestDispatcher("/register.jsp");
        request.setCharacterEncoding("UTF-8");
        String fNamePattern = "[A-Z\\u0400-\\u04FFa-z\\u0400-\\u04FF]{2,20}";
        String lNamePattern =  "[A-Z\\u0400-\\u04FFa-z\\u0400-\\u04FF]{2,20}";
        String phonePattern = "(359|0)8\\d{2}\\s?\\d{3}\\s?\\d{3}";
        String emailPattern = "\\w+?@\\w+?\\.\\w\\w\\w?";

        String fName = request.getParameter("first_name");
        String lName = request.getParameter("last_name");
        String phone = request.getParameter("phone");
        String address = request.getParameter("address");
        String email = request.getParameter("email");
        String password = request.getParameter("password");

        UserDao userDao = UserDao.getInstance();

        if (checkInfo(fName,fNamePattern) && checkInfo(lName,lNamePattern) && checkInfo(phone,phonePattern) && checkInfo(email,emailPattern) && password.length() >= 8) {
                try {
                    User user = userDao.getUser(email);
                    request.setAttribute("failMessage", "Потребител с такъв email вече съществува!");
                    rd.forward(request, response);

                } catch(Exception e) {
                    User user = new User();
                    user.setFirst_name(fName);
                    user.setLast_name(lName);
                    user.setPhone(phone);
                    user.setAddress(address);
                    user.setEmail(email);
                    user.setPassword(password);
                    user.setPicture(request.getParameter("picture"));

                    if(userDao.insert(user) != null){
                        rd = request.getRequestDispatcher("login.jsp");
                        request.setAttribute("successMessage", "Успешна регистрация!");
                        rd.forward(request, response);
                    } else {
                        request.setAttribute("failMessage", "Грешка при създаване на нов акаунт!");
                        rd.forward(request, response);
                        }
                    }
            } else {
            request.setAttribute("failMessage", "Моля, въведете данните си правилно!");
            rd.forward(request, response);
            }
        }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }

    public boolean checkInfo(String stringToMatch, String patternToMatch) {
        if(stringToMatch.matches(patternToMatch)) {
            return true;
        }
        return false;
    }
}
