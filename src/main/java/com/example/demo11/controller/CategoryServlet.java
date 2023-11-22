package com.example.demo11.controller;

import com.example.demo11.model.Category;
import com.example.demo11.model.Expense;
import com.example.demo11.model.User;
import com.example.demo11.model.Wallet;
import com.example.demo11.sevice.*;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.sql.SQLException;
import java.util.List;

import static com.example.demo11.controller.UserServlet.*;


@WebServlet(name ="CategoryServlet", value = "/category")
public class CategoryServlet extends HttpServlet {

    private ICategoryDao iCategoryDAO;
    private IUserDAO iUserDAO;
    private IWalletDAO iWalletDAO;
    private IExpenseDao iExpenseDao;

    @Override
    public void init() throws ServletException {
        iCategoryDAO = new CategoryDao();
        iUserDAO = new UserDAO();
        iWalletDAO = new WalletDAO();
        iExpenseDao=new ExpenseDao();
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String action = req.getParameter("action");
        req.setCharacterEncoding("UTF-8");
        resp.setContentType("text/html; charset=UTF-8");
        if (action == null) {
            action = "";
        }
        switch (action) {
            case "confirmCategory":
                try {
                    addCategory(req, resp);
                } catch (SQLException e) {
                    throw new RuntimeException(e);
                } catch (ClassNotFoundException e) {
                    throw new RuntimeException(e);
                }
                break;
            case "showCategoryUpdate":
                try {
                    showCategoryUpdate(req, resp);
                } catch (SQLException e) {
                    throw new RuntimeException(e);
                } catch (ClassNotFoundException e) {
                    throw new RuntimeException(e);
                }
            case "CategoryUpdate":
                try {
                    updateCategory(req, resp);
                } catch (SQLException e) {
                    throw new RuntimeException(e);
                } catch (ClassNotFoundException e) {
                    throw new RuntimeException(e);
                }
        }
    }
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String action = req.getParameter("action");
        if (action == null) {
            action = "";
        }
        req.setCharacterEncoding("UTF-8");
        resp.setContentType("text/html; charset=UTF-8");
        switch (action) {

            case "showCategory":
                try {
                    showCategory(req, resp);
                } catch (SQLException e) {
                    throw new RuntimeException(e);
                } catch (ClassNotFoundException e) {
                    throw new RuntimeException(e);
                }
                break;
            case "delete":
                try {
                    Delete(req,resp);
                } catch (SQLException e) {
                    throw new RuntimeException(e);
                } catch (ClassNotFoundException e) {
                    throw new RuntimeException(e);
                }
            case "search":
                try {
                    shearch(req,resp);
                } catch (SQLException e) {
                    throw new RuntimeException(e);
                } catch (ClassNotFoundException e) {
                    throw new RuntimeException(e);
                }
        }
    }

    private void shearch(HttpServletRequest req, HttpServletResponse resp) throws SQLException, ClassNotFoundException, ServletException, IOException {
        int id = Integer.parseInt(req.getParameter("idCategory"));
        req.setAttribute("id",id);
        req.getRequestDispatcher("users/information.jsp").forward(req, resp);
    }

    private void Delete(HttpServletRequest req, HttpServletResponse resp) throws SQLException, ClassNotFoundException, ServletException, IOException {
        String username = req.getParameter("username");
        String password = req.getParameter("password");
        int id = Integer.parseInt(req.getParameter("idCategory"));
        iCategoryDAO.deleteCategory(id);
        List<Category> categoryList = iCategoryDAO.selectCategory(username,password);
        req.setAttribute("showNameCategory",categoryList);
        List<Wallet> listWallet = iWalletDAO.showAllWallet(username, password);
        req.setAttribute("list", listWallet);
        req.getRequestDispatcher("users/Home.jsp").forward(req, resp);
    }
    private void showCategory(HttpServletRequest req, HttpServletResponse resp) throws SQLException, ClassNotFoundException, ServletException, IOException {
        int idCategory = Integer.parseInt(req.getParameter("idCategory"));
        String username = req.getParameter("username");
        String password = req.getParameter("password");
        List<Expense> listExpense=iExpenseDao.showExpenseWhereIdCategory(idCategory);
        req.setAttribute("expense",listExpense);
        List<User> list = userDAO.show(username, password);
        req.setAttribute("list", list);
        List<Wallet> walletList = walletDAO.listWallet(username, password);
        req.setAttribute("list", walletList);
        HttpSession session = req.getSession();
        session.setAttribute("user", list.get(0));
        List<Category> categoryList = iCategoryDAO.selectCategory(username, password);
        req.setAttribute("showNameCategory", categoryList);
        List<Category> listCategory = iCategoryDAO.selectAllCategorys(idCategory);
        req.setAttribute("category", listCategory);
        req.getRequestDispatcher("/users/Category.jsp").forward(req, resp);
    }
    private void addCategory(HttpServletRequest req, HttpServletResponse resp) throws SQLException, ClassNotFoundException, ServletException, IOException {
        int id = Integer.parseInt(req.getParameter("id"));
        String username = req.getParameter("username");
        String password = req.getParameter("password");
        String nameCategory = req.getParameter("nameCategory");
        String note = req.getParameter("note");
        List<Wallet> walletShowMoney = walletDAO.showMoney(username);
        req.setAttribute("money", walletShowMoney);
        if (iCategoryDAO.selectNameCategory(nameCategory)) {
            req.setAttribute("message","Tên danh mục đã tồn tại !");
            req.getRequestDispatcher("/category/formAddCategory.jsp").forward(req,resp);
        } else {
            iCategoryDAO.insertCategory(new Category(nameCategory, note));

            Category selectIdCategory = iCategoryDAO.selectIdCategory(nameCategory, note);
            int idCategory = selectIdCategory.getIdCategory();

            iCategoryDAO.insertNewCategory(id, idCategory);

            List<Category> list = iCategoryDAO.selectCategory(username, password);
            req.setAttribute("showNameCategory", list);

            List<Wallet> walletList = walletDAO.listWallet(username, password);
            req.setAttribute("list", walletList);

            req.getRequestDispatcher("/users/Home.jsp").forward(req, resp);
        }
    }
    private void showCategoryUpdate(HttpServletRequest req, HttpServletResponse resp) throws SQLException, ClassNotFoundException, ServletException, IOException {
        int idCategory = Integer.parseInt(req.getParameter("idCategory"));
        String username = req.getParameter("username");
        String password = req.getParameter("password");
        List<Category> category = iCategoryDAO.showCategory(idCategory);
        req.setAttribute("listCategory", category);
        List<User> list = iUserDAO.show(username, password);
        HttpSession session = req.getSession();
        session.setAttribute("user", list.get(0));
        req.getRequestDispatcher("category/showCategoryUpdate.jsp").forward(req, resp);
    }


    private void updateCategory(HttpServletRequest request, HttpServletResponse response) throws SQLException, ClassNotFoundException, ServletException, IOException {
        String userName = request.getParameter("username");
        String password = request.getParameter("password");
        int idCategory = Integer.parseInt(request.getParameter("idCategory"));
        String categoryName = request.getParameter("nameCategory");
        String note = request.getParameter("note");
        iCategoryDAO.CategoryUpdate(new Category(idCategory, categoryName,note));
        List<Expense> listExpense=iExpenseDao.showExpenseWhereIdCategory(idCategory);
        request.setAttribute("expense",listExpense);
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