package com.example.demo11.sevice;

import com.example.demo11.JDBC;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class UserDAO implements IUserDAO {
    JDBC jdbc=new JDBC();
    private static final String CHECK_USER="select * from users where userName=? and password=?";
    @Override
    public boolean checkUser(String userName, String password) {
        try {
            Connection connection=jdbc.getConnection();
            PreparedStatement statement=connection.prepareStatement(CHECK_USER);
            statement.setString(1,userName);
            statement.setString(2,password);
            ResultSet resultSet=statement.executeQuery();
            return resultSet.next();
        } catch (SQLException e) {
            throw new RuntimeException(e);
        } catch (ClassNotFoundException e) {
            throw new RuntimeException(e);
        }
    }
}
