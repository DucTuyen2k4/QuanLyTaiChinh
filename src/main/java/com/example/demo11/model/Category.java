package com.example.demo11.model;


public class Category {
    private int idCategory;
    private String nameCategory;
    private String note;

    public Category(int idCategory, String nameCategory, String note) {
        this.idCategory = idCategory;
        this.nameCategory = nameCategory;
        this.note = note;
    }

    public Category(){

    }

    public Category(String nameCategory, String note) {
        this.nameCategory = nameCategory;
        this.note = note;
    }

    public Category(int idCategory) {
        this.idCategory = idCategory;
    }

    public Category(String nameCategory) {
        this.nameCategory = nameCategory;
    }

    public int getIdCategory() {
        return idCategory;
    }

    public void setIdCategory(int idCategory) {
        this.idCategory = idCategory;
    }

    public String getNameCategory() {
        return nameCategory;
    }

    public void setNameCategory(String nameCategory) {
        this.nameCategory = nameCategory;
    }

    public String getNote() {
        return note;
    }

    public void setNote(String note) {
        this.note = note;
    }
}