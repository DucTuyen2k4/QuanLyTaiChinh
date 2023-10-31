package com.example.demo11.sevice;

import com.example.demo11.JDBC;
import com.example.demo11.model.Wallet;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class WalletDAO implements IWalletDAO {

    private static final String SELECT_ALL_WALLET = "select wallet.idWallet,wallet.nameWallet, wallet.icon,wallet.money,wallet.currency,wallet.description from wallet inner join users_wallet on Wallet.idWallet = users_wallet.idWallet inner join users on users_wallet.idUser=users.id where userName = ? and password = ?";
    private static final String SELECT_ALL_WALLET_HOME = "select*from wallet";
    private static final String CHECK_ID = "select*from wallet where idWallet like ?";

    @Override
    public List<Wallet> listWallet(String name, String password) {
        List<Wallet> walletList = new ArrayList<>();
        try {
            PreparedStatement statement = JDBC.connection().prepareStatement(SELECT_ALL_WALLET);
            statement.setString(1, name);
            statement.setString(2, password);
            ResultSet resultSet = statement.executeQuery();
            while (resultSet.next()) {
                int id = resultSet.getInt("idWallet");
                String icon = resultSet.getString("icon");
                String nameWallet = resultSet.getString("nameWallet");
                double money = resultSet.getDouble("money");
                String currency = resultSet.getString("currency");
                String description = resultSet.getString("description");
                walletList.add(new Wallet(id,icon, nameWallet, money, currency, description));
            }
        } catch (SQLException e) {
            throw new RuntimeException(e);
        } catch (ClassNotFoundException e) {
            throw new RuntimeException(e);
        }
        return walletList;
    }

    @Override
    public List<Wallet> listWalletHome() {
        List<Wallet> walletList = new ArrayList<>();
        try {
            PreparedStatement statement = JDBC.connection().prepareStatement(SELECT_ALL_WALLET_HOME);
            ResultSet resultSet = statement.executeQuery();
            while (resultSet.next()) {

                String icon = resultSet.getString("icon");
                String nameWallet = resultSet.getString("nameWallet");
                double money = resultSet.getDouble("money");
                String currency = resultSet.getString("currency");
                String description = resultSet.getString("description");
                walletList.add(new Wallet(icon, nameWallet, money, currency, description));
            }
        } catch (SQLException e) {
            throw new RuntimeException(e);
        } catch (ClassNotFoundException e) {
            throw new RuntimeException(e);
        }
        return walletList;
    }

    @Override
    public Wallet checkID(int id) {
        Wallet wallet = null;
        try {
            PreparedStatement statement = JDBC.connection().prepareStatement(CHECK_ID);
            statement.setInt(1, id);
            ResultSet resultSet = statement.executeQuery();
            while (resultSet.next()) {
                int idWallet=resultSet.getInt("idWallet");
                String icon = resultSet.getString("icon");
                String nameWallet = resultSet.getString("nameWallet");
                double money = resultSet.getDouble("money");
                String currency = resultSet.getString("currency");
                String description = resultSet.getString("description");
                wallet = new Wallet(idWallet,icon, nameWallet, money, currency, description);
            }
        } catch (SQLException e) {
            throw new RuntimeException(e);
        } catch (ClassNotFoundException e) {
            throw new RuntimeException(e);
        }

        return wallet;
    }
}
