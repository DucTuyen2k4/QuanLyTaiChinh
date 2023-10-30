package com.example.demo11.controller;

import com.example.demo11.model.Wallet;
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

@WebServlet(value = "/WalletServlet", name = "WalletServlet")

public class WalletServlet extends HttpServlet {
    public static WalletDAO wallet;

    @Override
    public void init() throws ServletException {
        wallet = new WalletDAO();
    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String action = req.getParameter("action");
        if (action == null) {
            action = "";

        }
        switch (action) {
//            case "addWallet":
//                try {
//                    addWallet(req, resp);
//                } catch (SQLException e) {
//                    throw new RuntimeException(e);
//                } catch (ClassNotFoundException e) {
//                    throw new RuntimeException(e);
//                }
//                break;
        }
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String action = req.getParameter("action");
        if (action == null) {
            action = "";

        }
        switch (action) {
            case "update":
                try {
                    UpdateWalletInformation(req, resp);
                } catch (SQLException e) {
                    throw new RuntimeException(e);
                } catch (ClassNotFoundException e) {
                    throw new RuntimeException(e);
                }
                break;

            case "showWallet":
                try {
                    ShowWalletInformation(req, resp);
                } catch (SQLException e) {
                    throw new RuntimeException(e);
                } catch (ClassNotFoundException e) {
                    throw new RuntimeException(e);
                }
            case "showDisUpdate":
                try {
                    ShowWalletInformationUpdate(req, resp);
                } catch (SQLException e) {
                    throw new RuntimeException(e);
                } catch (ClassNotFoundException e) {
                    throw new RuntimeException(e);
                }
            case "transferMoney":

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
       wallet.addWallet(new Wallet(icon,nameWallet,currency,money,description));
        Wallet wallet1 = wallet.selectId(nameWallet);
        int  idWallet = wallet1.getIdWallet();


        wallet.addToUser_Wallet(idUser,idWallet);



        List<Wallet> listWallet = wallet.showAllWallet(username,password);
        req.setAttribute("list",listWallet);
        req.getRequestDispatcher("user/listHome.jsp").forward(req,resp);


    }

    public static void ShowWalletInformation(HttpServletRequest request, HttpServletResponse response) throws SQLException, ClassNotFoundException, ServletException, IOException {
        int id = Integer.parseInt(request.getParameter("idWallet"));
        List<Wallet> walletInformation = wallet.showWallet(id);
        request.setAttribute("listWallet", walletInformation);
//        HttpSession session = request.getSession();
//        session.setAttribute("listWallet", walletInformation.get(0));
        request.getRequestDispatcher("Wallet/ShowWallet.jsp").forward(request, response);
    }
    public static void ShowWalletInformationUpdate(HttpServletRequest request, HttpServletResponse response) throws SQLException, ClassNotFoundException, ServletException, IOException {
        int id = Integer.parseInt(request.getParameter("idWallet"));
        List<Wallet> walletInformation = wallet.showWallet(id);
        request.setAttribute("listWallet", walletInformation);
        request.getRequestDispatcher("Wallet/UpdateWallet.jsp").forward(request, response);
    }
    public  static  void  TransferMoney(HttpServletRequest request , HttpServletResponse response){
        int idV1= Integer.parseInt(request.getParameter("idWallet1"));
        int idV2= Integer.parseInt(request.getParameter("idWallet2"));
        String icon1 = request.getParameter("icon1");
        String icon2 = request.getParameter("icon2");
        String nameWallet1 = request.getParameter("nameWallet1");
        String nameWallet2 = request.getParameter("nameWallet2");
        double money1= Double.parseDouble(request.getParameter("money1"));
        double money2= Double.parseDouble(request.getParameter("money2"));
    }

    public static void UpdateWalletInformation(HttpServletRequest request, HttpServletResponse response) throws SQLException, ClassNotFoundException, ServletException, IOException {
        int id = Integer.parseInt(request.getParameter("idWallet"));
        String icon = request.getParameter("icon");
        String nameWallet = request.getParameter("nameWallet");
        Double money = Double.valueOf(request.getParameter("money"));
        String currency = request.getParameter("currency");
        String description = request.getParameter("description");
        System.out.println(id + icon + nameWallet + money + currency + description);
        wallet.updateProfileWallet(new Wallet(id, icon, nameWallet, currency, money, description));
        request.getRequestDispatcher("Wallet/play.jsp").forward(request, response);
    }
    public static void transferMoney(HttpServletResponse response,HttpServletRequest request){

    }

}
