package com.example.demo11.model;

public class Expense {
    private int idExpense;

    private String nameExpense;
    private double money;
    private String time;
    private String note;
    private int idWallet;

    public int getIdWallet() {
        return idWallet;
    }

    public void setIdWallet(int idWallet) {
        this.idWallet = idWallet;
    }

    public Expense(String nameExpense, double money, String time, String note, int idWallet) {
        this.nameExpense = nameExpense;
        this.money = money;
        this.time = time;
        this.note = note;
        this.idWallet = idWallet;
    }

    public Expense(int idExpense, String nameExpense, double money, String time, String note, int idWallet) {
        this.idExpense = idExpense;
        this.nameExpense = nameExpense;
        this.money = money;
        this.time = time;
        this.note = note;
        this.idWallet = idWallet;
    }

    public Expense(int idExpense, String nameExpense, double money, String time, String note) {
        this.idExpense = idExpense;
        this.nameExpense = nameExpense;
        this.money = money;
        this.time = time;
        this.note = note;
    }

    public Expense(String nameExpense, double money, String time, String note) {
        this.nameExpense = nameExpense;
        this.money = money;
        this.time = time;
        this.note = note;
    }

    public Expense() {
    }

    public Expense(int idExpense) {
        this.idExpense = idExpense;

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

    public double getMoney() {
        return money;
    }

    public void setMoney(double money) {
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