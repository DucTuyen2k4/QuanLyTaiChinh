package com.example.demo11.sevice;

import com.example.demo11.JDBC;
import com.example.demo11.model.Wallet;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class WalletDAO implements IWalletDAO {

    private static final String SELECT_ALL_WALLET = "select * from wallet";

    @Override
    public List<Wallet> listWallet() {
        List<Wallet> walletList = new ArrayList<>();
        try {
            PreparedStatement statement = JDBC.connection().prepareStatement(SELECT_ALL_WALLET);
            ResultSet resultSet = statement.executeQuery();
            while (resultSet.next()) {
                String icon=resultSet.getString("icon");
                String nameWallet=resultSet.getString("nameWallet");
                double money=resultSet.getDouble("money");
                String currency =resultSet.getString("currency");
                String description=resultSet.getString("description");
                walletList.add(new Wallet(icon,nameWallet,money,currency,description));
            }
        } catch (SQLException e) {
            throw new RuntimeException(e);
        } catch (ClassNotFoundException e) {
            throw new RuntimeException(e);
        }
        return walletList;
    }
}
