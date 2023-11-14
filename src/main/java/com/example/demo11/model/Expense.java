package com.example.demo11.model;

public class Expense {
    private int idExpense;

    private String nameExpense;
    private String money;
    private String time;
    private String note;

    public Expense(int idExpense, String nameExpense, String money, String time, String note) {
        this.idExpense = idExpense;
        this.nameExpense = nameExpense;
        this.money = money;
        this.time = time;
        this.note = note;
    }

    public Expense(String nameExpense, String money, String time, String note) {
        this.nameExpense = nameExpense;
        this.money = money;
        this.time = time;
        this.note = note;
    }

    public Expense() {
    }

    public int getIdExpense() {
        return idExpense;
    }

    public void setIdExpense(int idExpense) {
        this.idExpense = idExpense;
    }

    public String getNameExpense() {
        return nameExpense;
    }

    public void setNameExpense(String nameExpense) {
        this.nameExpense = nameExpense;
    }

    public String getMoney() {
        return money;
    }

    public void setMoney(String money) {
        this.money = money;
    }

    public String getTime() {
        return time;
    }

    public void setTime(String time) {
        this.time = time;
    }

    public String getNote() {
        return note;
    }

    public void setNote(String note) {
        this.note = note;
    }
}
