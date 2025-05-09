package com.example.myapp.service;

import java.awt.image.BufferedImage;
import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.nio.file.StandardCopyOption;
import java.time.LocalDateTime;
import java.util.UUID;

import javax.imageio.ImageIO;

import org.apache.poi.ss.usermodel.Cell;
import org.apache.poi.ss.usermodel.Row;
import org.apache.poi.ss.usermodel.Sheet;
import org.apache.poi.ss.usermodel.Workbook;
import org.apache.poi.xssf.usermodel.XSSFWorkbook;
import org.imgscalr.Scalr;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.example.myapp.dao.ProductRepository;
import com.example.myapp.dto.Product;

@Service
public class ProductService {

private static final Logger logger = LoggerFactory.getLogger(ProductService.class);

@Autowired
private ProductRepository productRepository;

@Value("${file.upload-dir}")
private String uploadDir;

private static final String BASE_DIRECTORY = "F:/dev_0420_009/dev/workspace/Boot-Employees REST API4";
private static final String UPLOAD_PATH = "C:/uploads/images/";

public void processExcelFile(MultipartFile excelFile) throws IOException {
    try (Workbook workbook = new XSSFWorkbook(excelFile.getInputStream())) {
        Sheet sheet = workbook.getSheetAt(0);
        for (Row row : sheet) {
            processRow(row);
        }
    }
}

private void processRow(Row row) throws IOException {
    String productId = UUID.randomUUID().toString();
    String productName = getCellValue(row.getCell(0));
    long unitPrice = getNumericCellValue(row.getCell(1));
    String description = getCellValue(row.getCell(2));
    String manufacturer = getCellValue(row.getCell(3));
    String category = getCellValue(row.getCell(4));
    int unitsInStock = (int) getNumericCellValue(row.getCell(5));
    String condition = getCellValue(row.getCell(6));
    String imagePath = getCellValue(row.getCell(7));

    String resolvedImagePath = resolveImagePath(imagePath);
    Path sourcePath = Paths.get(resolvedImagePath);
    if (!Files.exists(sourcePath)) {
        logger.warn("Image not found: {}", resolvedImagePath);
        return;
    }

    String randomFileName = UUID.randomUUID().toString() + "_" + imagePath;
    Path destinationPath = Paths.get(uploadDir, randomFileName);
    Files.createDirectories(destinationPath.getParent());
    Files.copy(sourcePath, destinationPath, StandardCopyOption.REPLACE_EXISTING);

    Path thumbnailPath = Paths.get(uploadDir, "thumb_" + randomFileName);
    createThumbnail(destinationPath, thumbnailPath);

    saveProduct(productId, productName, unitPrice, description, manufacturer, category, unitsInStock, condition, randomFileName);
}

private void saveProduct(String productId, String name, long price, String description, String manufacturer, String category, int stock, String condition, String fileName) {
    Product product = new Product();
    product.setProductId(productId);
    product.setProductName(name);
    product.setUnitPrice(price);
    product.setDescription(description);
    product.setManufacturer(manufacturer);
    product.setCategory(category);
    product.setUnitsInStock(stock);
    product.setCondition(condition);
    product.setFilename(fileName);
    //20250510 등록일 수정일 추가
    product.setCreatedAt(LocalDateTime.now());
    product.setUpdatedAt(LocalDateTime.now());  // 삽입 시에도 초기화   
    productRepository.addProduct(product);
}

private String resolveImagePath(String imagePath) {
    if (imagePath == null || imagePath.isEmpty()) return "";
    Path path = Paths.get(UPLOAD_PATH, imagePath);
    return path.toString();
}

private void createThumbnail(Path sourcePath, Path thumbnailPath) throws IOException {
    BufferedImage originalImage = ImageIO.read(sourcePath.toFile());
    BufferedImage thumbnail = Scalr.resize(originalImage, Scalr.Method.QUALITY, Scalr.Mode.FIT_TO_WIDTH, 100);
    ImageIO.write(thumbnail, "png", thumbnailPath.toFile());
}

private String getCellValue(Cell cell) {
    if (cell == null) return "";
    return switch (cell.getCellType()) {
        case STRING -> cell.getStringCellValue();
        case NUMERIC -> String.valueOf((long) cell.getNumericCellValue());
        default -> "";
    };
}

private long getNumericCellValue(Cell cell) {
    if (cell == null) return 0;
    try {
        return (long) cell.getNumericCellValue();
    } catch (Exception e) {
        logger.warn("Invalid number format: {}", cell.toString());
        return 0;
    }
}

}