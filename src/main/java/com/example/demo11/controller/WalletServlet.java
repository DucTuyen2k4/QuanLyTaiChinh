package com.example.demo11.controller;

import com.example.demo11.model.Category;
import com.example.demo11.model.User;
import com.example.demo11.model.Wallet;
import com.example.demo11.sevice.IUserDAO;
import com.example.demo11.sevice.IWalletDAO;
import com.example.demo11.sevice.UserDAO;
import com.example.demo11.sevice.WalletDAO;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.sql.SQLException;
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
                    throw  new RuntimeException(e);
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
            case "share":
                try {
                    share(req, resp);
                } catch (SQLException e) {
                    throw new RuntimeException(e);
                } catch (ClassNotFoundException e) {
                    throw new RuntimeException(e);
                }
                break;
            case "showShare":
                try {
                    showShare(req, resp);
                } catch (SQLException e) {
                    throw new RuntimeException(e);
                } catch (ClassNotFoundException e) {
                    throw new RuntimeException(e);
                }
        }
    }

    private void showShare(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException, SQLException, ClassNotFoundException {
        int idWallet = Integer.parseInt(req.getParameter("idWallet"));
        String username = req.getParameter("username");
        String password = req.getParameter("password");


        List<User> list = iUserDAO.show(username, password);
        req.setAttribute("list", list);
        HttpSession session = req.getSession();
        session.setAttribute("user", list.get(0));

        System.out.println(idWallet);
        req.setAttribute("idWallet", idWallet);
        req.getRequestDispatcher("wallet/share.jsp").forward(req, resp);
    }


    private void share(HttpServletRequest req, HttpServletResponse resp) throws SQLException, ClassNotFoundException, ServletException, IOException {
        String email = req.getParameter("email");
        System.out.println(email);
        int idWallet = Integer.parseInt(req.getParameter("idWallet"));
        String permission = req.getParameter("permission");
        String username = req.getParameter("username");
        String password = req.getParameter("password");
        if (iWalletDAO.checkEmailUser_Wallet(email)) {
            User user = iWalletDAO.user_wallet(email);
            int idUser = user.getId();
            iWalletDAO.shareWallet(idUser, idWallet, permission);

            List<Wallet> walletList = iWalletDAO.listWallet(username, password);
            req.setAttribute("list", walletList);


            List<User> list = iUserDAO.show(username, password);
            HttpSession session = req.getSession();
            session.setAttribute("user", list.get(0));
            req.getRequestDispatcher("users/listHome.jsp").forward(req, resp);
        } else {

            req.setAttribute("message", "vi chỉ được chia sẻ 1 lần!");
            req.getRequestDispatcher("user/formChangePassword.jsp").forward(req, resp);
        }

    }
    private void showWallet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException, SQLException, ClassNotFoundException {
        int id = Integer.parseInt(req.getParameter("id"));
        String username = req.getParameter("username");
        String password = req.getParameter("password");
        Wallet wallet = iWalletDAO.checkID(id);
        req.setAttribute("wallet", wallet);

        List<User> list = iUserDAO.show(username, password);
        req.setAttribute("list", list);

        List<Wallet> walletList = walletDAO.listWallet(username, password);
        req.setAttribute("list", walletList);


        HttpSession session = req.getSession();
        session.setAttribute("user", list.get(0));

        List<Category> categoryList = icategoryDao.selectCategory(username,password);
        req.setAttribute("listCategory",categoryList);

        List<Wallet> listWallet = iWalletDAO.showAllWallet(username, password);
        req.setAttribute("list", listWallet);
        req.getRequestDispatcher("users/listHome.jsp").forward(req, resp);
    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String action = req.getParameter("action");
        if (action == null) {
            action = "";
        }

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
        }
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

                List<Wallet> listWallet = iWalletDAO.showAllWallet(username, password);
                req.setAttribute("list", listWallet);
                req.getRequestDispatcher("listHome.jsp").forward(req, resp);

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


        Wallet wallet = new Wallet(idWallet,nameWallet,money);
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
        String username = request.getParameter("username");
        String password = request.getParameter("password");
        int idWallet = Integer.parseInt(request.getParameter("idWallet"));
        String nameWallet = request.getParameter("nameWallet");
        String icon = request.getParameter("icon");
        Double money = Double.valueOf(request.getParameter("money"));
        String description = request.getParameter("description");
        String currency = request.getParameter("currency");
        System.out.println(idWallet + nameWallet + icon + money + description + currency);
        iWalletDAO.updateWallet(new Wallet(idWallet, icon, nameWallet, money, currency, description));

        List<Wallet> listWallet = iWalletDAO.showAllWallet(username, password);
        request.setAttribute("list", listWallet);
        Wallet wallet = new Wallet(idWallet, nameWallet, icon, money, description, currency);
        request.setAttribute("wallet", wallet);
        request.getRequestDispatcher("/users/listHome.jsp").forward(request,response);
    }

    private void addWallet(HttpServletRequest req, HttpServletResponse resp) throws SQLException, ClassNotFoundException, ServletException, IOException {
        int idUser = Integer.parseInt(req.getParameter("id"));
        String username = req.getParameter("username");
        String password = req.getParameter("password");
        String icon = req.getParameter("icon");
        String nameWallet = req.getParameter("nameWallet");
        Double money = Double.valueOf(req.getParameter("money"));
        String currency = req.getParameter("currency");
        String description = req.getParameter("description");
        Wallet wallet = new Wallet(icon, nameWallet, money, currency, description);

            iWalletDAO.addWallet(wallet);
            Wallet wallet1 = iWalletDAO.selectId(nameWallet);
            int idWallet = wallet1.getIdWallet();
            iWalletDAO.addToUser_Wallet(idUser, idWallet);

        List<Wallet> listWallet = iWalletDAO.showAllWallet(username, password);
        req.setAttribute("list", listWallet);
        req.getRequestDispatcher("/users/listHome.jsp").forward(req, resp);
    }
}
