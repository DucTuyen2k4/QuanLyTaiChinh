package com.example.demo11.sevice;

import com.example.demo11.JDBC;
import com.example.demo11.model.Expense;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

public class ExpenseDao implements IExpenseDao {
    private static final String SEARCH_EXPENSE_BY_CATEGORY_ID = "SELECT * FROM expense " +
            "JOIN category ON expense.idCategory = category.idCategory " +
            "JOIN expense ON category.idCategory = expense.idExpense " +
            "WHERE category.idCategory = ?";


    @Override
    public void findByNoteContainingIgnoreCase(int idCategory) throws SQLException, ClassNotFoundException {
return ;
    }

}
