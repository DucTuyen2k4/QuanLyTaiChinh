package com.example.demo11.sevice;

import com.example.demo11.model.User;

import java.sql.SQLException;
import java.util.List;

public interface IUserDAO {

    List<User> selectProfileUser(int idUser) throws SQLException, ClassNotFoundException;

    void updateProfileUser(int idUser, String fullNameUser, String gender, String birthdate, int phoneNumberUser, String imageUser) throws SQLException, ClassNotFoundException;


    void addUser(User user) throws SQLException, ClassNotFoundException;

    boolean checkUser(String userName, String password);

    User selectPassword(int id) throws SQLException, ClassNotFoundException;

    void updatePassword(int id, String password) throws SQLException, ClassNotFoundException;

}
