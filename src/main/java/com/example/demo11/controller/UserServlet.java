package com.example.demo11.controller;

import com.example.demo11.model.Category;
import com.example.demo11.model.User;
import com.example.demo11.model.Wallet;
import com.example.demo11.sevice.CategoryDao;
import com.example.demo11.sevice.ICategoryDao;
import com.example.demo11.sevice.UserDAO;
import com.example.demo11.sevice.WalletDAO;
import com.mysql.cj.xdevapi.Session;
import sun.util.calendar.BaseCalendar;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.sql.SQLException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import static java.lang.Float.isNaN;

@WebServlet(name = "UserServlet", value = "/user")
public class UserServlet extends HttpServlet {
    public static UserDAO userDAO;
    public static WalletDAO walletDAO;
    public static ICategoryDao icategoryDao;


    @Override
    public void init() throws ServletException {
        userDAO = new UserDAO();

        walletDAO=new WalletDAO();
        icategoryDao=new CategoryDao();

    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String action = req.getParameter("action");
        if (action == null) {
            action = "";
        }
        switch (action) {
            case "delete":
                try {
                    DeleteUsers(req, resp);
                } catch (SQLException e) {
                    throw new RuntimeException(e);
                } catch (ClassNotFoundException e) {
                    throw new RuntimeException(e);
                }
            case "update":
                try {
                    showFormUpdate(req, resp);
                } catch (SQLException e) {
                    throw new RuntimeException(e);
                } catch (ClassNotFoundException e) {
                    throw new RuntimeException(e);
                }
                break;

            case "Register":
                req.getRequestDispatcher("users/Register.jsp").forward(req, resp);
                break;
            case "changePassword":
                showFormChangePassword(req, resp);
                break;
            case "logoutHome":
                logoutHome(req, resp);
                break;
            default:
                break;
        }

    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String action = req.getParameter("action");
        if (action == null) {
            action = "";
        }
        System.out.println(action);
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


            case "login":
                try {
                    loginUSer(req, resp);
                } catch (SQLException e) {
                    throw new RuntimeException(e);
                }
                break;
            case "confirmUpdate":
                try {
                    confirmUpdate(req, resp);
                } catch (SQLException e) {
                    throw new RuntimeException(e);
                } catch (ClassNotFoundException e) {
                    throw new RuntimeException(e);
                }
                break;

            case "confirmPassword":
                try {
                    confirmPassword(req, resp);
                    break;
                } catch (SQLException e) {
                    throw new RuntimeException(e);
                } catch (ClassNotFoundException e) {
                    throw new RuntimeException(e);
                }
        }
    }


    @Override
    public void destroy() {
        super.destroy();
    }


    private void logoutHome(HttpServletRequest request, HttpServletResponse response) throws IOException {
        request.getSession().invalidate();
        response.sendRedirect(request.getContextPath() + "/users/list.jsp");

    }


    public void DeleteUsers(HttpServletRequest req, HttpServletResponse resp) throws SQLException, ClassNotFoundException, IOException, ServletException {
        int id = Integer.parseInt(req.getParameter("id"));
        userDAO.DeleteUser(id);
        req.getRequestDispatcher("users/list.jsp").forward(req, resp);

    }

    private void loginUSer(HttpServletRequest req, HttpServletResponse resp) throws SQLException, IOException {
        String userName = req.getParameter("userName");
        String password = req.getParameter("password");
        try {
            if (userDAO.checkUser(userName, password)) {
                List<User> list = userDAO.show(userName, password);
                req.setAttribute("list", list);

                List<Wallet> walletList = walletDAO.listWallet(userName, password);
                req.setAttribute("list", walletList);

                HttpSession session = req.getSession();
                session.setAttribute("user", list.get(0));

                List<Category> categoryList = icategoryDao.selectCategory(userName,password);
                req.setAttribute("listCategory",categoryList);

                req.getRequestDispatcher("users/listHome.jsp").forward(req, resp);
            } else {
                req.setAttribute("message", "Tài khoản không tồn tại!");
                req.getRequestDispatcher("users/list.jsp").forward(req, resp);
            }
        } catch (ServletException e) {
            throw new RuntimeException(e);
        } catch (ClassNotFoundException e) {
            throw new RuntimeException(e);
        }
    }

    private void confirmUpdate(HttpServletRequest req, HttpServletResponse resp) throws SQLException, ClassNotFoundException, ServletException, IOException {
        int id = Integer.parseInt(req.getParameter("id"));
        String fullName = req.getParameter("fullName");
        String gender = req.getParameter("gender");
        String birthdate = req.getParameter("birthdate");
        int phoneNumber = Integer.parseInt(req.getParameter("phoneNumber"));
        String image = req.getParameter("image");
        userDAO.updateProfileUser(id, fullName, gender, birthdate, phoneNumber, image);
        List<User> list = userDAO.selectProfileUser(id);
        HttpSession session = req.getSession();
        session.setAttribute("user", list.get(0));
        req.getRequestDispatcher("users/listHome.jsp").forward(req, resp);
    }

    private void showFormUpdate(HttpServletRequest req, HttpServletResponse resp) throws SQLException, ClassNotFoundException, ServletException, IOException {
        int id = Integer.parseInt(req.getParameter("id"));
        List<User> list = userDAO.selectProfileUser(id);
        req.setAttribute("list", list);
        req.getRequestDispatcher("user/updateProfile.jsp").forward(req, resp);
    }

    private void confirmPassword(HttpServletRequest req, HttpServletResponse resp) throws SQLException, ClassNotFoundException, ServletException, IOException {
        int id = Integer.parseInt(req.getParameter("id"));
        String oldPassword = req.getParameter("oldPassword");
        String newPassword = req.getParameter("newPassword");
        String confirmPassword = req.getParameter("confirmPassword");

        User user = userDAO.selectPassword(id);
        String passwordUser = user.getPassword();
        if (passwordUser.equals(oldPassword)) {
            if (confirmPassword.equals(newPassword)) {
                userDAO.updatePassword(id, newPassword);
                req.setAttribute("id", id);

                req.getRequestDispatcher("users/listHome.jsp").forward(req, resp);
            } else {
                req.setAttribute("id", id);
                req.setAttribute("messages", "Mật khẩu không khớp ! ");
                req.getRequestDispatcher("user/formChangePassword.jsp").forward(req, resp);
            }
        } else {
            req.setAttribute("message", "Sai mật khẩu !");
            req.setAttribute("id", id);
            req.getRequestDispatcher("user/formChangePassword.jsp").forward(req, resp);
        }

    }

    private void showFormChangePassword(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        int id = Integer.parseInt(req.getParameter("id"));
        req.setAttribute("id", id);
        req.getRequestDispatcher("user/formChangePassword.jsp").forward(req, resp);
    }


    public static void addUser(HttpServletRequest request, HttpServletResponse response) throws SQLException, ClassNotFoundException, ServletException, IOException {
        String fullName = request.getParameter("fullName");
        String userName = request.getParameter("userName");
        userDAO.CheckUserName(userName);
        if (!userDAO.CheckUserName(userName)) {
            String password = request.getParameter("password");
            String confirmPassword = request.getParameter("confirmPassword");
            if (password.equals(confirmPassword)) {
                String gender = request.getParameter("gender");
                String email = request.getParameter("email");
                String birthdateString = request.getParameter("birthdate");
                String image = request.getParameter("image");
                String phoneNumberSt = request.getParameter("phoneNumber");
                int phoneNumber = 0;
                try {
                    phoneNumber = Integer.parseInt(phoneNumberSt);
                    SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
                    Date birthdate = null;
                    Date currentDate = new Date();
                    System.out.println(currentDate);
                    try {
                        birthdate = sdf.parse(birthdateString);
                        System.out.println(birthdate);
                        if (currentDate.compareTo(birthdate) > 0) {
                            userDAO.addUser(new User(fullName, userName, password, email, gender, image, birthdate, phoneNumber));
                            request.getRequestDispatcher("RegisterSuccess.jsp").forward(request, response);
                        } else {

                            request.setAttribute("messageFailureBirthdate", "Ngày tháng năm sinh không thể lớn hơn ngày hiện tại.");
                            request.getRequestDispatcher("users/Register.jsp").forward(request, response);
                        }
                    } catch (ParseException e) {
                        e.printStackTrace();
                    }

                } catch (NumberFormatException e) {
                    request.setAttribute("messageFailurePhoneNumber", "Vui lòng nhập đúng 10 số điện thoại.");
                    request.getRequestDispatcher("users/Register.jsp").forward(request, response);
                }


            } else {
                request.setAttribute("messageFailurePassword", "Mật khẩu không trùng nhau");
                request.getRequestDispatcher("users/Register.jsp").forward(request, response);

            }

        } else {
            request.setAttribute("messageFailureUserName", "Tên đăng nhập đã tồn tại.");
            request.getRequestDispatcher("users/Register.jsp").forward(request, response);
        }

    }

}