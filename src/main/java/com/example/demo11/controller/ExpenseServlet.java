package com.example.demo11.controller;

import com.example.demo11.model.Category;
import com.example.demo11.model.Expense;
import com.example.demo11.model.User;
import com.example.demo11.model.Wallet;
import com.example.demo11.sevice.*;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.swing.text.DateFormatter;
import java.io.IOException;
import java.sql.SQLException;
import java.time.Instant;
import java.time.LocalDate;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.time.format.FormatStyle;
import java.util.List;

import static com.example.demo11.controller.UserServlet.userDAO;
import static com.example.demo11.controller.UserServlet.walletDAO;

@WebServlet(name = "ExpenseServlet", value = "/expense")
public class ExpenseServlet extends HttpServlet {

    private ICategoryDao iCategoryDAO;
    private IUserDAO iUserDAO;
    private IWalletDAO iWalletDAO;
    private IExpenseDao iExpenseDAO;

    @Override
    public void init() throws ServletException {
        iCategoryDAO = new CategoryDao();
        iUserDAO = new UserDAO();
        iWalletDAO = new WalletDAO();
        iExpenseDAO = new ExpenseDao();
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String action = req.getParameter("action");
        if (action == null) {
            action = "";
        }
        System.out.println(action);
        switch (action) {
            case "addExpense":
                try {
                    addCategoryExpense(req, resp);
                } catch (SQLException e) {
                    throw new RuntimeException(e);
                } catch (ClassNotFoundException e) {
                    throw new RuntimeException(e);
                }
                break;
            case"showByWallet":
                try {
                    showExpenseByWallet(req,resp);
                } catch (SQLException e) {
                    throw new RuntimeException(e);
                } catch (ClassNotFoundException e) {
                    throw new RuntimeException(e);
                }
            case "showToday":
                try {
                    ShowToday(req,resp);
                } catch (SQLException e) {
                    throw new RuntimeException(e);
                } catch (ClassNotFoundException e) {
                    throw new RuntimeException(e);
                }
        }
    }

    private void ShowToday(HttpServletRequest req, HttpServletResponse resp) throws SQLException, ClassNotFoundException, ServletException, IOException {
        LocalDate currentDate = LocalDate.now();
        int idWallet= Integer.parseInt(req.getParameter("idWallet"));
        DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd");
        String formattedDate = currentDate.format(formatter);
        List<Expense>listExpense=iExpenseDAO.ShowToday(formattedDate,idWallet);
        req.setAttribute("Today",listExpense);
        req.getRequestDispatcher("users/Wallet.jsp").forward(req, resp);
    }

    private void showExpenseByWallet(HttpServletRequest req, HttpServletResponse resp) throws SQLException, ClassNotFoundException, ServletException, IOException {
        String First=req.getParameter("First");
        String Last=req.getParameter("Last");
        int idWallet= Integer.parseInt(req.getParameter("idWallet"));
        List<Expense>listExpense=iExpenseDAO.ShowExpenseWhere(idWallet,First,Last);
        req.setAttribute("listExpense",listExpense);
        req.getRequestDispatcher("users/Wallet.jsp").forward(req, resp);


    }

    private void showFormAddExpense(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String userName = req.getParameter("username");
        String password = req.getParameter("password");

        List<User> list = iUserDAO.show(userName, password);
        HttpSession session = req.getSession();
        session.setAttribute("user", list.get(0));

        int idCategory = Integer.parseInt(req.getParameter("idCategory"));
        req.setAttribute("idCategory", idCategory);
        req.getRequestDispatcher("/category/formAddExpense.jsp").forward(req, resp);

    }


    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String action = req.getParameter("action");
        if (action == null) {
            action = "";
        }
        switch (action) {
            case  "add":
                System.out.println("ok");
                showFormAddExpense(req, resp);
                break;
        }
    }

    private void addCategoryExpense(HttpServletRequest request, HttpServletResponse response) throws SQLException, ClassNotFoundException, ServletException, IOException {

        String nameExpense = request.getParameter("name");
        double money = Double.parseDouble(request.getParameter("money"));
        int idCategory = Integer.parseInt(request.getParameter("idCategory"));
        String userName = request.getParameter("username");
        String password = request.getParameter("password");

        LocalDate localDate = LocalDate.now();
        System.out.println(localDate);
        String time= String.valueOf(localDate);
        String note = request.getParameter("note");
        iExpenseDAO.addExpense(new Expense(nameExpense, money, time, note));
        Expense expense = iExpenseDAO.showExpense(nameExpense);
        int idExpense = expense.getIdExpense();
        iExpenseDAO.addCategoryExpense(idCategory, idExpense);

        List<Expense> listExpense = iExpenseDAO.showExpenseWhereIdCategory(idCategory);
        request.setAttribute("expense", listExpense);
        List<User> list = userDAO.show(userName, password);
        request.setAttribute("list", list);
        List<Wallet> walletList = walletDAO.listWallet(userName, password);
        request.setAttribute("list", walletList);
        HttpSession session = request.getSession();
        session.setAttribute("user", list.get(0));
        List<Category> categoryList = iCategoryDAO.selectCategory(userName, password);
        request.setAttribute("showNameCategory", categoryList);
        List<Category> listCategory = iCategoryDAO.selectAllCategorys(idCategory);
        request.setAttribute("category", listCategory);
        request.getRequestDispatcher("/users/Category.jsp").forward(request, response);
    }
}