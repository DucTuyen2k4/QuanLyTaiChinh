package com.example.demo11.controller;

import com.example.demo11.model.*;
import com.example.demo11.sevice.*;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.nio.charset.StandardCharsets;
import java.sql.SQLException;
import java.time.LocalDate;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.List;
;import static com.example.demo11.controller.UserServlet.icategoryDao;
import static com.example.demo11.controller.UserServlet.walletDAO;

@WebServlet(name = "WalletServlet", value = "/wallet")
public class WalletServlet extends HttpServlet {
    public static IUserDAO iUserDAO;
    private static IWalletDAO iWalletDAO;


    @Override
    public void init() {
        iUserDAO = new UserDAO();
        iWalletDAO = new WalletDAO();

    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String action = req.getParameter("action");
        if (action == null) {
            action = "";
        }
        req.setCharacterEncoding("UTF-8");
        resp.setContentType("text/html; charset=UTF-8");

        switch (action) {
            case "showFormBanking":
                try {
                    formBanking(req, resp);
                } catch (SQLException e) {
                    throw new RuntimeException(e);
                } catch (ClassNotFoundException e) {
                    throw new RuntimeException(e);
                }
                break;
            case "updateWallet":
                try {
                    updateWallet(req, resp);
                } catch (SQLException e) {
                    throw new RuntimeException(e);
                } catch (ClassNotFoundException e) {
                    throw new RuntimeException(e);
                }
                break;

            case "showWalletUpdate":
                try {
                    showWalletUpdate(req, resp);
                } catch (SQLException e) {
                    throw new RuntimeException(e);
                } catch (ClassNotFoundException e) {
                    throw new RuntimeException(e);
                }
                break;
            case "confirmBanking":
                try {
                    confirmBanking(req, resp);
                } catch (SQLException e) {
                    throw new RuntimeException(e);
                } catch (ClassNotFoundException e) {
                    throw new RuntimeException(e);
                }
                break;
            case "showFormShare":
                    formShare(req, resp);
                break;
            case "share":
                try {
                    shareWallet(req, resp);
                } catch (SQLException e) {
                    throw new RuntimeException(e);
                } catch (ClassNotFoundException e) {
                    throw new RuntimeException(e);
                }
                break;
            case  "addMoney" :
                try {
                    addMoney(req,resp);
                } catch (SQLException e) {
                    throw new RuntimeException(e);
                } catch (ClassNotFoundException e) {
                    throw new RuntimeException(e);
                }
                break;
        }
    }

    private void addMoney(HttpServletRequest req, HttpServletResponse resp) throws SQLException, ClassNotFoundException, ServletException, IOException {
        String username= req.getParameter("username");
        String password = req.getParameter("password");
        double money = Double.parseDouble(req.getParameter("money"));
        String wallet = req.getParameter("wallet");
        String note = "Nạp thêm tiền vào ví";

        if (iWalletDAO.selectNameWallet(wallet)){
            Wallet walletMoney =  iWalletDAO.selectMoney(wallet);
            double moneyOld = walletMoney.getMoney();
            double moneyNew = moneyOld+money;

            iWalletDAO.updateMoney(moneyNew,wallet);

            LocalDate localDateTime = LocalDate.now();
            DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy/MM/dd");
            String time = localDateTime.format(formatter);


            Wallet wallet1 = iWalletDAO.selectId(wallet);
            int idWallet = wallet1.getIdWallet();

            iWalletDAO.insertRevenue(idWallet,note,money,time);





            List<Wallet> walletShowMoney = walletDAO.showMoney(username);
            req.setAttribute("money", walletShowMoney);
            List<User> list = iUserDAO.show(username, password);
            List<Wallet> walletList = walletDAO.listWallet(username, password);
            req.setAttribute("list", walletList);
            HttpSession session = req.getSession();
            session.setAttribute("user", list.get(0));
            List<Category> categoryList = icategoryDao.selectCategory(username, password);
            req.setAttribute("showNameCategory", categoryList);
            req.getRequestDispatcher("users/Home.jsp").forward(req, resp);

        }else {
            List<User> list = iUserDAO.show(username, password);
            HttpSession session = req.getSession();
            session.setAttribute("user", list.get(0));

            req.setAttribute("message","Tên ví khong tồn tại ");
            req.getRequestDispatcher("/wallet/formAddMoney.jsp").forward(req,resp);
        }
    }


    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String action = req.getParameter("action");
        if (action == null) {
            action = "";
        }
        req.setCharacterEncoding("UTF-8");
        resp.setContentType("text/html; charset=UTF-8");

        switch (action) {
            case "ShowWallet":
                try {
                    showWallet(req, resp);
                } catch (SQLException e) {
                    throw new RuntimeException(e);
                } catch (ClassNotFoundException e) {
                    throw new RuntimeException(e);
                }
                break;

            case "addWallet":
                try {
                    addWallet(req, resp);
                } catch (SQLException e) {
                    throw new RuntimeException(e);
                } catch (ClassNotFoundException e) {
                    throw new RuntimeException(e);
                }
                break;
            case "delete":
                try {
                    Delete(req, resp);
                } catch (SQLException e) {
                    throw new RuntimeException(e);
                } catch (ClassNotFoundException e) {
                    throw new RuntimeException(e);
                }
                break;
            case "revenue" :
                try {
                    showRevenue(req,resp);
                } catch (SQLException e) {
                    throw new RuntimeException(e);
                } catch (ClassNotFoundException e) {
                    throw new RuntimeException(e);
                }
                break;

        }
    }

    private void showRevenue(HttpServletRequest req, HttpServletResponse resp) throws SQLException, ClassNotFoundException, ServletException, IOException {
        String username = req.getParameter("username");
        String password = req.getParameter("password");

        List<Revenue> listRevenue = iWalletDAO.selectRevenue();
        req.setAttribute("listRevenue",listRevenue);

        List<Wallet> walletShowMoney = walletDAO.showMoney(username);
        req.setAttribute("money", walletShowMoney);
        List<User> list = iUserDAO.show(username, password);
        List<Wallet> walletList = walletDAO.listWallet(username, password);
        req.setAttribute("list", walletList);
        HttpSession session = req.getSession();
        session.setAttribute("user", list.get(0));
        List<Category> categoryList = icategoryDao.selectCategory(username, password);
        req.setAttribute("showNameCategory", categoryList);
        req.getRequestDispatcher("users/Home.jsp").forward(req, resp);


    }

    private void formShare(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        int id = Integer.parseInt(req.getParameter("idWallet"));
        String username = req.getParameter("username");
        String password = req.getParameter("password");

        List<User> list = iUserDAO.show(username, password);
        HttpSession session = req.getSession();
        session.setAttribute("user", list.get(0));
        req.setAttribute("id", id);
        req.getRequestDispatcher("/wallet/share.jsp").forward(req, resp);


    }


    private void shareWallet(HttpServletRequest req, HttpServletResponse resp) throws SQLException, ClassNotFoundException, ServletException, IOException {
        int id = Integer.parseInt(req.getParameter("idWallet"));
        String username = req.getParameter("username");
        String password = req.getParameter("password");
        String email = req.getParameter("email");
        String permission = req.getParameter("permission");
        if (iWalletDAO.checkEmail(email)) {
            System.out.println("ok");
            Wallet wallet = iWalletDAO.selectIdWallet(email);
            int idUser = wallet.getIdWallet();

            if (iWalletDAO.checkUserWallet(idUser, id) == false) {
                iWalletDAO.insertShareWallet(idUser, id, permission);

                List<User> list = iUserDAO.show(username, password);

                req.setAttribute("list", list);

                List<Wallet> walletList = iWalletDAO.listWallet(username, password);
                req.setAttribute("list", walletList);

                HttpSession session = req.getSession();
                session.setAttribute("user", list.get(0));

                List<Category> categoryList = icategoryDao.selectCategory(username, password);
                req.setAttribute("listCategory", categoryList);

                req.getRequestDispatcher("users/Home.jsp").forward(req, resp);

            } else {
                req.setAttribute("messages", "Tài khoản đã được chia sẻ");
                List<User> list = iUserDAO.show(username, password);
                HttpSession session = req.getSession();
                session.setAttribute("user", list.get(0));
                req.setAttribute("id", id);
                req.getRequestDispatcher("/wallet/share.jsp").forward(req, resp);

            }
        } else {
            req.setAttribute("message", "tai khoan khong ton tai");
            req.getRequestDispatcher("/wallet/share.jsp").forward(req, resp);
            List<User> list = iUserDAO.show(username, password);
            HttpSession session = req.getSession();
            session.setAttribute("user", list.get(0));
            req.setAttribute("id", id);

        }

    }


    private void showWallet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException, SQLException, ClassNotFoundException {
        int id = Integer.parseInt(req.getParameter("id"));
        String username = req.getParameter("username");
        String password = req.getParameter("password");
        String permission = req.getParameter("permission");
        Wallet wallet = iWalletDAO.checkID(id);
        req.setAttribute("wallet", wallet);

        if ("owner".equalsIgnoreCase(permission)) {

            List<User> list = iUserDAO.show(username, password);
            req.setAttribute("list", list);

            List<Wallet> walletList = walletDAO.listWallet(username, password);
            req.setAttribute("list", walletList);
            HttpSession session = req.getSession();
            session.setAttribute("user", list.get(0));

            List<Category> categoryList = icategoryDao.selectCategory(username, password);
            req.setAttribute("showNameCategory", categoryList);


            List<Wallet> listWallet = iWalletDAO.showAllWallet(username, password);
            req.setAttribute("list", listWallet);
            req.setAttribute("send", "send");
            req.getRequestDispatcher("users/Wallet.jsp").forward(req, resp);
        } else {
            List<User> list = iUserDAO.show(username, password);
            req.setAttribute("list", list);

            List<Wallet> walletList = walletDAO.listWallet(username, password);
            req.setAttribute("list", walletList);


            HttpSession session = req.getSession();
            session.setAttribute("user", list.get(0));

            List<Category> categoryList = icategoryDao.selectCategory(username, password);
            req.setAttribute("showNameCategory", categoryList);

            List<Wallet> listWallet = iWalletDAO.showAllWallet(username, password);
            req.setAttribute("list", listWallet);
            req.setAttribute("send", "");

            req.getRequestDispatcher("users/Wallet.jsp").forward(req, resp);
        }


    }

    private void Delete(HttpServletRequest req, HttpServletResponse resp) throws SQLException, ClassNotFoundException, ServletException, IOException {
        String username = req.getParameter("username");
        String password = req.getParameter("password");
        int idWallet = Integer.parseInt(req.getParameter("idWallet"));
        iWalletDAO.deleteWallet(idWallet);
        List<Wallet> listWallet = iWalletDAO.showAllWallet(username, password);
        req.setAttribute("list", listWallet);
        List<Category> categoryList = icategoryDao.selectCategory(username, password);
        req.setAttribute("listCategory", categoryList);
        req.getRequestDispatcher("users/Wallet.jsp").forward(req, resp);
    }

    private void confirmBanking(HttpServletRequest req, HttpServletResponse resp) throws SQLException, ClassNotFoundException, ServletException, IOException {
        String username = req.getParameter("username");
        String password = req.getParameter("password");

        int idWallet = Integer.parseInt(req.getParameter("idWallet"));
        String nameWallet = req.getParameter("nameWallet");
        double money = Double.parseDouble(req.getParameter("money"));
        String name = req.getParameter("name");
        double moneyBanking = Double.parseDouble(req.getParameter("moneyBanking"));


        if (iWalletDAO.selectWallet(name)) {
            if (money >= moneyBanking) {
                Wallet wallet = iWalletDAO.selectMoney(nameWallet);
                double moneyBank = wallet.getMoney();
                double result = moneyBank - moneyBanking;

                Wallet wallet1 = iWalletDAO.selectMoneyBanking(name);
                double receiveMoney = wallet1.getMoney();
                double sum = receiveMoney + moneyBanking;


                iWalletDAO.updateMoney(result, nameWallet);
                iWalletDAO.updateMoneyBanking(sum, name);
                List<User> list = iUserDAO.show(username, password);


                List<Wallet> walletList = walletDAO.listWallet(username, password);
                req.setAttribute("list", walletList);


                HttpSession session = req.getSession();
                session.setAttribute("user", list.get(0));

                List<Category> categoryList = icategoryDao.selectCategory(username,password);
                req.setAttribute("listCategory",categoryList);

                req.getRequestDispatcher("users/Home.jsp").forward(req,resp);

            } else {
                req.setAttribute("messages", "Số dư không đủ để chuyển!");
                Wallet wallet = new Wallet(idWallet, nameWallet, money);
                req.setAttribute("wallet", wallet);

                List<User> list = iUserDAO.show(username, password);
                HttpSession session = req.getSession();
                session.setAttribute("user", list.get(0));
                req.getRequestDispatcher("/wallet/formBanking.jsp").forward(req, resp);
            }
        } else {
            req.setAttribute("message", "Tên tài khoản không tồn tại!");
            Wallet wallet = new Wallet(idWallet, nameWallet, money);
            req.setAttribute("wallet", wallet);

            List<User> list = iUserDAO.show(username, password);
            HttpSession session = req.getSession();
            session.setAttribute("user", list.get(0));
            req.getRequestDispatcher("/wallet/formBanking.jsp").forward(req, resp);
        }


    }

    private void formBanking(HttpServletRequest req, HttpServletResponse resp) throws SQLException, ClassNotFoundException, ServletException, IOException {
        int idWallet = Integer.parseInt(req.getParameter("idWallet"));
        String nameWallet = req.getParameter("nameWallet");
        double money = Double.parseDouble(req.getParameter("money"));

        String username = req.getParameter("username");
        String password = req.getParameter("password");


        Wallet wallet = new Wallet(idWallet, nameWallet, money);
        req.setAttribute("wallet", wallet);

        List<User> list = iUserDAO.show(username, password);
        HttpSession session = req.getSession();
        session.setAttribute("user", list.get(0));

        req.getRequestDispatcher("/wallet/formBanking.jsp").forward(req, resp);

    }

    private void showWalletUpdate(HttpServletRequest req, HttpServletResponse resp) throws SQLException, ClassNotFoundException, ServletException, IOException {
        int idWallet = Integer.parseInt(req.getParameter("idWallet"));
        String username = req.getParameter("username");
        String password = req.getParameter("password");
        List<User> list = iUserDAO.show(username, password);

        List<Wallet> wallet = iWalletDAO.showWallet(idWallet);
        req.setAttribute("listWalletUpdate", wallet);
        HttpSession session = req.getSession();
        session.setAttribute("user", list.get(0));
        req.getRequestDispatcher("wallet/updateWallet.jsp").forward(req, resp);
    }

    private void updateWallet(HttpServletRequest request, HttpServletResponse response) throws SQLException, ClassNotFoundException, ServletException, IOException {
        String userName = request.getParameter("username");
        String password = request.getParameter("password");

        int idWallet = Integer.parseInt(request.getParameter("idWallet"));
        String icon = request.getParameter("icon");
        String nameWallet = new String(request.getParameter("nameWallet").getBytes(StandardCharsets.ISO_8859_1), StandardCharsets.UTF_8);
        Double money = Double.valueOf(request.getParameter("money"));
        String description = request.getParameter("description");
        String currency = request.getParameter("currency");
        System.out.println(idWallet + nameWallet + icon + money + description + currency);
        iWalletDAO.updateWallet(new Wallet(idWallet, icon, nameWallet, money, currency, description));

//        List<Wallet> listWallet = iWalletDAO.showAllWallet(userName, password);
//        request.setAttribute("list", listWallet);

        Wallet wallet = new Wallet(idWallet, icon, nameWallet, money, description, currency);
        request.setAttribute("wallet", wallet);
//        List<Category> categoryList = icategoryDao.selectCategory(userName, password);
//        req.setAttribute("showNameCategory", categoryList);
//        List<Category> categoryList = icategoryDao.selectCategory(username, password);
//        request.setAttribute("showNameCategory", categoryList);
//
//        request.getRequestDispatcher("/users/Wallet.jsp").forward(request, response);
        String permission = "owner";
        request.setAttribute("wallet", wallet);
        if ("owner".equalsIgnoreCase(permission)) {

            List<User> list = iUserDAO.show(userName, password);
            request.setAttribute("list", list);

            List<Wallet> walletList = walletDAO.listWallet(userName, password);
            request.setAttribute("list", walletList);
            HttpSession session = request.getSession();
            session.setAttribute("user", list.get(0));

            List<Category> categoryList = icategoryDao.selectCategory(userName, password);
            request.setAttribute("showNameCategory", categoryList);


            List<Wallet> listWallet = iWalletDAO.showAllWallet(userName, password);
            request.setAttribute("list", listWallet);
            request.setAttribute("send", "send");
            request.getRequestDispatcher("users/Wallet.jsp").forward(request, response);
        } else {
            List<User> list = iUserDAO.show(userName, password);
            request.setAttribute("list", list);

            List<Wallet> walletList = walletDAO.listWallet(userName, password);
            request.setAttribute("list", walletList);
            HttpSession session = request.getSession();
            session.setAttribute("user", list.get(0));

            List<Category> categoryList = icategoryDao.selectCategory(userName, password);
            request.setAttribute("showNameCategory", categoryList);

            List<Wallet> listWallet = iWalletDAO.showAllWallet(userName, password);
            request.setAttribute("list", listWallet);
            request.setAttribute("send", "");

            request.getRequestDispatcher("users/Wallet.jsp").forward(request, response);
        }


    }

    private void addWallet(HttpServletRequest req, HttpServletResponse resp) throws SQLException, ClassNotFoundException, ServletException, IOException {
        int idUser = Integer.parseInt(req.getParameter("id"));
        String userName = req.getParameter("username");
        String password = req.getParameter("password");
        String icon = req.getParameter("icon");
        String nameWallet = req.getParameter("nameWallet");
        Double money = Double.valueOf(req.getParameter("money"));
        String currency = req.getParameter("currency");
        String description = req.getParameter("description");
        String permission = "owner";
        Wallet wallet = new Wallet(icon, nameWallet, money, currency, description, permission);

        iWalletDAO.addWallet(wallet);
        Wallet wallet1 = iWalletDAO.selectId(nameWallet);
        int idWallet = wallet1.getIdWallet();
        iWalletDAO.addToUser_Wallet(idUser, idWallet, permission);

//        Wallet wallet = iWalletDAO.checkID(id);
        req.setAttribute("wallet", wallet);
        if ("owner".equalsIgnoreCase(permission)) {

            List<User> list = iUserDAO.show(userName, password);
            req.setAttribute("list", list);

            List<Wallet> walletList = walletDAO.listWallet(userName, password);
            req.setAttribute("list", walletList);
            HttpSession session = req.getSession();
            session.setAttribute("user", list.get(0));

            List<Category> categoryList = icategoryDao.selectCategory(userName, password);
            req.setAttribute("showNameCategory", categoryList);


            List<Wallet> listWallet = iWalletDAO.showAllWallet(userName, password);
            req.setAttribute("list", listWallet);
            req.setAttribute("send", "send");
            req.getRequestDispatcher("users/Wallet.jsp").forward(req, resp);
        } else {
            List<User> list = iUserDAO.show(userName, password);
            req.setAttribute("list", list);

            List<Wallet> walletList = walletDAO.listWallet(userName, password);
            req.setAttribute("list", walletList);


            HttpSession session = req.getSession();
            session.setAttribute("user", list.get(0));

            List<Category> categoryList = icategoryDao.selectCategory(userName, password);
            req.setAttribute("showNameCategory", categoryList);

            List<Wallet> listWallet = iWalletDAO.showAllWallet(userName, password);
            req.setAttribute("list", listWallet);
            req.setAttribute("send", "");

            req.getRequestDispatcher("users/Wallet.jsp").forward(req, resp);
        }


    }
}