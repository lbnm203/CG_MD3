package com.example.test_jstl_lib;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

@WebServlet(name = "customerServlet", value = "/customer-servlet")
public class CustomerServlet extends HttpServlet {
    @Override
    protected void doGet(javax.servlet.http.HttpServletRequest request, javax.servlet.http.HttpServletResponse response) throws ServletException, IOException {
        List<Customer> list = new ArrayList<>();
        list.add(new Customer("Mai Văn Hoàn", "1983-08-20", "Hà Nội", "./image/bananajoe.png"));
        list.add(new Customer("Nguyễn Văn Nam", "1983-08-21", "Bắc Giang", "./image/Darwinregplisss.png"));
        list.add(new Customer("Nguyễn Thái Hòa", "1983-08-22", "Nam Định", "./image/gumball.png"));
        list.add(new Customer("Trần Đăng Khoa", "1983-08-17", "Hà Tây", "./image/Richard.png"));
        list.add(new Customer("Nguyễn Đình Thi", "1983-08-19", "Hà Nội", "./image/bananajoe.png"));

        request.setAttribute("customers", list);
        request.getRequestDispatcher("/index.jsp").forward(request, response);
    }
}
