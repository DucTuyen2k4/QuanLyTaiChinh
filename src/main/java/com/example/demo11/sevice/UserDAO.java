package com.example.demo11.sevice;

import com.example.demo11.JDBC;

import com.example.demo11.model.User;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class UserDAO implements IUserDAO {
    @Override




    public void addUser(User user) throws SQLException, ClassNotFoundException {
        String query = "insert into users(image,fullName,userName,password,email,gender,birthdate,phoneNumber) values (?,?,?,?,?,?,?,?)";
        PreparedStatement preparedStatement = JDBC.connection().prepareStatement(query);
        preparedStatement.setString(1, user.getImage());
        preparedStatement.setString(2, user.getFullName());
        preparedStatement.setString(3, user.getUserName());

        preparedStatement.setString(4, user.getPassword());
        preparedStatement.setString(5, user.getEmail());
        preparedStatement.setString(6, user.getGender());
        preparedStatement.setDate(7, new java.sql.Date(user.getBirthdate().getTime()));
        preparedStatement.setInt(8, user.getPhoneNumber());
        preparedStatement.executeUpdate();
    }


    private static final String CHECK_USER = "select * from users where userName=? and password=?";

    @Override
    public boolean checkUser(String userName, String password) {
        try {

            PreparedStatement statement = JDBC.connection().prepareStatement(CHECK_USER);
            statement.setString(1, userName);
            statement.setString(2, password);
            ResultSet resultSet = statement.executeQuery();
            return resultSet.next();
        } catch (SQLException e) {
            throw new RuntimeException(e);
        } catch (ClassNotFoundException e) {
            throw new RuntimeException(e);
        }

    }
}
