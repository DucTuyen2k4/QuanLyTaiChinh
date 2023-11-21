package com.example.demo11.sevice;

import com.example.demo11.model.Expense;

import java.sql.SQLException;
import java.util.List;

public interface IExpenseDao  {
   public List<Expense> ShowExpenseWhere(int idWallet,String First,String Last) throws SQLException, ClassNotFoundException;
   public List<Expense> ShowToday(String today,int idWallet) throws ClassNotFoundException, SQLException;
   List<Expense> showExpenseWhereIdCategory(int idCategory) throws SQLException, ClassNotFoundException;
   void addExpense(Expense expense) throws SQLException, ClassNotFoundException;
   void addCategoryExpense(int idCategory,int idExpense) throws SQLException, ClassNotFoundException;
   Expense showExpense(String name) throws SQLException, ClassNotFoundException;



}