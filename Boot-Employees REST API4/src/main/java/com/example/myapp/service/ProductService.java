package com.example.myapp.service;


import com.example.myapp.dao.ProductRepository;
import com.example.myapp.dto.Product;
import java.awt.image.BufferedImage;
import java.io.File;
import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.nio.file.StandardCopyOption;
import java.util.UUID;

import javax.imageio.ImageIO;

import org.apache.poi.ss.usermodel.Cell;
import org.apache.poi.ss.usermodel.CellType;
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





@Service
public class ProductService {

    private static final Logger logger = LoggerFactory.getLogger(ProductService.class);
	
    @Autowired
    private ProductRepository productRepository;

    @Value("${file.upload-dir}")
    private String uploadDir;

    public void processExcelFile(MultipartFile excelFile) throws IOException {
        Workbook workbook = new XSSFWorkbook(excelFile.getInputStream());
        Sheet sheet = workbook.getSheetAt(0);

        for (Row row : sheet) {
        	String productId = UUID.randomUUID().toString();
            String productName = getCellValue(row.getCell(0));
            long unitPrice = getNumericCellValue(row.getCell(1));
            String description = getCellValue(row.getCell(2));
            String manufacturer = getCellValue(row.getCell(3));
            String category = getCellValue(row.getCell(4));
            int unitsInStock = (int) getNumericCellValue(row.getCell(5));
            String condition = getCellValue(row.getCell(6));
            String imagePath = getCellValue(row.getCell(7));

            String randomFileName = "";
            String baseDirectory = "F:/dev_0420_009/dev/workspace/Boot-Employees REST API4";
            String resolvedImagePath = "C:/uploads/images/" + imagePath;

            // 엑셀에서 읽어온 경로를 실제 경로로 매핑
            Path sourcePath = Paths.get(baseDirectory, imagePath);

            System.out.println("Checking file path: " + sourcePath.toString());
            System.out.println("File exists: " + Files.exists(sourcePath));

            if (!Files.exists(sourcePath)) {
                System.err.println("원본 이미지 경로가 존재하지 않습니다: " + imagePath);
            }
         // 파일 복사 예제
            Path source = Paths.get("C:/uploads/images/" + imagePath);
            Path destination = Paths.get(baseDirectory, imagePath);

            try {
                Files.copy(source, destination, StandardCopyOption.REPLACE_EXISTING);
                System.out.println("File copied to: " + destination.toString());
            } catch (IOException e) {
                e.printStackTrace();
            }

            
            
            try {
            	 if (imagePath != null && !imagePath.trim().isEmpty()) {
            		
            		 
            		 
            		 File imageFile = new File(imagePath);
            		 System.out.println("Checking file path: " + imageFile.getAbsolutePath());
            		 System.out.println("File exists: " + imageFile.exists());
          	        String resolvedImagePath1 = resolveImagePath(imagePath);

            		 System.out.println("Checking file path: [" + resolvedImagePath1 + "]");
            		 System.out.println("Absolute Path: " + Paths.get(resolvedImagePath1).toAbsolutePath());
            		 System.out.println("File exists: " + Files.exists(Paths.get(resolvedImagePath1)));
 
            		// 예제: 경로 매핑
            		 String baseDirectory1 = "F:/dev_0420_009/dev/workspace/Boot-Employees REST API4";
            		 String relativePath = resolvedImagePath1.replace("C:/uploads/images", baseDirectory1);

            		 Path sourcePath1 = Paths.get(relativePath);
            		 System.out.println("Mapped Path: " + sourcePath1);
            		 System.out.println("File exists after mapping: " + Files.exists(sourcePath1));
            		 
            		 String cleanedPath = resolvedImagePath1.trim().replace("\\", "/");
            		 Path sourcePath2 = Paths.get(cleanedPath);
            		 System.out.println("Cleaned Path: " + sourcePath2);
            		 System.out.println("File exists after cleaning: " + Files.exists(sourcePath2));
          		 
            		 File folder = new File("C:\\uploads\\images");
            		 File[] files = folder.listFiles();


            		 
               	        if (Files.exists(sourcePath1)) {
            	            //String extension = imagePath.substring(imagePath.lastIndexOf("."));
            	            randomFileName = UUID.randomUUID().toString()+"_"+imagePath;

            	            // 저장 경로
            	            Path imageDestination = Paths.get(uploadDir, randomFileName);
            	            Files.createDirectories(imageDestination.getParent());
            	            Files.copy(sourcePath1, imageDestination, StandardCopyOption.REPLACE_EXISTING);

            	            // 썸네일 생성 경로
            	            String thumbnailFileName = "thumb_" + randomFileName;
            	            Path thumbnailDestination = Paths.get(uploadDir, thumbnailFileName);
            	            createThumbnail(imageDestination, thumbnailDestination);

            	            System.out.println("Image saved at: " + imageDestination.toString());
            	            System.out.println("Thumbnail saved at: " + thumbnailDestination.toString());

            	        } else {
            	            System.err.println("원본 이미지 경로가 존재하지 않습니다: " + resolvedImagePath1);
            	        }

            	    } else {
            	        System.err.println("이미지 경로가 비어있습니다.");
            	    }

            	} catch (IOException e) {
            	    System.err.println("Image copy or thumbnail creation failed: " + e.getMessage());            
            }


            Path sourcePath1 = Paths.get(imagePath);
            if (!Files.exists(sourcePath1)) {
                logger.error("원본 이미지 경로가 존재하지 않습니다: {}", sourcePath1.toString());
                continue; // 현재 row는 건너뛰고 다음 row로 이동
            }
            
            File folder = new File("C:\\uploads\\images");
            File[] files = folder.listFiles();

            System.out.println("Absolute Path: " + sourcePath1.toAbsolutePath());
            System.out.println("File exists: " + Files.exists(sourcePath1));

            
            if (files != null) {
                for (File file : files) {
                    if (file.getName().equalsIgnoreCase("P1236.png")) {
                        sourcePath1 = file.toPath();
                        System.out.println("Resolved Path: " + sourcePath1);
                        break;
                    }
                }
            }

         // 이미지 파일명 추출
            String imageFileName = Paths.get(randomFileName).getFileName().toString();
            Path imageDestination = Paths.get(uploadDir,  imageFileName);
            Path thumbnailDestination = Paths.get(uploadDir, "thumb_" + imageFileName);

            // 경로 출력
            logger.info("원본 이미지 경로: {}", imagePath);
            logger.info("저장될 이미지 경로: {}", imageDestination.toString());
            logger.info("저장될 썸네일 경로: {}", thumbnailDestination.toString());
            
            Product product = new Product();
            product.setProductId(productId);           
            product.setProductName(productName);
            product.setDescription(description);
            product.setUnitPrice(unitPrice);
            product.setManufacturer(manufacturer);
            product.setCategory(category);
            product.setUnitsInStock(unitsInStock);
            product.setCondition(condition);
            product.setFilename(imageFileName);

            productRepository.addProduct(product);
        }
        workbook.close();
    }

    private String getCellValue(Cell cell) {
        if (cell == null) return "";
        return switch (cell.getCellType()) {
            case STRING -> cell.getStringCellValue();
            case NUMERIC -> String.valueOf(cell.getNumericCellValue());
            case BOOLEAN -> String.valueOf(cell.getBooleanCellValue());
            default -> "";
        };
    }

    private long getNumericCellValue(Cell cell) {
        if (cell == null) return 0;
        try {
            return (long) (cell.getCellType() == CellType.NUMERIC ? cell.getNumericCellValue() : Long.parseLong(cell.getStringCellValue()));
        } catch (NumberFormatException e) {
            System.err.println("Invalid number format: " + cell.getStringCellValue());
            return 0;
        }
    }

    private void createThumbnail(Path imagePath, Path thumbnailPath) throws IOException {
        BufferedImage originalImage = ImageIO.read(imagePath.toFile());
        BufferedImage thumbnail = Scalr.resize(originalImage, Scalr.Method.QUALITY, Scalr.Mode.FIT_TO_WIDTH, 100);
        ImageIO.write(thumbnail, "png", thumbnailPath.toFile());
        
        try {
            System.out.println("Creating thumbnail for: " + imagePath.toString());
            // 실제 썸네일 생성 로직 (예: 이미지 리사이즈 라이브러리 사용)
            Files.copy(imagePath, thumbnailPath, StandardCopyOption.REPLACE_EXISTING);
            System.out.println("Thumbnail created at: " + thumbnailPath.toString());
        } catch (IOException e) {
            System.err.println("Thumbnail creation failed: " + e.getMessage());
        }
    }
    
    private String resolveImagePath(String imagePath) {
        if (imagePath == null || imagePath.trim().isEmpty()) {
            return null;
        }
        
        

        // 절대경로가 아닌 경우, 기본 경로로 설정
        if (!Paths.get(imagePath).isAbsolute()) {
            Path absolutePath = Paths.get("C:\\uploads\\images\\", imagePath);
            return absolutePath.toString();
        }

        return imagePath;
    }

}
