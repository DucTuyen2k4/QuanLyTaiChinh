package com.example.demo11.controller;

import com.example.demo11.model.Category;
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

    @Override
    public void init() throws ServletException {
        iCategoryDAO = new CategoryDao();
        iUserDAO = new UserDAO();
        iWalletDAO = new WalletDAO();
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String action = req.getParameter("action");
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
        }
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
        System.out.println(idCategory);
        String username = req.getParameter("username");
        System.out.println(username);
        String password = req.getParameter("password");
        System.out.println(password);
        List<User> list = userDAO.show(username, password);
        req.setAttribute("list", list);

        List<Wallet> walletList = walletDAO.listWallet(username, password);
        req.setAttribute("list", walletList);

        HttpSession session = req.getSession();
        session.setAttribute("user", list.get(0));

        List<Category> categoryList = iCategoryDAO.selectCategory(username, password);
        req.setAttribute("listCategory", categoryList);

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
        List<Category> category = iCategoryDAO.showCategory1(idCategory);
        List<Category> categoryList = icategoryDao.selectCategory(username,password);

        req.setAttribute("listCategory",categoryList);
        req.setAttribute("listCategoryUpdate", category);

        req.getRequestDispatcher("users/q.jsp").forward(req, resp);
    }

//        private void showCategory(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException, SQLException, ClassNotFoundException {
//        int idCategory = Integer.parseInt(req.getParameter("id"));
//        Category category = iCategoryDAO.showCategory(idCategory);
//        System.out.println(category);
//        Category category1 = new Category(idCategory);
//        HttpSession httpSession = req.getSession();
//        httpSession.setAttribute("category1", category1);
//        req.getRequestDispatcher("users/q.jsp").forward(req, resp);
//    }
    private void updateCategory(HttpServletRequest request, HttpServletResponse response) throws SQLException, ClassNotFoundException, ServletException, IOException {
        String username = request.getParameter("username");
        String password = request.getParameter("password");

        int idCategory = Integer.parseInt(request.getParameter("idCategory"));
        String categoryName = request.getParameter("categoryName");
        String categoryNote = request.getParameter("categoryNote");
        System.out.println(idCategory + categoryName + categoryNote);

        iCategoryDAO.CategoryUpdate(new Category(idCategory, categoryName, categoryNote));
        List<Category> listCategory = iCategoryDAO.selectCategory(username, password);
        request.setAttribute("listCategory", listCategory);

        Category category = new Category(idCategory, categoryName, categoryNote);
        request.setAttribute("category", category);

        List<User> listUser = userDAO.show(username, password);

        HttpSession session = request.getSession();
        session.setAttribute("user", listUser.get(0));

        List<Category> categoryList = icategoryDao.selectCategory(username,password);
        request.setAttribute("listCategory",categoryList);
        System.out.println(categoryList);

        List<Wallet> listWallet = iWalletDAO.showAllWallet(username, password);
        request.setAttribute("list", listWallet);
        request.getRequestDispatcher("users/q.jsp").forward(request, response);
    }
}