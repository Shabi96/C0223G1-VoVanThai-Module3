package com.example.bai_tap.repository;

import com.example.bai_tap.model.Product;

import java.util.ArrayList;
import java.util.List;

public class ProductRepository implements IProductRepository {
    private static List<Product> productList = new ArrayList<>();

    static {
        productList.add(new Product(1, "Car", "3000", "Thể thao", "BMW"));
        productList.add(new Product(2, "Computer", "2000", "GAMING", "DELL"));
        productList.add(new Product(3, "TV", "1000", "VIP", "LG"));
    }

    @Override
    public List<Product> showList() {
        return productList;
    }

    @Override
    public void addNewProduct(Product product) {
        productList.add(product);
    }

    @Override
    public void updateProduct(Product product) {
        for (int i = 0; i < productList.size(); i++) {
            if (productList.get(i).getId() == product.getId()) {
                productList.set(i, product);
            }
        }
    }

    @Override
    public void deleteProduct(int id) {
        for (int i = 0; i < productList.size(); i++) {
            if (id == productList.get(i).getId()) {
                productList.remove(i);
                break;
            }
        }
    }

    @Override
    public Product findByName(String name) {
        for (Product product : productList) {
            if (product.getName().contains(name)) {
                return product;
            }
        }
        return null;
    }


}
