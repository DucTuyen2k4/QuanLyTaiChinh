package com.example.demo11.sevice;

import com.example.demo11.model.Expense;
import com.example.demo11.model.Wallet;

import java.sql.SQLException;
import java.util.List;

public interface IExpenseDao  {
   List<Expense> selectExpenseByCategory(String categoryName) throws SQLException, ClassNotFoundException;

   Expense getExpenseById(int id) throws SQLException, ClassNotFoundException;
   void deleteExpense(int idExpense) throws SQLException, ClassNotFoundException;



   List<Expense> showExpenseWhereIdCategory(int idCategory) throws SQLException, ClassNotFoundException;
   void addExpense(Expense expense) throws SQLException, ClassNotFoundException;
   void addCategoryExpense(int idCategory,int idExpense) throws SQLException, ClassNotFoundException;
   Expense showExpense(String name) throws SQLException, ClassNotFoundException;


}