package com.example.demo11.sevice;

import com.example.demo11.model.User;

import java.sql.SQLException;
import java.util.List;

public interface IUserDAO {

    void addUser(User user) throws SQLException, ClassNotFoundException;

    boolean checkUser(String userName, String password);
    List<User> show(String name,String userPassword);

}
