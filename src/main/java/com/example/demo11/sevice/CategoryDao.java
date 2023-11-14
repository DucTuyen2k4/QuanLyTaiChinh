package com.example.demo11.sevice;

import com.example.demo11.JDBC;
import com.example.demo11.model.Category;
import com.example.demo11.model.Expense;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

public class CategoryDao implements ICategoryDao {
    private static final String SELECT_CATEGORY = "select category.idCategory,category.nameCategory,category.note from category inner join user_category on category.idCategory=user_category.idCategory inner join users on user_category.idUser=users.id where userName = ? and password = ?";
    private static final String INSERT_CATEGORY = "insert  into category(nameCategory,note) values (?,?) ";
    private static final String SELECT_ID_CATEGORY = "select idCategory from category where nameCategory = ? and note = ? ";
    private static final String INSERT_NEW_CATEGORY = "insert into user_category (idUser,idCategory)values(?,?)";
    private static final String SELECT_NAME_CATEGORY = "select nameCategory from category where nameCategory = ? ";
    private static final String SHOW_CATEGORY_WHERE_ID = "select * from category where idCategory=? ";
    public static final String SELECT_CATEGORY_UPDATE = "UPDATE Category set nameCategory=?,note=? where idCategory=?";
    private static final String SELECT_ALL_CATEGORY = "select * from category where idCategory = ? ";


    public static final String DELETE_CATEGORY = "DELETE user_category, category FROM user_category LEFT JOIN category ON user_category.idCategory = category.idCategory WHERE user_category.idCategory = ?";

    private static final String INSERT_EXPENSE = "insert into expense (nameExpense,money,time,note)values(?,?,?,?)";
    private static final String SHOW_EXPENSE = "select * from expense ";


    @Override
    public void insertExpense(Expense expense) throws SQLException, ClassNotFoundException {
        PreparedStatement preparedStatement = JDBC.connection().prepareStatement(INSERT_EXPENSE);
        preparedStatement.setString(1,expense.getNameExpense());
        preparedStatement.setString(2,expense.getMoney());
        preparedStatement.setString(3,expense.getTime());
        preparedStatement.setString(4, expense.getNote());
        preparedStatement.executeUpdate();
    }

    @Override
    public List<Expense> showExpense() throws SQLException, ClassNotFoundException {
        List<Expense> list = new ArrayList<>();
        Statement statement = JDBC.connection().createStatement();
        ResultSet resultSet = statement.executeQuery(SHOW_EXPENSE);
        while (resultSet.next()){
            String nameExpense = resultSet.getString("nameExpense");
            String money = resultSet.getString("money");
            String time = resultSet.getString("time");
            String note = resultSet.getString("note");
            list.add(new Expense(nameExpense,money,time,note));
        }
        return list;
    }
    @Override
    public void deleteCategory(int id) throws SQLException, ClassNotFoundException {
        PreparedStatement preparedStatement = JDBC.connection().prepareStatement(DELETE_CATEGORY);
        preparedStatement.setInt(1, id);
        preparedStatement.executeUpdate();
    }
    @Override
    public List<Category> selectAllCategorys(int idCategory) throws SQLException, ClassNotFoundException {
        List<Category> list = new ArrayList<>();
        PreparedStatement preparedStatement = JDBC.connection().prepareStatement(SELECT_ALL_CATEGORY);
        preparedStatement.setInt(1, idCategory);
        ResultSet resultSet = preparedStatement.executeQuery();
        while (resultSet.next()) {
            int id = resultSet.getInt("idCategory");
            String nameCategory = resultSet.getString("nameCategory");
            String note = resultSet.getString("note");
            list.add(new Category(id, nameCategory, note));
        }
        return list;
    }

    @Override
    public List<Category> selectCategory(String userName, String password) throws SQLException, ClassNotFoundException {
        PreparedStatement statement = JDBC.connection().prepareStatement(SELECT_CATEGORY);
        statement.setString(1, userName);
        statement.setString(2, password);
        List<Category> list = new ArrayList<>();
        ResultSet resultSet = statement.executeQuery();
        while (resultSet.next()) {
            int idCategory = resultSet.getInt("idCategory");
            String nameCategory = resultSet.getString("nameCategory");
            String note = resultSet.getString("note");
            list.add(new Category(idCategory, nameCategory, note));
        }
        return list;
    }

    @Override
    public void insertCategory(Category category) throws SQLException, ClassNotFoundException {
        PreparedStatement preparedStatement = JDBC.connection().prepareStatement(INSERT_CATEGORY);
        preparedStatement.setString(1, category.getNameCategory());
        preparedStatement.setString(2, category.getNote());
        preparedStatement.executeUpdate();
    }

    @Override
    public Category selectIdCategory(String nameCategory, String note) throws SQLException, ClassNotFoundException {
        PreparedStatement preparedStatement = JDBC.connection().prepareStatement(SELECT_ID_CATEGORY);
        Category category = null;
        preparedStatement.setString(1, nameCategory);
        preparedStatement.setString(2, note);
        ResultSet resultSet = preparedStatement.executeQuery();
        while (resultSet.next()) {
            int idCategory = resultSet.getInt("idCategory");
            category = new Category(idCategory);
        }
        return category;
    }

    @Override
    public void insertNewCategory(int idUser, int idCategory) throws SQLException, ClassNotFoundException {
        PreparedStatement preparedStatement = JDBC.connection().prepareStatement(INSERT_NEW_CATEGORY);
        preparedStatement.setInt(1, idUser);
        preparedStatement.setInt(2, idCategory);
        preparedStatement.executeUpdate();
    }

    @Override
    public boolean selectNameCategory(String name) throws SQLException, ClassNotFoundException {
        PreparedStatement preparedStatement = JDBC.connection().prepareStatement(SELECT_NAME_CATEGORY);
        preparedStatement.setString(1, name);
        ResultSet resultSet = preparedStatement.executeQuery();
        return resultSet.next();
    }


    @Override
    public Category showCategory(int idCategory) throws SQLException, ClassNotFoundException {
        Category category = null;
        PreparedStatement preparedStatement = JDBC.connection().prepareStatement(SHOW_CATEGORY_WHERE_ID);
        preparedStatement.setInt(1, idCategory);
        ResultSet resultSet = preparedStatement.executeQuery();
        while (resultSet.next()) {
            String categoryName = resultSet.getString("categoryName");
            String categoryNote = resultSet.getString("categoryNote");

            System.out.println(idCategory + categoryName + categoryNote);
            category = new Category(idCategory, categoryName, categoryNote);
        }

        return category;
    }

    @Override
    public void CategoryUpdate(Category category) throws SQLException, ClassNotFoundException {
        PreparedStatement statement = JDBC.connection().prepareStatement(SELECT_CATEGORY_UPDATE);
        statement.setString(1, category.getNameCategory());
        statement.setString(2, category.getNote());
        statement.setInt(3, category.getIdCategory());
        statement.executeUpdate();

    }

    @Override
    public List<Category> showCategory1(int idCategory) throws SQLException, ClassNotFoundException {
        List<Category> category = new ArrayList<>();
        PreparedStatement preparedStatement = JDBC.connection().prepareStatement(SHOW_CATEGORY_WHERE_ID);
        preparedStatement.setInt(1, idCategory);
        ResultSet resultSet = preparedStatement.executeQuery();
        while (resultSet.next()) {
            String categoryName = resultSet.getString("nameCategory");
            String categoryNote = resultSet.getString("note");
            category.add(new Category(idCategory, categoryName, categoryNote));
        }

        return category;
    }

}