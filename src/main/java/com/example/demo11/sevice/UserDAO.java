package com.example.demo11.sevice;

import com.example.demo11.JDBC;
import com.example.demo11.model.User;

import java.sql.PreparedStatement;
import java.sql.SQLException;

public class UserDAO implements IUserDAO {
    @Override
    public void addUser(User user) throws SQLException, ClassNotFoundException {
        String query="insert into users(fullName,userName,password,gender,birthdate,phoneNumber) values (?,?,?,?,?,?)";
        PreparedStatement preparedStatement = JDBC.connection().prepareStatement(query);
        preparedStatement.setString(1,user.getFullName());
        preparedStatement.setString(2,user.getUserName());
        preparedStatement.setString(3,user.getPassword());
        preparedStatement.setString(4,user.getGender());
        preparedStatement.setDate(5, new java.sql.Date(user.getBirthdate().getTime()));
        preparedStatement.setInt(6,user.getPhoneNumber());
        preparedStatement.executeUpdate();


    }
}
