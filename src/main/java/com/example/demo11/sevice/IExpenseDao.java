package com.example.demo11.sevice;

import com.example.demo11.model.Expense;

import java.sql.SQLException;
import java.util.List;

public interface IExpenseDao  {

        void findByNoteContainingIgnoreCase(int idExpense) throws SQLException, ClassNotFoundException;
    }

