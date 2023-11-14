package com.example.demo11.controller;

import com.example.demo11.model.Expense;
import com.example.demo11.sevice.*;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.SQLException;
import java.util.List;

@WebServlet (name = "ExpenseServlet",value = "/expense")
public class ExpenseServlet extends HttpServlet {

    private ICategoryDao iCategoryDAO;
    private IUserDAO iUserDAO;
    private IWalletDAO iWalletDAO;
    private IExpenseDao iExpenseDao;
    @Override
    public void init() throws ServletException {
        iCategoryDAO = new CategoryDao();
        iUserDAO = new UserDAO();
        iWalletDAO = new WalletDAO();
        iExpenseDao = new ExpenseDao();
    }

//    @Override
//    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
//        String action = req.getParameter("action");
//        if (action == null) {
//            action = "";
//        }
//        switch (action) {
//            case "search":
//                try {
//                    searchExpense(req,resp);
//                } catch (SQLException e) {
//                    throw new RuntimeException(e);
//                } catch (ClassNotFoundException e) {
//                    throw new RuntimeException(e);
//                }
//                break;
//            default:
//                break;
//        }
//    }
//
//    private void searchExpense(HttpServletRequest req, HttpServletResponse resp) throws SQLException, ClassNotFoundException, ServletException, IOException {
//        String description = req.getParameter("description");
//        List<Expense> expenses = iExpenseDao.findByNoteContainingIgnoreCase(description);
//
//        if (!expenses.isEmpty()) {
//            Expense expense = expenses.get(0);
//
//            req.setAttribute("expense", expense);
//            req.getRequestDispatcher("/wallet/formAddExpense.jsp").forward(req, resp);
//        } else {
//            resp.sendRedirect(req.getContextPath() + "/users/Home.jsp");
//        }
//    }
}
