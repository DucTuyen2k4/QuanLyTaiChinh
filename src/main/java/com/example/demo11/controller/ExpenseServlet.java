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
import java.sql.SQLOutput;
import java.time.Instant;
import java.time.LocalDate;
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
        req.setCharacterEncoding("UTF-8");
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
            case "updateExpense":
                try {
                    updateExpense(req, resp);
                } catch (SQLException e) {
                    throw new RuntimeException(e);
                } catch (ClassNotFoundException e) {
                    throw new RuntimeException(e);
                }
                break;
            case "showToday":
                try {
                    showToday(req,resp);
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
            case "information":
                try {
                    information(req,resp);
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


        }
    }
    private void showExpenseByWallet(HttpServletRequest req, HttpServletResponse resp) throws SQLException, ClassNotFoundException, ServletException, IOException {
        String First=req.getParameter("First");
        String Last=req.getParameter("Last");
        int idWallet= Integer.parseInt(req.getParameter("idWallet"));
        List<Expense>listExpense=iExpenseDAO.ShowExpenseWhere(idWallet,First,Last);

        req.setAttribute("listExpense",listExpense);
        req.getRequestDispatcher("users/ShowExpenseByTime.jsp").forward(req, resp);


    }
    private void information(HttpServletRequest req, HttpServletResponse resp) throws SQLException, ClassNotFoundException, ServletException, IOException {
        int idCategory= Integer.parseInt(req.getParameter("idCategory"));
        System.out.println(idCategory);
        String information=req.getParameter("information");
        System.out.println(information);
        String information1=req.getParameter("information1");
        System.out.println(information1);

        String username = req.getParameter("username");
        String password = req.getParameter("password");
        List<User> list = iUserDAO.show(username, password);
        req.setAttribute("list", list);

        List<Wallet> walletList = walletDAO.listWallet(username, password);
        req.setAttribute("list", walletList);


        List<Category> categoryList = icategoryDao.selectCategory(username, password);
        req.setAttribute("showNameCategory", categoryList);


        List<Wallet> listWallet = iWalletDAO.showAllWallet(username, password);
        req.setAttribute("list", listWallet);

        List<Expense> lists = iExpenseDAO.information(information,information1,idCategory);
        req.setAttribute("lists",lists);
        req.getRequestDispatcher("users/Category.jsp").forward(req,resp);

    }
    private void SearchExpense(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException, SQLException, ClassNotFoundException {
        String categoryName = request.getParameter("categoryName");
        String username = request.getParameter("username");
        String password = request.getParameter("password");

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
    private void  deleteExpense(HttpServletRequest req, HttpServletResponse resp) throws SQLException, ClassNotFoundException, ServletException, IOException {
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

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String action = req.getParameter("action");
        req.setCharacterEncoding("UTF-8");
        if (action == null) {
            action = "";
        }
        switch (action) {
            case "add":
                System.out.println("ok");
                showFormAddExpense(req, resp);
                break;
            case "deleteExpense":
                try {
                  deleteExpense(req, resp);
                } catch (SQLException e) {
                    throw new RuntimeException(e);
                } catch (ClassNotFoundException e) {
                    throw new RuntimeException(e);
                }
            case "showUpdateExpense":
                try {
                    showUpdateExpense(req, resp);
                } catch (SQLException e) {
                    throw new RuntimeException(e);
                } catch (ClassNotFoundException e) {
                    throw new RuntimeException(e);
                }
                break;

        }
    }
    private void showToday(HttpServletRequest req, HttpServletResponse resp) throws SQLException, ClassNotFoundException, ServletException, IOException {
        LocalDate currentDate = LocalDate.now();
        int idWallet= Integer.parseInt(req.getParameter("idWallet"));
        DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd");
        String formattedDate = currentDate.format(formatter);
        List<Expense>listExpense=iExpenseDAO.showToday(formattedDate,idWallet);
        req.setAttribute("Today",listExpense);
        req.getRequestDispatcher("users/Today.jsp").forward(req, resp);
    }

    private void showUpdateExpense(HttpServletRequest req, HttpServletResponse resp) throws SQLException, ClassNotFoundException, ServletException, IOException {
        String username = req.getParameter("username");
        String password = req.getParameter("password");
        int idCategory = Integer.parseInt(req.getParameter("idCategory"));
        int idExpense = Integer.parseInt(req.getParameter("idExpense"));
        List<Expense> listExpense = iExpenseDAO.showUpdateExpense(idExpense);
        System.out.println(listExpense);
        req.setAttribute("expense", listExpense);
        System.out.println(listExpense);
        List<User> list = iUserDAO.show(username, password);
        req.setAttribute("list", list);
        HttpSession session = req.getSession();
        session.setAttribute("user", list.get(0));
        List<Category> listCategory = iCategoryDAO.selectAllCategorys(idCategory);
        req.setAttribute("category", listCategory);
        req.getRequestDispatcher("/category/fromUpdateExpense.jsp").forward(req, resp);

    }

    private void updateExpense(HttpServletRequest req, HttpServletResponse resp) throws SQLException, ClassNotFoundException, ServletException, IOException {
        String username = req.getParameter("username");
        String password = req.getParameter("password");
        int idCategory = Integer.parseInt(req.getParameter("idCategory"));
        int idExpense = Integer.parseInt(req.getParameter("idExpense"));
        System.out.println(idCategory);
        System.out.println(idExpense);
        String nameExpense = req.getParameter("nameExpense");
        System.out.println(nameExpense);
        double money1 = Double.parseDouble(req.getParameter("money1"));
        System.out.println(money1);
        double money2 = Double.parseDouble(req.getParameter("money2"));
        System.out.println(money2);
        double money=money2-money1;
        System.out.println(money);
         int wallet_id = Integer.parseInt(req.getParameter("wallet_id"));
        System.out.println(wallet_id);
        String time = req.getParameter("time");
        System.out.println(time);
        String note = req.getParameter("note");
        System.out.println(note);
        iExpenseDAO.updateExpense(new Expense(idExpense, nameExpense, money2,wallet_id, time, note));
        iExpenseDAO.MinusWallet(wallet_id,money);
        List<Expense> listExpense = iExpenseDAO.showExpenseWhereIdCategory(idCategory);
        req.setAttribute("expense", listExpense);
        List<User> list = iUserDAO.show(username, password);
        req.setAttribute("list", list);
        List<Wallet> walletList = iWalletDAO.listWallet(username, password);
        req.setAttribute("list", walletList);
        HttpSession session = req.getSession();
        session.setAttribute("user", list.get(0));
        List<Category> categoryList = iCategoryDAO.selectCategory(username, password);
        req.setAttribute("showNameCategory", categoryList);
        List<Category> listCategory = iCategoryDAO.selectAllCategorys(idCategory);
        req.setAttribute("category", listCategory);
        System.out.println("ooo");
        req.getRequestDispatcher("/users/Category.jsp").forward(req, resp);
    }



    private void showFormAddExpense(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String userName = req.getParameter("username");
        String password = req.getParameter("password");
        List<User> list = iUserDAO.show(userName, password);
        HttpSession session = req.getSession();
        session.setAttribute("user", list.get(0));
        List<Wallet>wallets=iWalletDAO.listWallet(userName,password);
        req.setAttribute("wallet",wallets);

        int idCategory = Integer.parseInt(req.getParameter("idCategory"));
        req.setAttribute("idCategory", idCategory);
        req.getRequestDispatcher("/category/formAddExpense.jsp").forward(req, resp);

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
        int idWallet= Integer.parseInt(request.getParameter("idWallet"));
//        System.out.println(idWallet);
        iExpenseDAO.addExpense(new Expense(nameExpense, money, idWallet,time, note));
        iExpenseDAO.MinusWallet(idWallet,money);
        Expense expense = iExpenseDAO.showExpense(nameExpense);
        int idExpense = expense.getIdExpense();
        iExpenseDAO.addCategoryExpense(idCategory, idExpense);
        System.out.println(idCategory);
        System.out.println(idExpense);
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