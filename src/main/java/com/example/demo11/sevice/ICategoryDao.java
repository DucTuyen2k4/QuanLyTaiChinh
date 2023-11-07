package com.example.demo11.sevice;

import com.example.demo11.model.Category;

import java.sql.SQLException;
import java.util.List;

public interface ICategoryDao {
    Category showCategory(int idCategory) throws SQLException, ClassNotFoundException;
    void CategoryUpdate(Category category) throws SQLException, ClassNotFoundException;
    List<Category> showCategory1(int idCategory) throws SQLException, ClassNotFoundException;
    public List<Category> selectCategory(String userName,String password) throws SQLException, ClassNotFoundException;
    public void insertCategory(Category category) throws SQLException, ClassNotFoundException;
    public Category selectIdCategory(String nameCategory , String note) throws SQLException, ClassNotFoundException;
    public void insertNewCategory(int idUser,int idCategory) throws SQLException, ClassNotFoundException;
    public boolean selectNameCategory(String nameCategory) throws SQLException, ClassNotFoundException;

}