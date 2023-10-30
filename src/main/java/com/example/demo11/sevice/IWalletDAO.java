package com.example.demo11.sevice;

import com.example.demo11.model.Wallet;

import java.sql.SQLException;
import java.util.List;

public interface IWalletDAO {
    public void addWallet(Wallet wallet) throws SQLException, ClassNotFoundException;
    public List<Wallet> showAllWallet(String username , String password) throws SQLException, ClassNotFoundException;

    public Wallet selectId(String userWallet) throws SQLException, ClassNotFoundException;
    public void addToUser_Wallet(int idUser ,int idWallet) throws SQLException, ClassNotFoundException;
}
