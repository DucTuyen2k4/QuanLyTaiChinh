package com.example.demo11.sevice;

import com.example.demo11.model.Wallet;

import java.sql.SQLException;
import java.util.List;

public interface IWalletDAO {

    List<Wallet> listWallet(String name,String password);

    Wallet checkID(int id);

     void addWallet(Wallet wallet) throws SQLException, ClassNotFoundException;
     List<Wallet> showAllWallet(String username , String password) throws SQLException, ClassNotFoundException;

     Wallet selectId(String userWallet) throws SQLException, ClassNotFoundException;
     void addToUser_Wallet(int idUser ,int idWallet) throws SQLException, ClassNotFoundException;
    void updateWallet(Wallet wallet) throws SQLException, ClassNotFoundException;
    List<Wallet> showWallet(int id) throws SQLException, ClassNotFoundException;
    void deleteWallet(int id) throws SQLException, ClassNotFoundException;


}
