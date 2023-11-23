package Controller;

import Model.Wallet;
import Service.WalletDao;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.SQLException;

@WebServlet(urlPatterns = "/wallet")
public class WalletServlet extends HomeServlet {
    WalletDao walletDao = new WalletDao();

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String action = req.getParameter("action");
        switch (action) {
            case "addWallet":
                try {
                    addWallet(req, resp);
                } catch (SQLException e) {
                    throw new RuntimeException(e);
                } catch (ClassNotFoundException e) {
                    throw new RuntimeException(e);
                }
        }
    }

    private void addWallet(HttpServletRequest req, HttpServletResponse resp) throws SQLException, ClassNotFoundException, ServletException, IOException {
        String icon = req.getParameter("icon");
        String nameWallet = req.getParameter("nameWallet");
        int money = Integer.parseInt(req.getParameter("moneyWallet"));
        String currency = req.getParameter("currency");
        String description = req.getParameter("description");
        Wallet wallet = new Wallet(icon, nameWallet, money, currency, description);
        walletDao.AddWallet(wallet);
        req.setAttribute("n1", "Add Wallet Successful");
        req.getRequestDispatcher("InsertWallet.jsp").forward(req, resp);
    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String action = req.getParameter("action");
        switch (action) {
            case "FormAddWallet":
                FormAddWallet(req, resp);
        }
    }

    private void FormAddWallet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.getRequestDispatcher("InsertWallet.jsp").forward(req,resp);
    }


    @Override
    public void init() throws ServletException {
        super.init();
    }

    @Override
    public void destroy() {
        super.destroy();
    }
}
