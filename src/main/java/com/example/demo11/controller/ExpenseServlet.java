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
import java.io.IOException;
import java.sql.SQLException;
import java.time.Instant;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.time.format.FormatStyle;
import java.util.List;

import static com.example.demo11.controller.UserServlet.*;

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
            case "search":

                try {
                    SearchExpense(req, resp);
                } catch (SQLException | ClassNotFoundException e) {
                    throw new RuntimeException(e);
                }
                break;

        }
    }

    private void SearchExpense(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException, SQLException, ClassNotFoundException {
        String categoryName = request.getParameter("categoryName");
        String username = request.getParameter("username");
        String password = request.getParameter("password");
t

        System.out.println("vo day");
        ExpenseDao expenseDao = new ExpenseDao();
        List<Expense> expenses = expenseDao.selectExpenseByCategory(categoryName);

        if (expenses != null && !expenses.isEmpty()) {
            request.setAttribute("expenses", expenses);
            request.setAttribute("message", "Danh sách chi phí cho danh mục '" + categoryName + "'");
        } else {
            boolean categoryExists = expenseDao.doesCategoryExist(categoryName);
            if (categoryExists) {
                request.setAttribute("message", "Không tìm thấy chi phí nào cho danh mục nhất định.");
            } else {
                request.setAttribute("message", "Danh Mục '" + categoryName + "' không tồn tại.");
            }
        }

        List<User> list = iUserDAO.show(username, password);
        request.setAttribute("list",list);

        List<Wallet> walletList = iWalletDAO.listWallet(username, password);
        request.setAttribute("list",walletList);

        HttpSession session = request.getSession();
        session.setAttribute("user", list.get(0));

        List<Category> categoryList = iCategoryDAO.selectCategory(username, password);
        request.setAttribute("showNameCategory", categoryList);


        request.getRequestDispatcher("category/Seach.jsp").forward(request, response);
    }



    private void deleteExpense(HttpServletRequest req, HttpServletResponse resp) throws SQLException, ClassNotFoundException, ServletException, IOException {
        String username = req.getParameter("username");
        String password = req.getParameter("password");
        int idCategory = Integer.parseInt(req.getParameter("idCategory"));
        int idExpense = Integer.parseInt(req.getParameter("idExpense"));
      //  int idWallet = Integer.parseInt(req.getParameter("idWallet"));
        Expense deletedExpense = iExpenseDAO.getExpenseById(idExpense);
        double refundedMoney = deletedExpense.getMoney();
        iExpenseDAO.deleteExpense(idExpense);
        System.out.println("vo day " + idExpense);
        System.out.println("vo day " + refundedMoney);
 //       iWalletDAO.refundMoneyToWallet(idWallet, refundedMoney);
 //       System.out.println("truyen vao vi" + idWallet);

        List<Expense> listExpense = iExpenseDAO.showExpenseWhereIdCategory(idCategory);

        req.setAttribute("expense",listExpense);

        List<User> list = iUserDAO.show(username, password);
        req.setAttribute("list",list);

        List<Wallet> walletList = iWalletDAO.listWallet(username, password);
        req.setAttribute("list",walletList);

        HttpSession session = req.getSession();
        session.setAttribute("user", list.get(0));

        List<Category> categoryList = iCategoryDAO.selectCategory(username, password);
        req.setAttribute("showNameCategory", categoryList);

        List<Category> listCategory = iCategoryDAO.selectAllCategorys(idCategory);
        req.setAttribute("category", listCategory);

        req.getRequestDispatcher("/users/Category.jsp").forward(req, resp);
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
            case "deleteExpense":
                try {
                    deleteExpense(req,resp);
                } catch (SQLException e) {
                    throw new RuntimeException(e);
                } catch (ClassNotFoundException e) {
                    throw new RuntimeException(e);
                }

        }
    }

    private void addCategoryExpense(HttpServletRequest request, HttpServletResponse response) throws SQLException, ClassNotFoundException, ServletException, IOException {


        String nameExpense = request.getParameter("name");
        double money = Double.parseDouble(request.getParameter("money"));
        int idCategory = Integer.parseInt(request.getParameter("idCategory"));
        String userName = request.getParameter("username");
        String password = request.getParameter("password");


        LocalDateTime localDateTime = LocalDateTime.now();
        DateTimeFormatter formatter = DateTimeFormatter.ofLocalizedDateTime(FormatStyle.MEDIUM);
        String time = localDateTime.format(formatter);
        System.out.println("\n\nNgày giờ hiện tại: " + time);

        String note = request.getParameter("note");
        iExpenseDAO.addExpense(new Expense(nameExpense, money, time, note));
        Expense expense = iExpenseDAO.showExpense(nameExpense);
        int idExpense = expense.getIdExpense();
        iExpenseDAO.addCategoryExpense(idCategory, idExpense);

        List<Expense> listExpense = iExpenseDAO.showExpenseWhereIdCategory(idCategory);
        request.setAttribute("expense", listExpense);
        List<User> list = userDAO.show(userName, password);
        request.setAttribute("list", list);
        List<Wallet> walletList = iWalletDAO.listWallet(userName, password);
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