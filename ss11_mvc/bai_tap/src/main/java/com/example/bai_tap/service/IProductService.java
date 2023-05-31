package com.example.bai_tap.service;

import com.example.bai_tap.model.Product;

import javax.servlet.http.HttpServletRequest;
import java.util.List;

public interface IProductService {
    List<Product> showList();

    void addNewProduct(HttpServletRequest request);

    Product findById(int id);

    void editProduct(HttpServletRequest request);

    void deleteById(int id);

    void findByName(HttpServletRequest request);
}
