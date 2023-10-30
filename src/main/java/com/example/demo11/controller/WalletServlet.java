package com.example.demo11.controller;

import com.example.demo11.model.User;
import com.example.demo11.model.Wallet;
import com.example.demo11.sevice.IWalletDAO;
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

@WebServlet(name = "WalletServlet", value = "/wallet")
public class WalletServlet extends HttpServlet {

    private IWalletDAO iWalletDAO;

    @Override
    public void init() throws ServletException {
        iWalletDAO = new WalletDAO();
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String action = req.getParameter("action");
        if (action == null) {
            action = "";
        }
        switch (action) {
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

    private void addWallet(HttpServletRequest req, HttpServletResponse resp) throws SQLException, ClassNotFoundException, ServletException, IOException {
        int idUser = Integer.parseInt(req.getParameter("id"));
        System.out.println(idUser);
        String username = req.getParameter("username");
        System.out.println(username);
        String password = req.getParameter("password");
        String icon = req.getParameter("icon");
        String nameWallet = req.getParameter("nameWallet");
        Double money = Double.valueOf(req.getParameter("money"));
        String currency = req.getParameter("currency");
        String description = req.getParameter("description");


        Wallet wallet = new Wallet(icon, nameWallet, money, currency, description);
        iWalletDAO.addWallet(wallet);

        Wallet wallet1 = iWalletDAO.selectId(nameWallet);
        int  idWallet = wallet1.getIdWallet();

        System.out.println(idWallet);

        iWalletDAO.addToUser_Wallet(idUser,idWallet);



        List<Wallet> listWallet = iWalletDAO.showAllWallet(username,password);
        req.setAttribute("list",listWallet);
        req.getRequestDispatcher("user/listHome.jsp").forward(req,resp);


    }


}
