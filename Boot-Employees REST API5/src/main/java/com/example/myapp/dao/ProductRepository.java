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

    //20250509 페이징 처리를 위해 이 메소드를 주석 처리하고 아래 메소드 추가
//    public List<Product> getAllProducts() {
//        return productMapper.getAllProducts();
//    }

    //20250509 페이징 처리를 위해 getAllProducts()->getProductsByPage(int page, int size) 로 변경
    public List<Product> getProductsByPage(int page, int size) {
        int offset = (page - 1) * size;
        return productMapper.getProductsByPage(offset, size);
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

