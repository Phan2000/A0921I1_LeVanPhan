package model.service;

import model.bean.Product;

import java.sql.SQLException;
import java.util.List;

public interface ProductService {

    public void insertProduct(Product product) throws SQLException;

    public Product selectProduct(int id);

    public List<Product> selectAllProduct();
}
