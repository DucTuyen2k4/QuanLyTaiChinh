package com.example.demo11.sevice;

import com.example.demo11.JDBC;
import com.example.demo11.model.User;
import com.example.demo11.model.Wallet;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

public class WalletDAO implements IWalletDAO{
    private static final String INSERT_WALLET = "insert into Wallet(icon,nameWallet,money,currency,description) values (?,?,?,?,?)";
    private static  final String SELECT_ALL_WALLET = "select Wallet.idWallet,Wallet.nameWallet, Wallet.icon,Wallet.money,Wallet.currency,Wallet.description from Wallet inner join user_wallets on Wallet.idWallet = user_wallets.idWallet inner join users on user_wallets.idUser=users.id where username = ? and password = ?";
    private static final String SELECT_ID_WALLET = "select idWallet from Wallet where nameWallet = ? " ;
    private static final String INSERT_USER_WALLET = "insert into user_wallets (idUser,idWallet)values (?,?)";
    public WalletDAO(){

    }

    @Override
    public void addWallet(Wallet wallet) throws SQLException, ClassNotFoundException {
        PreparedStatement preparedStatement = JDBC.connection().prepareStatement(INSERT_WALLET);
        preparedStatement.setString(1,wallet.getIcon());
        preparedStatement.setString(2,wallet.getNameWallet());
        preparedStatement.setDouble(3,wallet.getMoney());
        preparedStatement.setString(4,wallet.getCurrency());
        preparedStatement.setString(5,wallet.getDescription());
        preparedStatement.executeUpdate();
    }

    @Override
    public List<Wallet> showAllWallet(String username , String password) throws SQLException, ClassNotFoundException {
        List<Wallet> list = new ArrayList<>();
        PreparedStatement preparedStatement = JDBC.connection().prepareStatement(SELECT_ALL_WALLET);
        preparedStatement.setString(1,username);
        preparedStatement.setString(2,password);
        ResultSet resultSet = preparedStatement.executeQuery();
        while (resultSet.next()){
            int idWallet = resultSet.getInt("idWallet");
            String icon = resultSet.getString("icon");
            String nameWallet = resultSet.getString("nameWallet");
            double money = resultSet.getDouble("money");
            String currency = resultSet.getString("currency");
            String description = resultSet.getString("description");
            list.add(new Wallet(idWallet,icon,nameWallet,money,currency,description));
        }
        return list;
    }

    @Override
    public Wallet selectId(String nameWallet) throws SQLException, ClassNotFoundException {
        Wallet wallet = null;
        PreparedStatement preparedStatement = JDBC.connection().prepareStatement(SELECT_ID_WALLET);
        preparedStatement.setString(1,nameWallet);
        ResultSet resultSet = preparedStatement.executeQuery();
        while (resultSet.next()){
            int idWallet = resultSet.getInt("idWallet");
            wallet = new Wallet(idWallet);
        }
        return wallet;
    }

    @Override
    public void addToUser_Wallet(int idUser , int idWallet) throws SQLException, ClassNotFoundException {
        PreparedStatement preparedStatement = JDBC.connection().prepareStatement(INSERT_USER_WALLET);
        preparedStatement.setInt(1,idUser);
        preparedStatement.setInt(2,idWallet);
        preparedStatement.executeUpdate();

    }
}
