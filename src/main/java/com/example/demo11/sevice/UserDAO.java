package com.example.demo11.sevice;

import com.example.demo11.JDBC;

import com.example.demo11.model.User;

import java.sql.*;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

public class UserDAO implements IUserDAO {


    private static final String SELECT_PROFILE_USER = "select*from users where id = ? ";
    private static final String UPDATE_PROFILE_USER = "update users set  fullName = ? ,gender = ? ,birthdate = ? , phoneNumber = ?  , image = ? where id = ? ";

    private static final String INSERT_USER = "insert into users(image,fullName,userName,password,email,gender,birthdate,phoneNumber) values (?,?,?,?,?,?,?,?)";

    private static final String SELECT_PASSWORD = "select password from users where id = ? ";
    private static final String UPDATE_PASSWORD = "update users set password = ? where id = ?";



    @Override


    public void addUser(User user) throws SQLException, ClassNotFoundException {
//        PreparedStatement preparedStatement1=JDBC.connection().prepareStatement(SELECT_ALL_USER);
//        ResultSet resultSet=preparedStatement1.executeQuery();
//        if (resultSet!=null){
//
//        }else {

        PreparedStatement preparedStatement = JDBC.connection().prepareStatement(INSERT_USER);
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
//        }


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
    public List<User> show(String name, String userPassword) {

        List<User> list = new ArrayList<>();
        try {
            PreparedStatement statement = JDBC.connection().prepareStatement(SELECT_ALL_USERS);
            statement.setString(1, name);
            statement.setString(2, userPassword);
            ResultSet resultSet = statement.executeQuery();
            while (resultSet.next()) {
                int id = resultSet.getInt("id");
                String image = resultSet.getString("image");
                String fullName = resultSet.getString("fullName");
                String username = resultSet.getString("userName");
                String password = resultSet.getString("password");
                String email = resultSet.getString("email");
                String gender = resultSet.getString("gender");
                Date birthdate = resultSet.getDate("birthdate");
                int phoneNumber = resultSet.getInt("phoneNumber");
                list.add(new User(id, image, fullName, username, password, email, gender, birthdate, phoneNumber));
            }
        } catch (SQLException e) {
            throw new RuntimeException(e);
        } catch (ClassNotFoundException e) {
            throw new RuntimeException(e);
        }
        return list;
    }


    public void updateProfileUser(int idUser, String fullNameUser, String gender, String birthdate, int phoneNumberUser, String imageUser) throws SQLException, ClassNotFoundException {
        PreparedStatement preparedStatement = JDBC.connection().prepareStatement(UPDATE_PROFILE_USER);
        preparedStatement.setString(1, fullNameUser);
        preparedStatement.setString(2, gender);
        preparedStatement.setString(3, birthdate);
        preparedStatement.setInt(4, phoneNumberUser);
        preparedStatement.setString(5, imageUser);
        preparedStatement.setInt(6, idUser);
        preparedStatement.executeUpdate();
    }


    @Override
    public List<User> selectProfileUser(int idUser) throws SQLException, ClassNotFoundException {
        List<User> list = new ArrayList<>();
        PreparedStatement preparedStatement = JDBC.connection().prepareStatement(SELECT_PROFILE_USER);
        preparedStatement.setInt(1, idUser);

        ResultSet resultSet = preparedStatement.executeQuery();
        while (resultSet.next()) {
            int id = resultSet.getInt("id");
            String fullName = resultSet.getString("fullName");
            String email = resultSet.getString("email");
            Date birthdate = resultSet.getDate("birthdate");
            String gender = resultSet.getString("gender");
            int phoneNumber = resultSet.getInt("phoneNumber");
            String image = resultSet.getString("image");
            list.add(new User(id, fullName, email, birthdate, gender, phoneNumber, image));
        }
        return list;
    }


    private String DELETE_USER = "delete from users where id=?";

    public void DeleteUser(int id) throws SQLException, ClassNotFoundException {
        PreparedStatement preparedStatement = JDBC.connection().prepareStatement(DELETE_USER);
        preparedStatement.setInt(1, id);
        preparedStatement.executeUpdate();
    }

    public User selectPassword(int id) throws SQLException, ClassNotFoundException {
        User user = new User(SELECT_PASSWORD);
        PreparedStatement preparedStatement = JDBC.connection().prepareStatement(SELECT_PASSWORD);
        preparedStatement.setInt(1, id);
        ResultSet resultSet = preparedStatement.executeQuery();
        while (resultSet.next()) {
            String password = resultSet.getString("password");
            user = new User(password);
        }
        return user;
    }

    @Override
    public void updatePassword(int id, String password) throws SQLException, ClassNotFoundException {
        PreparedStatement preparedStatement = JDBC.connection().prepareStatement(UPDATE_PASSWORD);
        preparedStatement.setString(1, password);
        preparedStatement.setInt(2, id);
        preparedStatement.executeUpdate();
    }

    @Override
    public List<User> selectUser(int idUser) throws SQLException, ClassNotFoundException {
        List<User> list = new ArrayList<>();
        PreparedStatement statement = JDBC.connection().prepareStatement(SELECT_PROFILE_USER);
        statement.setInt(1,idUser);
        ResultSet resultSet = statement.executeQuery();
        while (resultSet.next()) {
            int id = resultSet.getInt("id");
            String image = resultSet.getString("image");
            String fullName = resultSet.getString("fullName");
            String username = resultSet.getString("userName");
            String password = resultSet.getString("password");
            String email = resultSet.getString("email");
            String gender = resultSet.getString("gender");
            Date birthdate = resultSet.getDate("birthdate");
            int phoneNumber = resultSet.getInt("phoneNumber");
            list.add(new User(id, image, fullName, username, password, email, gender, birthdate, phoneNumber));
        }

        return list;

    }


}



