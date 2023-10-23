package com.example.demo11.sevice;

import com.example.demo11.JDBC;

import com.example.demo11.model.User;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

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
    private static final String SELECT_ALL_USERS = "select * from users where userName=? and password=?";
    @Override
    public List<User> show(String name,String userPassword) {

        List<User> list = new ArrayList<>();
        try {
           PreparedStatement statement=JDBC.connection().prepareStatement(SELECT_ALL_USERS);
           statement.setString(1,name);
           statement.setString(2,userPassword);
           ResultSet resultSet=statement.executeQuery();
            while (resultSet.next()) {
                int id=resultSet.getInt("id");
                String image=resultSet.getString("image");
                String fullName = resultSet.getString("fullName");
                String username = resultSet.getString("userName");
                String password = resultSet.getString("password");
                String email = resultSet.getString("email");
                String gender = resultSet.getString("gender");
                Date birthdate = resultSet.getDate("birthdate");
                int phoneNumber = resultSet.getInt("phoneNumber");
                list.add(new User( id,image,fullName, username, password, email, gender, birthdate, phoneNumber));
            }
        } catch (SQLException e) {
            throw new RuntimeException(e);
        } catch (ClassNotFoundException e) {
            throw new RuntimeException(e);
        }
        return list;
    }
}