package com.example.demo11.model;

import java.util.Date;

public class User {

    private int id;
    private String fullName;
    private String userName;
    private String password;
    private String email;
    private String gender;
    private String image;

    private Date birthdate;
    private int phoneNumber;

    public User(int id, String fullName, String email, Date birthdate, String gender, int phoneNumber, String image) {
        this.id= id;
        this.fullName = fullName;
        this.email = email;
        this.gender = gender;
        this.image = image;
        this.birthdate = birthdate;
        this.phoneNumber = phoneNumber;
    }

    public User(String password) {
        this.password = password;

    }

    public User() {

    }

    public String getImage() {
        return image;
    }

    public void setImage(String image) {
        this.image = image;
    }

    public User( String fullName, String userName, String password, String email, String gender, String image, Date birthdate, int phoneNumber) {
        this.fullName = fullName;
        this.userName = userName;
        this.password = password;
        this.email = email;
        this.gender = gender;
        this.image = image;
        this.birthdate = birthdate;
        this.phoneNumber = phoneNumber;
    }

    public User(String fullName, String userName, String password, String gender, Date birthdate, int phoneNumber) {
        this.fullName = fullName;
        this.userName = userName;
        this.password = password;
        this.gender = gender;
        this.birthdate = birthdate;
        this.phoneNumber = phoneNumber;
    }

    public User(String fullName, String userName, String password, String email, String gender, Date birthdate, int phoneNumber) {
        this.fullName = fullName;
        this.userName = userName;
        this.password = password;
        this.email = email;
        this.gender = gender;
        this.birthdate = birthdate;
        this.phoneNumber = phoneNumber;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getFullName() {
        return fullName;
    }

    public void setFullName(String fullName) {
        this.fullName = fullName;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getUserName() {
        return userName;
    }

    public void setUserName(String userName) {
        this.userName = userName;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }


    public String getGender() {
        return gender;
    }

    public void setGender(String gender) {
        this.gender = gender;
    }

    public Date getBirthdate() {
        return birthdate;
    }

    public void setBirthdate(Date birthdate) {
        this.birthdate = birthdate;
    }

    public int getPhoneNumber() {
        return phoneNumber;
    }

    public void setPhoneNumber(int phoneNumber) {
        this.phoneNumber = phoneNumber;
    }
}
