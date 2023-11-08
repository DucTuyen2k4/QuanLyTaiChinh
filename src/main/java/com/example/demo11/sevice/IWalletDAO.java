package com.example.demo11.sevice;

import com.example.demo11.model.User;
import com.example.demo11.model.Wallet;

import java.sql.SQLException;
import java.util.List;

public interface IWalletDAO {

    List<Wallet> listWallet(String name,String password);
    List<Wallet> listWalletHome();
    Wallet checkID(int id);
     void addWallet(Wallet wallet) throws SQLException, ClassNotFoundException;
     List<Wallet> showAllWallet(String username , String password) throws SQLException, ClassNotFoundException;

     Wallet selectId(String userWallet) throws SQLException, ClassNotFoundException;
     void addToUser_Wallet(int idUser ,int idWallet,String permission) throws SQLException, ClassNotFoundException;
    void updateWallet(Wallet wallet) throws SQLException, ClassNotFoundException;
    List<Wallet> showWallet(int id) throws SQLException, ClassNotFoundException;

    boolean selectWallet(String nameWallet) throws SQLException, ClassNotFoundException;
    Wallet selectMoney(String nameWallet) throws SQLException, ClassNotFoundException;
    Wallet selectMoneyBanking(String name) throws SQLException, ClassNotFoundException;
    void updateMoney(double money ,String nameWallet) throws SQLException, ClassNotFoundException;
    void updateMoneyBanking(double money ,String name) throws SQLException, ClassNotFoundException;
    void shareWallet(int idUser, int idWallet, String permission) throws SQLException, ClassNotFoundException;

    boolean checkEmailUser_Wallet(String email) throws SQLException, ClassNotFoundException;
    User user_wallet(String email)throws SQLException, ClassNotFoundException;
    void deleteWallet(int id) throws SQLException, ClassNotFoundException;
}
