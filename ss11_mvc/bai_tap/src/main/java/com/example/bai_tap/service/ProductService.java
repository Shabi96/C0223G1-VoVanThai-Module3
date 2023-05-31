package com.example.bai_tap.service;

import com.example.bai_tap.model.Product;
import com.example.bai_tap.repository.ProductRepository;

import javax.servlet.http.HttpServletRequest;
import java.util.List;

public class ProductService implements IProductService {
    private ProductRepository productRepository = new ProductRepository();

    @Override
    public List<Product> showList() {
        return productRepository.showList();
    }

    @Override
    public void addNewProduct(HttpServletRequest request) {
        int id = Integer.parseInt(request.getParameter("idProduct"));
        String name = request.getParameter("nameProduct");
        String price = request.getParameter("price");
        String describe = request.getParameter("describe");
        String producer = request.getParameter("producer");
        productRepository.addNewProduct(new Product(id, name, price, describe, producer));
    }

    @Override
    public Product findById(int id) {
        List<Product> products = productRepository.showList();
        for (Product product : products) {
            if (id == product.getId()) {
                return product;
            }
        }
        return null;
    }

    @Override
    public void editProduct(HttpServletRequest request) {
        int id = Integer.parseInt(request.getParameter("idProduct"));
        String name = request.getParameter("nameProduct");
        String price = request.getParameter("price");
        String describe = request.getParameter("describe");
        String producer = request.getParameter("producer");
        Product product = new Product(id, name, price, describe, producer);
        productRepository.updateProduct(product);
    }

    @Override
    public void deleteById(int id) {
        productRepository.deleteProduct(id);
    }

    @Override
    public void findByName(HttpServletRequest request) {

    }
}
