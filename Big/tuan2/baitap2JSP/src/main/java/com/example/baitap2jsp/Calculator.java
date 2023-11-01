package com.example.baitap2jsp;

public class Calculator {
    private Double number1;
    private Double number2;

    public Calculator(Double number1, Double number2) {
        this.number1 = number1;
        this.number2 = number2;
    }

    public Calculator() {
    }

    public Double getNumber1() {
        return number1;
    }

    public void setNumber1(Double number1) {
        this.number1 = number1;
    }

    public Double getNumber2() {
        return number2;
    }

    public void setNumber2(Double number2) {
        this.number2 = number2;
    }
    public Double nhan(Double number1, Double number2){
        return number1*number2;
    }
    public Double chia(Double number1,Double number2){
        return number1/number2;
    }
    public Double cong(Double number1,Double number2){
        return number1+number2;
    }
    public Double tru(Double number1,Double number2){
        return number1-number2;
    }

}
