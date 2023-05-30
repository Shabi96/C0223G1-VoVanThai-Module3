package com.example.bai_2;

public class Calculator {
    public static float calculator(float firstOperand, float secondOperand, String operator) {
        switch (operator) {
            case "Addition":
                return firstOperand + secondOperand;
            case "Subtraction":
                return firstOperand - secondOperand;
            case "Division":
                try {
                    return firstOperand / secondOperand;
                } catch (ArithmeticException arithmeticException) {
                    arithmeticException.printStackTrace();
                }
            case "Multiplication":
                return firstOperand * secondOperand;
            default:
                throw new RuntimeException("Invalid operation");
        }
    }
}
