package com.example.myapp.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

import com.example.myapp.dto.Product;

@Mapper
public interface ProductMapper {

	@Insert("INSERT INTO product (product_id, product_name, unit_price, description, manufacturer, category, units_in_stock, condition, filename, created_at, updated_at) " +
	        "VALUES (#{productId}, #{productName}, #{unitPrice}, #{description}, #{manufacturer}, #{category}, #{unitsInStock}, #{condition}, #{filename, jdbcType=VARCHAR}, #{createdAt}, #{updatedAt})")
	void insertProduct(Product product);

	@Select("SELECT product_id AS productId, product_name AS productName, unit_price AS unitPrice, " +
	        "description, manufacturer, category, units_in_stock AS unitsInStock, " +
	        "condition, filename, created_at AS createdAt, updated_at AS updatedAt FROM product")
    List<Product> getAllProducts();

	@Select("SELECT product_id AS productId, product_name AS productName, unit_price AS unitPrice, " +
	        "description, manufacturer, category, units_in_stock AS unitsInStock, " +
	        "condition, filename, created_at AS createdAt, updated_at AS updatedAt FROM product WHERE product_id = #{productId}")
    Product getProductById(String productId);

    @Delete("DELETE FROM product WHERE product_id = #{productId}")
    void deleteProduct(String productId);
    
    @Update("UPDATE product SET product_name=#{productName}, unit_price=#{unitPrice}, " +
            "description=#{description}, manufacturer=#{manufacturer}, category=#{category}, " +
            "units_in_stock=#{unitsInStock}, condition=#{condition}, filename=#{filename}, " +
            "updated_at=#{updatedAt} " +
            "WHERE product_id=#{productId}")
    void updateProduct(Product product);

    //20250509 페이징 처리를 위해 추가함
    //20250509 수정 최신 순으로 보여줌
    @Select("SELECT product_id AS productId, product_name AS productName, unit_price AS unitPrice, " +
            "description, manufacturer, category, units_in_stock AS unitsInStock, " +
            "condition, filename, created_at AS createdAt, updated_at AS updatedAt " +
            "FROM product " +
            "ORDER BY updatedAt desc OFFSET #{offset} ROWS FETCH NEXT #{size} ROWS ONLY")
    List<Product> getProductsByPage(int offset, int size);

}
