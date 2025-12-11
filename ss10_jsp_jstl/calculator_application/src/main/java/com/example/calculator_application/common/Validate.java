package com.example.calculator_application.common;

public class Validate {
    public static double inputDouble(String number) throws Exception {
        double result;
        try {
            result = Double.parseDouble(number);
        } catch (NumberFormatException e) {
            throw new Exception("Phần tử nhập vào phải là sô");
        }
        return result;
    }

    public static void checkEmpty(String a, String b) throws Exception {
        if (a == null || a.trim().isEmpty() || b == null || b.trim().isEmpty()) {
            throw new Exception("Phép tính không được để trống");
        }
    }

    public static void checkDivideByZero(double b, String operator) throws Exception {
        if ("div".equals(operator) && b == 0) {
            throw new Exception("Không chia được cho 0");
        }
    }
}
