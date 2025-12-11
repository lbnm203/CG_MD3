package com.example.product_discount_calculator;

import java.io.*;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.*;
import javax.servlet.annotation.*;

@WebServlet(name = "displayDiscount", value = "/display-discount")
public class DiscountServlet extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");

        String productDesciption = request.getParameter("productDescription");
        String inputPrice = request.getParameter("listPrice");
        String inputDiscount = request.getParameter("discountPercent");

        if (!Validate.inputString(productDesciption)) {
            request.setAttribute("message", "Product description cannot be empty");
            request.getRequestDispatcher("/index.jsp").forward(request, response);
        }

        if (!Validate.inputPrice(inputPrice)) {
            request.setAttribute("message", "Product Price is not valid");
            request.getRequestDispatcher("/index.jsp").forward(request, response);
        }

        if (!Validate.inputDiscount(inputDiscount)) {
            request.setAttribute("message", "Discount is not valid");
            request.getRequestDispatcher("/index.jsp").forward(request, response);
        }


        double listPrice = Double.parseDouble(inputPrice);
        double discountPercent = Double.parseDouble(inputDiscount);

        double discountAmount = listPrice * discountPercent * 0.01;
        double discountPrice = listPrice - discountAmount;

        request.setAttribute("productDescription", productDesciption);
        request.setAttribute("listPrice", listPrice);
        request.setAttribute("discountPercent", discountPercent);
        request.setAttribute("discountAmount", discountAmount);
        request.setAttribute("discountPrice", discountPrice);

        request.getRequestDispatcher("/display-discount.jsp").forward(request, response);
    }
}