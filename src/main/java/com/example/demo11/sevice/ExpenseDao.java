package com.example.demo11.sevice;

import com.example.demo11.JDBC;
import com.example.demo11.model.Expense;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class ExpenseDao implements IExpenseDao {
    private static final String SHOW_EXPENSE_WHERE_IDCATEGORY = "SELECT expense.idExpense, expense.nameExpense, expense.money, expense.time, expense.note\n" +
            "FROM expense\n" +
            "INNER JOIN category_expense ON expense.idExpense = category_expense.idExpense\n" +
            "INNER JOIN category ON category_expense.idCategory = category.idCategory\n" +
            "WHERE category.idCategory = ?";

    private static final String ADD_CATEGORY_EXPENSE = "INSERT INTO category_expense (idCategory, idExpense) VALUES(?,?)";
    private static final String ADD_EXPENSE = "INSERT INTO expense (nameExpense, money, time, note) \n" +
            "VALUES (?,?,?,?);";
    private static final String SHOW_EXPENSE = "select idExpense from expense where nameExpense = ?  ";
    private static final String DELETE_EXPENSE = "DELETE category_expense, expense FROM category_expense INNER JOIN expense ON category_expense.idCategoryExpense = expense.idExpense WHERE category_expense.idCategoryExpense = ?";
    private static final String UPDATE_EXPENSE = "update expense set nameExpense=?,money=?,time=?,note=? where idExpense=?";
    private static final String SHOW_UPDATE_EXPENSE = "select * from expense where idExpense=?";
    @Override
    public List<Expense> showUpdateExpense(int idExpense) throws SQLException, ClassNotFoundException {
        List<Expense> list=new ArrayList<>();
        PreparedStatement preparedStatement=JDBC.connection().prepareStatement(SHOW_UPDATE_EXPENSE);
        preparedStatement.setInt(1,idExpense);
        ResultSet resultSet = preparedStatement.executeQuery();
        while (resultSet.next()){
            String nameExpense=resultSet.getString("nameExpense");
            double money= resultSet.getDouble("money");
            String time=resultSet.getString("time");
            String note =resultSet.getString("note");
            list.add(new Expense(idExpense,nameExpense,money,time,note));
        }
        return list;
    }
    @Override
    public void updateExpense(Expense expense) throws SQLException, ClassNotFoundException {

        PreparedStatement preparedStatement = JDBC.connection().prepareStatement(UPDATE_EXPENSE);
        preparedStatement.setString(1, expense.getNameExpense());
        preparedStatement.setDouble(2, expense.getMoney());
        preparedStatement.setString(3, expense.getTime());
        preparedStatement.setString(4, expense.getNote());
        preparedStatement.setInt(5, expense.getIdExpense());
        preparedStatement.executeUpdate();

    }
    public void deleteExpense(int idExpense) throws SQLException, ClassNotFoundException {
        PreparedStatement preparedStatement = JDBC.connection().prepareStatement(DELETE_EXPENSE);
        preparedStatement.setInt(1, idExpense);
        preparedStatement.executeUpdate();
    }

    @Override
    public Expense getExpenseById(int id) throws SQLException, ClassNotFoundException {


        try {

            String query = "SELECT * FROM expense WHERE idExpense = ?";
            PreparedStatement statement = JDBC.connection().prepareStatement(query);
            statement.setInt(1, id);
            ResultSet resultSet = statement.executeQuery();

            if (resultSet.next()) {
                Expense expense = new Expense();
                expense.setIdExpense(resultSet.getInt("idExpense"));
                expense.setNameExpense(resultSet.getString("nameExpense"));
                expense.setMoney(resultSet.getDouble("money"));
                expense.setTime(resultSet.getString("time"));
                expense.setNote(resultSet.getString("note"));
                return expense;
            }
        } finally {

        }
        return null;
    }


    @Override
    public List<Expense> showExpenseWhereIdCategory(int idCategory) throws SQLException, ClassNotFoundException {
        List<Expense> list = new ArrayList<>();
        PreparedStatement preparedStatement = JDBC.connection().prepareStatement(SHOW_EXPENSE_WHERE_IDCATEGORY);
        preparedStatement.setString(1, String.valueOf(idCategory));
        ResultSet resultSet = preparedStatement.executeQuery();
        while (resultSet.next()) {
            int idExpense = resultSet.getInt("idExpense");
            String nameExpense = resultSet.getString("nameExpense");
            double money = resultSet.getDouble("money");
            String time = resultSet.getString("time");
            String note = resultSet.getString("note");
            list.add(new Expense(idExpense, nameExpense, money, time, note));
        }
        return list;
    }

    @Override
    public void addExpense(Expense expense) throws SQLException, ClassNotFoundException {
        PreparedStatement preparedStatement = JDBC.connection().prepareStatement(ADD_EXPENSE);
        preparedStatement.setString(1, expense.getNameExpense());
        preparedStatement.setDouble(2, expense.getMoney());
        preparedStatement.setString(3, expense.getTime());
        preparedStatement.setString(4, expense.getNote());
        preparedStatement.executeUpdate();
    }

    @Override
    public void addCategoryExpense(int idCategory, int idExpense) throws SQLException, ClassNotFoundException {
        PreparedStatement preparedStatement = JDBC.connection().prepareStatement(ADD_CATEGORY_EXPENSE);
        preparedStatement.setInt(1, idCategory);
        preparedStatement.setInt(2, idExpense);
        preparedStatement.executeUpdate();
    }

    @Override
    public Expense showExpense(String name) throws SQLException, ClassNotFoundException {
        Expense expense = null;
        PreparedStatement preparedStatement = JDBC.connection().prepareStatement(SHOW_EXPENSE);
        preparedStatement.setString(1, name);
        ResultSet resultSet = preparedStatement.executeQuery();
        while (resultSet.next()) {
            int idExpense = resultSet.getInt("idExpense");
            expense = new Expense(idExpense);
        }
        return expense;
    }
}