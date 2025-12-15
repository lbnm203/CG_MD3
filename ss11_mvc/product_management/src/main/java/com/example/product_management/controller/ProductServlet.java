package com.example.product_management.controller;

import com.example.product_management.entity.Product;
import com.example.product_management.service.IProductService;
import com.example.product_management.service.ProductService;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet(name = "productServlet", value = "/product-servlet")
public class ProductServlet extends HttpServlet {

    private IProductService productService = new ProductService();

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.setCharacterEncoding("UTF-8");
        String action = req.getParameter("action");
        
        if (action == null) {
            action = "";
        }
        
        switch (action) {
            case "create":
                req.getRequestDispatcher("/WEB-INF/product/create.jsp").forward(req, resp);
                break;
            case "delete":
                Integer deleteId = Integer.parseInt(req.getParameter("id"));
                productService.delete(deleteId);
                resp.sendRedirect(req.getContextPath() + "/product-servlet");
                break;
            case "edit":
                Integer editId = Integer.parseInt(req.getParameter("id"));
                Product product = productService.findById(editId);
                req.setAttribute("product", product);
                req.getRequestDispatcher("/WEB-INF/product/edit.jsp").forward(req, resp);
                break;
            case "search":
                String keyword = req.getParameter("keyword");
                if (keyword == null || keyword.trim().isEmpty()) {
                    req.setAttribute("products", productService.findAll());
                } else {
                    req.setAttribute("products", productService.search(keyword));
                    req.setAttribute("keyword", keyword);
                }
                req.getRequestDispatcher("/WEB-INF/product/list.jsp").forward(req, resp);
                break;
            default:
                req.setAttribute("products", productService.findAll());
                req.getRequestDispatcher("/WEB-INF/product/list.jsp").forward(req, resp);
                break;
        }
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.setCharacterEncoding("UTF-8");
        String action = req.getParameter("action");

        if (action == null) {
            action = "";
        }

        switch (action) {
            case "create":
//                Integer id = Integer.parseInt(req.getParameter("id"));
                String name = req.getParameter("name");
                Double price = Double.parseDouble(req.getParameter("price"));
                String description = req.getParameter("description");
                String manufacturer = req.getParameter("manufacturer");
//                Product product = new Product(id, name, price, description, manufacturer);
                Product product = new Product(name, price, description, manufacturer);
                productService.save(product);
                resp.sendRedirect(req.getContextPath() + "/product-servlet");
                break;
            case "update":
                Integer updateId = Integer.parseInt(req.getParameter("id"));
                String updateName = req.getParameter("name");
                Double updatePrice = Double.parseDouble(req.getParameter("price"));
                String updateDescription = req.getParameter("description");
                String updateManufacturer = req.getParameter("manufacturer");
                Product updateProduct = new Product(updateId, updateName, updatePrice, updateDescription, updateManufacturer);
                productService.update(updateProduct);
                resp.sendRedirect(req.getContextPath() + "/product-servlet");
                break;
            case "delete":
                Integer productId = Integer.parseInt(req.getParameter("id"));
                productService.delete(productId);
                resp.sendRedirect(req.getContextPath() + "/product-servlet");
                break;
            default:
                resp.sendRedirect(req.getContextPath() + "/product-servlet");
                break;
        }
    }
    
}
