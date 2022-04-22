package model.service;

import model.bean.Product;

import java.util.List;

public interface ProductService {

    public List<Product> selectAllProduct();

    public List<String> createProduct(Product product);

    public boolean deleteProduct(int id);

    public boolean editProduct(Product product);

    Product selectProductById(int id);
}
