package com.example.myapp.dao;

import com.example.myapp.dto.Product;
import org.springframework.stereotype.Repository;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

@Repository
public class ProductRepository {
	
	private static ProductRepository instance = new ProductRepository();

	public static ProductRepository getInstance() {
	        return instance;
	}
	
    private Map<String, Product> productMap = new HashMap<>();

    public ProductRepository() {
        // 테스트용 더미 데이터
        Product product1 = new Product("P1234", "노트북", 1500000);
        product1.setDescription("고성능 노트북입니다.");
        product1.setCategory("컴퓨터");
        product1.setManufacturer("삼성");
        product1.setUnitsInStock(100);
        product1.setFilename("P1235.png");

        Product product2 = new Product("P1235", "태블릿", 800000);
        product2.setDescription("가벼운 휴대용 태블릿입니다.");
        product2.setCategory("태블릿");
        product2.setManufacturer("애플");
        product2.setUnitsInStock(50);
        product2.setFilename("P1236.png");

        productMap.put(product1.getProductId(), product1);
        productMap.put(product2.getProductId(), product2);
    }

    public ArrayList<Product> getAllProducts() {
        return new ArrayList<>(productMap.values());
    }

    public Product getProductById(String productId) {
        return productMap.get(productId);
    }

    public void addProduct(Product product) {
        productMap.put(product.getProductId(), product);
    }

    public void deleteProduct(String productId) {
        productMap.remove(productId); // 실제 삭제 구현
    }
}
