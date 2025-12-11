package com.example.product_discount_calculator;

public class Validate {
    public static boolean inputString(String input) {
        return !(input.isEmpty());
    }

    public static boolean inputDiscount(String number) {
        double result;
        try {
            result = Double.parseDouble(number);
        } catch (NumberFormatException e) {
            return false;
        }
        return !(result < 0 || result > 100);
    }

    public static boolean inputPrice(String number) {
        double result;
        try {
            result = Double.parseDouble(number);
        } catch (NumberFormatException e) {
            return false;
        }
        return !(result <= 0 || result >= Double.MAX_VALUE);
    }
}
