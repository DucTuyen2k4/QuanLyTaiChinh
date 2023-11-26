package com.example.demo11.model;

public class Revenue {
    private int idRevenue ;
    private String nameRevenue ;
    private String time;
    private double money ;
    private String note;
    private String nameWallet;

    public String getNameWallet() {
        return nameWallet;
    }

    public void setNameWallet(String nameWallet) {
        this.nameWallet = nameWallet;
    }

    public Revenue(int idRevenue, String nameRevenue, double money, String time, String note, String nameWallet) {
        this.idRevenue = idRevenue;
        this.nameRevenue = nameRevenue;
        this.time = time;
        this.money = money;
        this.note = note;
        this.nameWallet = nameWallet;
    }

    public Revenue(String nameRevenue, String time, double money, String note) {
        this.nameRevenue = nameRevenue;
        this.time = time;
        this.money = money;
        this.note = note;
    }

    public int getIdRevenue() {
        return idRevenue;
    }

    public void setIdRevenue(int idRevenue) {
        this.idRevenue = idRevenue;
    }

    public String getNameRevenue() {
        return nameRevenue;
    }

    public void setNameRevenue(String nameRevenue) {
        this.nameRevenue = nameRevenue;
    }

    public String getTime() {
        return time;
    }

    public void setTime(String time) {
        this.time = time;
    }

    public double getMoney() {
        return money;
    }

    public void setMoney(double money) {
        this.money = money;
    }

    public String getNote() {
        return note;
    }

    public void setNote(String note) {
        this.note = note;
    }
}
