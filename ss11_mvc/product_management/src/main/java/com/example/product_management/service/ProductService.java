package com.example.product_management.service;

import com.example.product_management.entity.Product;
import com.example.product_management.repository.ProductRepository;

import java.util.List;

public class ProductService implements IProductService{

    private ProductRepository productRepository = new ProductRepository();

    @Override
    public List<Product> findAll() {
        return productRepository.findAll();
    }

    @Override
    public boolean save(Product product) {
        return productRepository.save(product);
    }

    @Override
    public void delete(Integer id) {
        productRepository.delete(id);
    }

    @Override
    public void update(Product product) {
        productRepository.update(product);
    }

    @Override
    public Product findById(Integer id) {
        return productRepository.findById(id);
    }

    @Override
    public List<Product> search(String keyword) {
        return productRepository.searchProduct(keyword);
    }


}
