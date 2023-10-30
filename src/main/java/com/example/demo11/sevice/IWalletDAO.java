package com.example.demo11.sevice;

import com.example.demo11.model.Wallet;

import java.sql.SQLException;
import java.util.List;

public interface IWalletDAO {
    void updateProfileWallet(Wallet wallet) throws SQLException, ClassNotFoundException;
    List<Wallet> showWallet(int id) throws SQLException, ClassNotFoundException;
//    void updateMoneyWallet(Wallet wallet) throws SQLException, ClassNotFoundException;
//    void addWallet(Wallet wallet) throws SQLException, ClassNotFoundException;
}
