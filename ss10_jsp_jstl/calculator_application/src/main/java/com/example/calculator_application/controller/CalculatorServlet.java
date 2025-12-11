package com.example.calculator_application.controller;


import com.example.calculator_application.common.Validate;
import com.example.calculator_application.entity.Calculator;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet(name = "calculatorServlet", value = "/calculator-servlet")
public class CalculatorServlet extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.setCharacterEncoding("UTF-8");

        String aDefault = req.getParameter("first-value");
        String bDefault = req.getParameter("second-value");
        String operator = req.getParameter("operator");

        try {
            Validate.checkEmpty(aDefault, bDefault);
            double aValue = Validate.inputDouble(aDefault);
            double bValue = Validate.inputDouble(bDefault);

            Validate.checkDivideByZero(bValue, operator);

            double result = Calculator.calculate(aValue, bValue, operator);

            req.setAttribute("aValue", aValue);
            req.setAttribute("bValue", bValue);
            req.setAttribute("operator", getSymbol(operator));
            req.setAttribute("result", result);

        } catch (Exception e) {
            req.setAttribute("error", e.getMessage());
        }

        // Forward to result.jsp to display the result
        req.getRequestDispatcher("/WEB-INF/result.jsp").forward(req, resp);
    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.getRequestDispatcher("/WEB-INF/calculator.jsp").forward(req, resp);
    }


    private String getSymbol(String op) {
        switch (op) {
            case "add": return "+";
            case "sub": return "-";
            case "mul": return "*";
            case "div": return "/";
        }
        return "?";
    }
}
