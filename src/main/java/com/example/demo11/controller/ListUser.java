package com.example.demo11.controller;


import com.example.demo11.sevice.IUserDAO;
import com.example.demo11.sevice.UserDAO;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import java.io.IOException;

@WebServlet(name = "ListUser",value = "/list")
public class ListUser extends HttpServlet {
    UserDAO userDAO=new UserDAO();

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String userName=req.getParameter("userName");
        String password=req.getParameter("password");

        if (userDAO.checkUser(userName,password)){
            resp.sendRedirect("/home");
        }else {
            resp.sendRedirect("");
        }
    }
}