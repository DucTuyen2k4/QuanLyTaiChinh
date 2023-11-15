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
    private static final String SHOW_EXPENSE_WHERE_IDCATEGORY ="SELECT expense.nameExpense, expense.money, expense.time, expense.note\n" +
            "FROM expense\n" +
            "INNER JOIN category_expense ON expense.idExpense = category_expense.idExpense\n" +
            "INNER JOIN Category ON category_expense.idCategory = Category.idCategory\n" +
            "WHERE Category.idCategory = ?";

    private static final String ADD_CATEGORY_EXPENSE ="INSERT INTO category_expense (idCategory, idExpense) VALUES(?,?)";
    private static final String ADD_EXPENSE ="INSERT INTO expense (nameExpense, money, time, note) \n" +
            "VALUES (?,?,?,?);";
    @Override
    public List<Expense> showExpenseWhereIdCategory(int idCategory) throws SQLException, ClassNotFoundException {
       List<Expense> list=new ArrayList<>();
       PreparedStatement preparedStatement = JDBC.connection().prepareStatement(SHOW_EXPENSE_WHERE_IDCATEGORY);
       preparedStatement.setString(1, String.valueOf(idCategory));
       ResultSet resultSet = preparedStatement.executeQuery();
       while (resultSet.next()){

           String nameExpense=resultSet.getString("nameExpense");

           double money=resultSet.getDouble("money");
           String time=resultSet.getString("time");
           String note=resultSet.getString("note");
           list.add(new Expense(nameExpense,money,time,note));
       }
        return list;
    }

    @Override
    public void addExpense(Expense expense) {

    }

    @Override
    public void addCategoryExpense(int idCategory, int idExpense) {

    }
}