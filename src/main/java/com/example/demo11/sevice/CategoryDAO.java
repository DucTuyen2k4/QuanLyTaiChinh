package com.example.demo11.sevice;

import com.example.demo11.JDBC;
import com.example.demo11.model.Category;
import com.mysql.cj.jdbc.JdbcPreparedStatement;
import com.mysql.cj.jdbc.JdbcStatement;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

public class CategoryDAO implements ICategoryDAO {
    private static final String SELECT_CATEGORY= "select category.idCategory,category.nameCategory,category.note from category inner join user_category on category.idCategory=user_category.idCategory inner join users on user_category.idUser=users.id where userName = ? and password = ?";
    private static final String INSERT_CATEGORY = "insert  into category(nameCategory,note) values (?,?) ";
    private static final String SELECT_ID_CATEGORY = "select idCategory from category where nameCategory = ? and note = ? ";
    private static final String INSERT_NEW_CATEGORY = "insert into user_category (idUser,idCategory)values(?,?)";
    private static final String SELECT_NAME_CATEGORY ="select nameCategory from category where nameCategory = ? ";

    public CategoryDAO(){

    }

    @Override
    public List<Category> selectCategory(String userName, String password) throws SQLException, ClassNotFoundException {
        PreparedStatement statement = JDBC.connection().prepareStatement(SELECT_CATEGORY);
        statement.setString(1,userName);
        statement.setString(2,password);
        List<Category> list = new ArrayList<>();
        ResultSet resultSet = statement.executeQuery();
        while (resultSet.next()){
            int idCategory = resultSet.getInt("idCategory");
            String nameCategory = resultSet.getString("nameCategory");
            String note = resultSet.getString("note");
            list.add(new Category(idCategory,nameCategory,note));
        }
        return list;
    }

    @Override
    public void insertCategory(Category category) throws SQLException, ClassNotFoundException {
        PreparedStatement  preparedStatement = JDBC.connection().prepareStatement(INSERT_CATEGORY);
        preparedStatement.setString(1,category.getNameCategory());
        preparedStatement.setString(2,category.getNote());
        preparedStatement.executeUpdate();
    }

    @Override
    public Category selectIdCategory(String nameCategory, String note) throws SQLException, ClassNotFoundException {
        PreparedStatement preparedStatement = JDBC.connection().prepareStatement(SELECT_ID_CATEGORY);
        Category category = null;
        preparedStatement.setString(1,nameCategory);
        preparedStatement.setString(2,note);
        ResultSet resultSet = preparedStatement.executeQuery();
        while (resultSet.next()){
            int idCategory = resultSet.getInt("idCategory");
            category = new Category(idCategory);
        }
        return category;
    }

    @Override
    public void insertNewCategory(int idUser, int idCategory) throws SQLException, ClassNotFoundException {
        PreparedStatement preparedStatement = JDBC.connection().prepareStatement(INSERT_NEW_CATEGORY);
        preparedStatement.setInt(1,idUser);
        preparedStatement.setInt(2,idCategory);
        preparedStatement.executeUpdate();
    }

    @Override
    public boolean selectNameCategory(String name) throws SQLException, ClassNotFoundException {
        PreparedStatement preparedStatement = JDBC.connection().prepareStatement(SELECT_NAME_CATEGORY);
        Category category = null;
        preparedStatement.setString(1,name);
        ResultSet resultSet = preparedStatement.executeQuery();
        return resultSet.next();
    }
}
