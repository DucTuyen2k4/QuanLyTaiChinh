package com.example.demo11.sevice;

import com.example.demo11.model.Category;

import java.sql.SQLException;
import java.util.List;

public interface ICategoryDAO {
    public List<Category> selectCategory(String userName,String password) throws SQLException, ClassNotFoundException;
    public void insertCategory(Category category) throws SQLException, ClassNotFoundException;
    public Category selectIdCategory(String nameCategory , String note) throws SQLException, ClassNotFoundException;
    public void insertNewCategory(int idUser,int idCategory) throws SQLException, ClassNotFoundException;
    public boolean selectNameCategory(String nameCategory) throws SQLException, ClassNotFoundException;

}
