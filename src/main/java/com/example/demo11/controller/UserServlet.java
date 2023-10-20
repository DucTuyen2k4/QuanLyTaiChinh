package com.example.demo11.controller;

import com.example.demo11.model.User;
import com.example.demo11.sevice.UserDAO;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.SQLException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

@WebServlet(name="UserServlet",value = "/user")
public class UserServlet extends HttpServlet {
    public static UserDAO userDAO;


    @Override
    public void init() throws ServletException {
        userDAO = new UserDAO();
    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        register(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String action = req.getParameter("action");
        if (action == null) {
            action = "";
        }
        switch (action) {
            case "addUser":
                try {
                    addUser(req, resp);
                } catch (SQLException e) {
                    throw new RuntimeException(e);
                } catch (ClassNotFoundException e) {
                    throw new RuntimeException(e);
                }
                break;
            default:
//vị trí màn hình thêm
                break;
        }
    }

    @Override
    public void destroy() {
        super.destroy();
    }
    public static void register(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.getRequestDispatcher("Register.jsp").forward(request, response);//vị chí sẽ chuyền tới sau khi nhấn vào
    }
    public static void addUser(HttpServletRequest request, HttpServletResponse response) throws SQLException, ClassNotFoundException, ServletException, IOException {
        String fullName = request.getParameter("fullName");
        String userName = request.getParameter("userName");

        String password = request.getParameter("password");
        String confirmPassword = request.getParameter("confirmPassword");
        System.out.println(password);
        System.out.println(confirmPassword);
        if (password.equals(confirmPassword)) {
            System.out.println("ok");
            String gender = request.getParameter("gender");
            String birthdateString = request.getParameter("birthdate");
            int phoneNumber = Integer.parseInt(request.getParameter("phoneNumber"));
            System.out.println(userName + password + gender + birthdateString + phoneNumber);
            SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
            Date birthdate = null;
            try {

                birthdate = sdf.parse(birthdateString);
            } catch (ParseException e) {
                e.printStackTrace();
            }

            userDAO.addUser(new User(fullName,userName, password, gender, birthdate, phoneNumber));
            System.out.println("MK đúng ");
            //  request.getRequestDispatcher("index.jsp").forward(request, response); //-vị trí sau khi tạo thành công mình sẽ chuyển tới đâu
        } else {
            System.out.println("xác nhận mk sai ");
        }
    }

}
