package com.example.demo11.sevice;

import com.example.demo11.JDBC;
import com.example.demo11.model.User;
import com.example.demo11.model.Wallet;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;


public class WalletDAO implements IWalletDAO {

    private static final String SELECT_ALL_WALLET = "select wallet.idWallet,wallet.nameWallet, wallet.icon,wallet.money,wallet.currency,wallet.description from wallet inner join users_wallet on Wallet.idWallet = users_wallet.idWallet inner join users on users_wallet.idUser=users.id where userName = ? and password = ?";
    private static final String SELECT_ALL_WALLET_HOME = "select*from wallet";
    private static final String CHECK_ID = "select*from wallet where idWallet like ?";
    private static final String INSERT_WALLET = "insert into wallet(icon,nameWallet,money,currency,description) values (?,?,?,?,?)";
    private static final String SELECT_ID_WALLET = "select idWallet from Wallet where nameWallet = ? ";
    private static final String INSERT_USER_WALLET = "insert into users_wallet (idUser,idWallet)values (?,?)";
    private static final String UPDATE_WALLET = "update wallet set icon = ?,nameWallet=?,money=?,currency=?,description=? where idWallet=? ";
    private static final String SHOW_WALLET = "select * from wallet where idWallet=? ";


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
                walletList.add(new Wallet(id, icon, nameWallet, money, currency, description));
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
    public void updateWallet(Wallet wallet) throws SQLException, ClassNotFoundException {
        PreparedStatement preparedStatement = JDBC.connection().prepareStatement(UPDATE_WALLET);
        preparedStatement.setString(1,wallet.getIcon());
        preparedStatement.setString(2,wallet.getNameWallet());
        preparedStatement.setDouble(3,wallet.getMoney());
        preparedStatement.setString(4,wallet.getCurrency());
        preparedStatement.setString(5,wallet.getDescription());
        preparedStatement.setInt(6,wallet.getIdWallet());
        preparedStatement.executeUpdate();
    }

    @Override
    public List<Wallet> showWallet(int id) throws SQLException, ClassNotFoundException {
        List<Wallet> list = new ArrayList<>();
        System.out.println(id);
        PreparedStatement preparedStatement = JDBC.connection().prepareStatement(SHOW_WALLET);
        preparedStatement.setInt(1, id);
        ResultSet resultSet = preparedStatement.executeQuery();
        while (resultSet.next()) {
            int idWallet = resultSet.getInt("idWallet");
            String icon = resultSet.getString("icon");
            String nameWallet = resultSet.getString("nameWallet");
            double money = resultSet.getDouble("money");
            String currency = resultSet.getString("currency");
            String description = resultSet.getString("description");
            System.out.println(idWallet + money + description);
            list.add(new Wallet(idWallet, icon, nameWallet, money, currency, description));
        }

        return list;
    }


    @Override
    public Wallet checkID(int id) {
        Wallet wallet = null;
        try {
            PreparedStatement statement = JDBC.connection().prepareStatement(CHECK_ID);
            statement.setInt(1, id);
            ResultSet resultSet = statement.executeQuery();
            while (resultSet.next()) {
                int idWallet = resultSet.getInt("idWallet");
                String icon = resultSet.getString("icon");
                String nameWallet = resultSet.getString("nameWallet");
                double money = resultSet.getDouble("money");
                String currency = resultSet.getString("currency");
                String description = resultSet.getString("description");
                wallet = new Wallet(idWallet, icon, nameWallet, money, currency, description);
            }
        } catch (SQLException e) {
            throw new RuntimeException(e);
        } catch (ClassNotFoundException e) {
            throw new RuntimeException(e);
        }

        return wallet;
    }


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
