package com.example.product_management.service;

import com.example.product_management.entity.Product;

import java.util.List;

public interface IProductService {
    List<Product> findAll();
    boolean save(Product product);
    void delete(Integer id);
    void update(Product product);
    Product findById(Integer id);
    List<Product> search(String keyword);

}
