package com.example.bai_tap.repository;

import com.example.bai_tap.model.Product;

import java.util.List;

public interface IProductRepository {
    List<Product> showList();

    void addNewProduct(Product product);

    void updateProduct(Product product);

    void deleteProduct(int id);

    Product findByName(String name);
}
