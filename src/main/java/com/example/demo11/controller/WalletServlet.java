package com.example.demo11.controller;

import com.example.demo11.model.Wallet;
import com.example.demo11.sevice.WalletDAO;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

@WebServlet(name = "WalletServlet", value = "/wallet")
public class WalletServlet extends HttpServlet {
    public static WalletDAO walletDAO;

    @Override
    public void init() throws ServletException {
        walletDAO = new WalletDAO();
    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String action = req.getParameter("action");
        if (action == null) {
            action = "";
        }
        switch (action) {
//            case "showWallet":
//                showWallet(req, resp);
            default:
                showWallet(req, resp);
                break;
        }
    }

    private void showWallet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        List<Wallet> walletList = walletDAO.listWallet();
        req.setAttribute("listWallet", walletList);
        System.out.println(walletList);
        req.getRequestDispatcher("user/listHome.jsp").forward(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

    }
}
