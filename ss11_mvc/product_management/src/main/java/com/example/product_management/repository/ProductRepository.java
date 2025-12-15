package com.example.product_management.repository;

import com.example.product_management.entity.Product;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.time.LocalDate;
import java.util.ArrayList;
import java.util.List;

public class ProductRepository {

    public List<Product> findAll() {
        List<Product> products = new ArrayList<>();
        try {
            PreparedStatement preparedStatement =
                    BaseRepository.getConnection().prepareStatement("select id, product_name, product_price, product_description, manufacturer from products");
            ResultSet resultSet = preparedStatement.executeQuery();
            while (resultSet.next()) {
                int id = resultSet.getInt("id");
                String name = resultSet.getString("product_name");
                double price = resultSet.getDouble("product_price");
                String description = resultSet.getString("product_description");
                String manufacturer = resultSet.getString("manufacturer");
                Product product = new Product(id, name, price, description, manufacturer);
                products.add(product);
            }
        } catch (SQLException e) {
            e.printStackTrace();
            return new ArrayList<>();
        }
        return products;
    }

    public boolean save(Product product) {
        try {
            PreparedStatement preparedStatement =
                    BaseRepository.getConnection().prepareStatement(
                            "INSERT INTO products (product_name, product_price, product_description, manufacturer) VALUES (?, ?, ?, ?)");
            preparedStatement.setString(1, product.getName());
            preparedStatement.setDouble(2, product.getPrice());
            preparedStatement.setString(3, product.getDescription());
            preparedStatement.setString(4, product.getManufacturer());
            int rowsAffected = preparedStatement.executeUpdate();
            return rowsAffected > 0;
        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        }
    }

    public List<Product> searchProduct(String keyword) {
        List<Product> products = new ArrayList<>();
        try {
            PreparedStatement preparedStatement =
                    BaseRepository.getConnection().prepareStatement(
                            "SELECT id, product_name, product_price, product_description, manufacturer " +
                            "FROM products WHERE product_name LIKE ?");
            preparedStatement.setString(1, "%" + keyword + "%");
            ResultSet resultSet = preparedStatement.executeQuery();
            while (resultSet.next()) {
                int id = resultSet.getInt("id");
                String name = resultSet.getString("product_name");
                double price = resultSet.getDouble("product_price");
                String description = resultSet.getString("product_description");
                String manufacturer = resultSet.getString("manufacturer");
                Product product = new Product(id, name, price, description, manufacturer);
                products.add(product);
            }
        } catch (SQLException e) {
            e.printStackTrace();
            return new ArrayList<>();
        }
        return products;
    }

    public boolean delete(Integer id) {
        try {
            PreparedStatement preparedStatement =
                    BaseRepository.getConnection().prepareStatement("DELETE FROM products WHERE id = ?");
            preparedStatement.setInt(1, id);
            int rowsAffected = preparedStatement.executeUpdate();
            return rowsAffected > 0;
        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        }
    }

    public Product findById(Integer id) {
        try {
            PreparedStatement preparedStatement =
                    BaseRepository.getConnection().prepareStatement(
                            "SELECT id, product_name, product_price, product_description, manufacturer " +
                            "FROM products WHERE id = ?");
            preparedStatement.setInt(1, id);
            ResultSet resultSet = preparedStatement.executeQuery();
            if (resultSet.next()) {
                String name = resultSet.getString("product_name");
                double price = resultSet.getDouble("product_price");
                String description = resultSet.getString("product_description");
                String manufacturer = resultSet.getString("manufacturer");
                return new Product(id, name, price, description, manufacturer);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return null;
    }

    public boolean update(Product product) {
        try {
            PreparedStatement preparedStatement =
                    BaseRepository.getConnection().prepareStatement(
                            "UPDATE products SET product_name=?, product_price=?, product_description=?, manufacturer=? WHERE id=?");
            preparedStatement.setString(1, product.getName());
            preparedStatement.setDouble(2, product.getPrice());
            preparedStatement.setString(3, product.getDescription());
            preparedStatement.setString(4, product.getManufacturer());
            preparedStatement.setInt(5, product.getId());
            int rowsAffected = preparedStatement.executeUpdate();
            return rowsAffected > 0;
        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        }
    }
}
