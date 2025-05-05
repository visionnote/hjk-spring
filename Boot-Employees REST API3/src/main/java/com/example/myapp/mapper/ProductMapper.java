package com.example.myapp.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Select;

import com.example.myapp.dto.Product;

@Mapper
public interface ProductMapper {

    @Insert("INSERT INTO product " +
            "(product_id, product_name, unit_price, description, manufacturer, category, units_in_stock, condition, filename) " +
            "VALUES (#{productId}, #{productName}, #{unitPrice}, #{description}, #{manufacturer}, #{category}, #{unitsInStock}, #{condition}, #{filename})")
    void insertProduct(Product product);

    @Select("SELECT product_id AS productId, product_name AS productName, unit_price AS unitPrice, " +
            "description, manufacturer, category, units_in_stock AS unitsInStock, " +
            "condition, filename FROM product")
    List<Product> getAllProducts();

    @Select("SELECT product_id AS productId, product_name AS productName, unit_price AS unitPrice, " +
            "description, manufacturer, category, units_in_stock AS unitsInStock, " +
            "condition, filename FROM product WHERE product_id = #{productId}")
    Product getProductById(String productId);

    @Delete("DELETE FROM product WHERE product_id = #{productId}")
    void deleteProduct(String productId);
}
