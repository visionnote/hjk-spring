package com.example.myapp.dao;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.example.myapp.dto.Product;
import com.example.myapp.mapper.ProductMapper;

@Repository
public class ProductRepository {

    @Autowired
    private ProductMapper productMapper;

    public void addProduct(Product product) {
        productMapper.insertProduct(product);
    }

    public List<Product> getAllProducts() {
        return productMapper.getAllProducts();
    }

    public Product getProductById(String productId) {
        return productMapper.getProductById(productId);
    }

    public void deleteProduct(String productId) {
        productMapper.deleteProduct(productId);
    }

	public void updateProduct(Product product) {
		// TODO Auto-generated method stub
        productMapper.updateProduct(product);

	}
}

