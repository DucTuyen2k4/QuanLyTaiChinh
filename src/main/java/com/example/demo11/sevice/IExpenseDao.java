package com.example.demo11.sevice;

import com.example.demo11.model.Expense;

import java.sql.SQLException;
import java.util.List;

public interface IExpenseDao  {

    List<Expense> ShowExpenseWhere(int idWallet,String First,String Last) throws SQLException, ClassNotFoundException;
   Expense getExpenseById(int id) throws SQLException, ClassNotFoundException;

    List<Expense> showAllExpense(int idWallet) throws SQLException, ClassNotFoundException;

    List<Expense> showToday(String today, int idWallet) throws SQLException, ClassNotFoundException;

    List<Expense> showUpdateExpense(int idExpense) throws SQLException, ClassNotFoundException;

    void updateExpense(Expense expense) throws SQLException, ClassNotFoundException;

    void deleteExpense(int idExpense) throws SQLException, ClassNotFoundException;

    List<Expense> information(String information, String information1, int idCategory) throws SQLException, ClassNotFoundException;

    void MinusWallet(int idWallet, double MMoney) throws ClassNotFoundException, SQLException;


   List<Expense> showExpenseWhereIdCategory(int idCategory) throws SQLException, ClassNotFoundException;
   void addExpense(Expense expense) throws SQLException, ClassNotFoundException;
   void addCategoryExpense(int idCategory,int idExpense) throws SQLException, ClassNotFoundException;
   Expense showExpense(String name) throws SQLException, ClassNotFoundException;


}