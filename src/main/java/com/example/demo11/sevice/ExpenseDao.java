package com.example.demo11.sevice;

import com.example.demo11.JDBC;
import com.example.demo11.model.Expense;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class ExpenseDao implements IExpenseDao {
    private static final String SHOW_EXPENSE_WHERE_IDCATEGORY = "SELECT expense.idExpense, expense.nameExpense, expense.money,expense.wallet_id, expense.time, expense.note\n" +
            "FROM expense\n" +
            "INNER JOIN category_expense ON expense.idExpense = category_expense.idExpense\n" +
            "INNER JOIN Category ON category_expense.idCategory = Category.idCategory\n" +
            "WHERE Category.idCategory = ?";

    private static final String ADD_CATEGORY_EXPENSE = "INSERT INTO category_expense (idCategory, idExpense) VALUES(?,?)";
    private static final String ADD_EXPENSE = "INSERT INTO expense (nameExpense, money, time, note,wallet_id) \n" +
            "VALUES (?,?,?,?,?);";
    private static final String SHOW_EXPENSE = "select idExpense from expense where nameExpense = ?  ";

    private static final String UPDATE_EXPENSE = "update expense set nameExpense=?,money=?,time=?,note=? where idExpense=?";
    private static final String SHOW_UPDATE_EXPENSE = "select * from expense where idExpense=?";
    private static final String SHOW_TODAY = "select * from expense where time=? and wallet_id=?";
    private static final String SHOW_ALL_EXPENSE_IDWALLET = "select * from expense where wallet_id=?";

    private static final String DELETE_EXPENSE = "DELETE category_expense, expense FROM category_expense INNER JOIN expense ON category_expense.idCategoryExpense = expense.idExpense WHERE category_expense.idCategoryExpense = ?";
    private static final String SELECT_EXPENSE_CATEGORY = "SELECT expense.idExpense,expense.nameExpense,expense.money,expense.time,expense.note,expense.wallet_id FROM expense " +
            "JOIN category_expense ON expense.idExpense = category_expense.idExpense " +
            "JOIN Category ON Category.idCategory = category_expense.idCategory " +
            "WHERE Category.nameCategory = ?";
    private static final String MINUS_WALLET = "UPDATE wallet SET money = money - ? WHERE idWallet = ?";
    private static final String SHOW_EXPENSE_FROM_WALLET = "SELECT * FROM expense WHERE time BETWEEN ? AND ? AND wallet_id = ?";
    //    private static final String ADD_EXPENSE = "INSERT INTO expense (nameExpense, money, time, note) \n" + "VALUES (?,?,?,?);";
    private static final String sql = "SELECT COUNT(*) FROM Category WHERE nameCategory = ?";
    private static final String INFORMATION = "select  expense.idExpense,money,time,expense.note from Category inner join category_expense on Category.idCategory = category_expense.idCategory inner join expense on category_expense.idExpense =expense.idExpense  WHERE time BETWEEN ? AND ? and category_expense.idCategory=? ";

    public List<Expense> ShowExpenseWhere(int idWallet, String First, String Last) throws SQLException, ClassNotFoundException {
        List<Expense> list = new ArrayList<>();
        PreparedStatement preparedStatement = JDBC.connection().prepareStatement(SHOW_EXPENSE_FROM_WALLET);
        preparedStatement.setString(1, First);
        preparedStatement.setString(2, Last);
        preparedStatement.setInt(3, idWallet);
        ResultSet resultSet = preparedStatement.executeQuery();
        while (resultSet.next()) {
            String nameExpense = resultSet.getString("nameExpense");
            double money = resultSet.getDouble("money");
            String time = resultSet.getString("time");
            String note = resultSet.getString("note");
            list.add(new Expense(nameExpense, money, time, note));
        }
        return list;
    }

    @Override
    public List<Expense> information(String information, String information1, int idCategory) throws SQLException, ClassNotFoundException {
        List<Expense> expenseList = new ArrayList<>();
        PreparedStatement preparedStatement = JDBC.connection().prepareStatement(INFORMATION);
        preparedStatement.setString(1, information);
        preparedStatement.setString(2, information1);
        preparedStatement.setInt(3, idCategory);
        ResultSet resultSet = preparedStatement.executeQuery();
        while (resultSet.next()) {
            System.out.println("ok");
            int idExpense = resultSet.getInt("idExpense");
            System.out.println(idExpense);
            Double money = resultSet.getDouble("money");
            String time = resultSet.getString("time");
            String note = resultSet.getString("note");
            System.out.println(money + time + note);
            expenseList.add(new Expense(idExpense, money, time, note));
        }
        return expenseList;
    }

    public void MinusWallet(int idWallet, double MMoney) throws SQLException, ClassNotFoundException {
        PreparedStatement preparedStatement = JDBC.connection().prepareStatement(MINUS_WALLET);
        preparedStatement.setDouble(1, MMoney);
        preparedStatement.setInt(2, idWallet);
        preparedStatement.executeUpdate();
    }

    public List<Expense> selectExpenseByCategory(String categoryName) throws SQLException, ClassNotFoundException {
        List<Expense> list = new ArrayList<>();

        PreparedStatement preparedStatement = JDBC.connection().prepareStatement(SELECT_EXPENSE_CATEGORY);
        preparedStatement.setString(1, categoryName.trim());
        try (ResultSet resultSet = preparedStatement.executeQuery()) {
            while (resultSet.next()) {
                int idExpense = resultSet.getInt("idExpense");
                String nameExpense = resultSet.getString("nameExpense");
                double money = resultSet.getDouble("money");
                int wallet = resultSet.getInt("wallet_id");
                String time = resultSet.getString("time");
                String note = resultSet.getString("note");
                list.add(new Expense(idExpense, nameExpense, money, wallet, time, note));
            }
        }

        return list;
    }

    public boolean doesCategoryExist(String categoryName) throws SQLException, ClassNotFoundException {


        PreparedStatement statement = JDBC.connection().prepareStatement(sql);
        statement.setString(1, categoryName);
        ResultSet resultSet = statement.executeQuery();

        boolean categoryExists = Boolean.parseBoolean(null);
        if (resultSet.next() && resultSet.getInt(1) > 0) {
            categoryExists = true;
        }

        return categoryExists;
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
                expense.setWallet_id(resultSet.getInt("wallet_id"));
                expense.setTime(resultSet.getString("time"));
                expense.setNote(resultSet.getString("note"));
                return expense;
            }
        } finally {

        }
        return null;
    }


    @Override
    public List<Expense> showAllExpense(int idWallet) throws SQLException, ClassNotFoundException {
        List<Expense> list = new ArrayList<>();
        PreparedStatement preparedStatement = JDBC.connection().prepareStatement(SHOW_ALL_EXPENSE_IDWALLET);
        preparedStatement.setInt(1, idWallet);
        ResultSet resultSet = preparedStatement.executeQuery();
        while (resultSet.next()) {
            int idExpense = resultSet.getInt("idExpense");
            String nameExpense = resultSet.getString("nameExpense");
            double money = resultSet.getDouble("money");
            int wallet = resultSet.getInt("wallet_id");
            String time = resultSet.getString("time");
            String note = resultSet.getString("note");
            list.add(new Expense(idExpense, nameExpense, money, wallet, time, note));
        }
        return list;
    }

    @Override
    public List<Expense> showToday(String today, int idWallet) throws SQLException, ClassNotFoundException {
        List<Expense> list = new ArrayList<>();
        PreparedStatement preparedStatement = JDBC.connection().prepareStatement(SHOW_TODAY);
        preparedStatement.setString(1, today);
        preparedStatement.setInt(2, idWallet);
        ResultSet resultSet = preparedStatement.executeQuery();
        while (resultSet.next()) {
            String nameExpense = resultSet.getString("nameExpense");
            double money = resultSet.getDouble("money");
            int wallet = resultSet.getInt("wallet_id");
            String time = resultSet.getString("time");
            String note = resultSet.getString("note");
            list.add(new Expense(nameExpense, money, wallet, time, note));
        }
        return list;
    }


    @Override
    public List<Expense> showUpdateExpense(int idExpense) throws SQLException, ClassNotFoundException {
        List<Expense> list = new ArrayList<>();
        PreparedStatement preparedStatement = JDBC.connection().prepareStatement(SHOW_UPDATE_EXPENSE);
        preparedStatement.setInt(1, idExpense);
        ResultSet resultSet = preparedStatement.executeQuery();
        while (resultSet.next()) {
            String nameExpense = resultSet.getString("nameExpense");
            double money = resultSet.getDouble("money");
            int wallet_id = resultSet.getInt("wallet_id");
            String time = resultSet.getString("time");
            String note = resultSet.getString("note");
            list.add(new Expense(idExpense, nameExpense, money, wallet_id, time, note));
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
            int wallet = resultSet.getInt("wallet_id");
            String time = resultSet.getString("time");
            String note = resultSet.getString("note");
            list.add(new Expense(idExpense, nameExpense, money, wallet, time, note));
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
        preparedStatement.setInt(5, expense.getWallet_id());
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