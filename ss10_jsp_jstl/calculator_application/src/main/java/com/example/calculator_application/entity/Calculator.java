package com.example.calculator_application.entity;

public class Calculator {
    public static double calculate(double a, double b, String operator) {
        switch (operator) {
            case "add":
                return a + b;
            case "sub":
                return a - b;
            case "mul":
                return a * b;
            case "div":
                return a / b;
            default:
                throw new IllegalArgumentException("Invalid operator.");
        }
    }
}
