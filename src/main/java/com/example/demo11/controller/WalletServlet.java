package com.example.demo11.controller;

import com.example.demo11.model.Wallet;
import com.example.demo11.sevice.WalletDAO;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

@WebServlet(name = "WalletServlet", value = "/wallet")
public class WalletServlet extends HttpServlet {

}
