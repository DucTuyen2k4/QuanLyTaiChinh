package com.example.demo11.model;

public class Wallet {
    private int idWallet;
    private String icon ;
    private String nameWallet ;
    private double money;
    private String currency;
    private String description ;


    public Wallet(int idWallet ,String icon, String nameWallet, Double money, String currency, String description) {
        this.idWallet = idWallet;
        this.icon = icon;
        this.nameWallet = nameWallet ;
        this.money = money;
        this.currency = currency;
        this.description = description;
    }

    public Wallet(String icon, String nameWallet, Double money, String currency, String description) {
        this.icon = icon;
        this.nameWallet = nameWallet ;
        this.money = money;
        this.currency = currency;
        this.description = description;
    }

    public Wallet(int idWallet) {
        this.idWallet = idWallet;
    }

    public int getIdWallet() {
        return idWallet;
    }

    public void setIdWallet(int idWallet) {
        this.idWallet = idWallet;
    }

    public String getIcon() {
        return icon;
    }

    public void setIcon(String icon) {
        this.icon = icon;
    }

    public String getNameWallet() {
        return nameWallet;
    }

    public void setNameWallet(String nameWallet) {
        this.nameWallet = nameWallet;
    }

    public double getMoney() {
        return money;
    }

    public void setMoney(double money) {
        this.money = money;
    }

    public String getCurrency() {
        return currency;
    }

    public void setCurrency(String currency) {
        this.currency = currency;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }
}