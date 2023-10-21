package com.example.demo11.sevice;

import com.example.demo11.JDBC;

import com.example.demo11.controller.ListUser;
import com.example.demo11.model.User;
import com.mysql.cj.protocol.ResultsetRow;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

public class UserDAO implements IUserDAO {
    private static  final String SELECT_PROFILE_USER = "select*from users where id = ? ";
    private static final String UPDATE_PROFILE_USER= "update users set image = ? , fullName = ? , email = ? , phoneNumber = ? where id = ? ";
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

    @Override
    public void updateProfileUser(int idUser, String emailUser, String fullNameUser, int phoneNumberUser, String imageUser) throws SQLException, ClassNotFoundException {
        PreparedStatement preparedStatement = JDBC.connection().prepareStatement(UPDATE_PROFILE_USER);
        preparedStatement.setString(1,imageUser);
        preparedStatement.setString(2,fullNameUser);
        preparedStatement.setString(3,emailUser);
        preparedStatement.setInt(4,phoneNumberUser);
        preparedStatement.setInt(5,idUser);
        preparedStatement.executeUpdate();
    }


    @Override
    public List<User> selectProfileUser(int idUser) throws SQLException, ClassNotFoundException {
        List<User> list = new ArrayList<>();
        PreparedStatement preparedStatement = JDBC.connection().prepareStatement(SELECT_PROFILE_USER);
        preparedStatement.setInt(1,idUser);

        ResultSet resultSet = preparedStatement.executeQuery();
        while (resultSet.next()){
            int id = resultSet.getInt("id");
            String fullName = resultSet.getString("fullName");
            String email = resultSet.getString("email");
            Date birthdate = resultSet.getDate("birthdate");
            String gender = resultSet.getString("gender");
            int phoneNumber = resultSet.getInt("phoneNumber");
            String image = resultSet.getString("image");
            list.add(new User(id,fullName,email,birthdate,gender,phoneNumber,image));
        }
        return list;
    }
}
