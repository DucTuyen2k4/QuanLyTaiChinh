package com.example.demo11;


import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class JDBC {


    private static final String Url = "jdbc:mysql://localhost:3306/QuanLyTaiChinh";
    private static final String username = "root";

    private static final String password = "KAkakuku123@";

    public static java.sql.Connection connection() throws SQLException, ClassNotFoundException {
        Class.forName("com.mysql.cj.jdbc.Driver");
        java.sql.Connection connection = DriverManager.getConnection(Url, username, password);
        return connection;
    }
}

