package com.example.demo11.controller;

import com.example.demo11.model.Category;
import com.example.demo11.sevice.CategoryDAO;
import com.example.demo11.sevice.ICategoryDAO;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.SQLException;
import java.util.List;

@WebServlet(name = "CategoryServlet", value = "/category")
public class CategoryServlet extends HttpServlet {
    private ICategoryDAO iCategoryDAO;

    @Override
    public void init() throws ServletException {
        iCategoryDAO = new CategoryDAO();
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
        }
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
            req.setAttribute("listCategory", list);

            req.getRequestDispatcher("/user/listHome.jsp").forward(req, resp);
        }


    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        super.doGet(req, resp);
    }
}
