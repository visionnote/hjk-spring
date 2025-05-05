package com.example.myapp.controller;

import java.io.File;
import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.util.UUID;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.example.myapp.dao.ProductRepository;
import com.example.myapp.dto.Product;

import jakarta.servlet.http.HttpServletRequest;

@Controller
public class MyController {
	
	@Autowired
	ProductRepository productRepository ;

    @GetMapping("/hello")
    public String showPage() {
        return "hello"; // → hello.jsp
    }

    @GetMapping("/welcome")
    public String showPage2() {
        return "welcome"; // → welcome.jsp
    }

    @GetMapping("/first")
    public String showFirst() {
        return "first"; // → first.jsp
    }
    //20250428->20250430 상세 추가 
    @GetMapping("/products")
    public String showProducts(Model model, HttpServletRequest request) {
        File uploadDir = new File(request.getServletContext().getRealPath("/uploads"));
        File[] files = uploadDir.listFiles();
        model.addAttribute("files", files);
        model.addAttribute("listOfProducts", productRepository.getAllProducts());
        model.addAttribute("productList", productRepository.getAllProducts());
        return "products"; // → products.jsp
    }

    @PostMapping("/products")
    public String addProduct(
            @RequestParam("productName") String productName,
            @RequestParam("unitPrice") int unitPrice,
            @RequestParam("description") String description,
            @RequestParam("manufacturer") String manufacturer,
            @RequestParam("category") String category,
            @RequestParam("unitsInStock") long unitsInStock,
            @RequestParam("condition") String condition,
            @RequestParam("fileName") MultipartFile fileName,
            HttpServletRequest request) throws IOException {

        String fileName2 = "";
        if (!fileName.isEmpty()) {
            fileName2 = UUID.randomUUID() + "_" + fileName.getOriginalFilename();
            String uploadPath = request.getServletContext().getRealPath("/uploads");
            Path savePath = Paths.get(uploadPath, fileName2);
            Files.createDirectories(savePath.getParent());
            Files.write(savePath, fileName.getBytes());
        }

        String productId = "PRD-" + UUID.randomUUID().toString().substring(0, 8);

        Product product = new Product();
        product.setProductId(productId);
        product.setProductName(productName);
        product.setDescription(description);
        product.setUnitPrice(unitPrice);
        product.setManufacturer(manufacturer);
        product.setCategory(category);
        product.setUnitsInStock(unitsInStock);
        product.setCondition(condition);
        product.setFilename(fileName2);

        productRepository.addProduct(product);

        return "redirect:/products";
    }
    
    //20250430
    @GetMapping("/product")
    public String getProduct(@RequestParam("id") String id, Model model) {
    	System.out.println("요청 ID: " + id);
        
//        Product product = new Product();
//        product.setProductId(id);
//        product.setProductName("테스트 상품");
//        product.setDescription("테스트 설명");
//        product.setUnitPrice(10000);
        
        Product product = productRepository.getProductById(id);
        System.out.println("조회된 상품: " + product); 
        model.addAttribute("product", product);
        
        //20250505 추가하기 
        model.addAttribute("id", id); // ✅ id도 모델에 추가
        return "product"; // => /WEB-INF/views/product.jsp 로 이동
    }
    
    //20250428
    @GetMapping("/request")
    public String showRequest() {
        return "request"; // → request.jsp
    }
    //20250428   
    // 수정: /process는 GET과 POST 모두 처리할 수 있게
    @RequestMapping("/process")
    public String processRequest() {
        return "process"; // → process.jsp
    }
    
    //20250429
    @GetMapping("/request01")
    public String showRequest01() {
        return "request01"; // → request01.jsp
    }
    
    //20250429
    @GetMapping("/request02")
    public String showRequest02() {
        return "request02"; // → request02.jsp
    }
    //20250429
    @GetMapping("/start")
    public String showStart() {
        return "start"; // → start.jsp
    }
    //20250429
    @GetMapping("/move")
    public String showMove() {
        return "move"; // → move.jsp
    }
    
    @GetMapping("/forward")
    public String showForward() {
        return "forward"; // → forward.jsp
    }
    @GetMapping("/redirect")
    public String showRedirect() {
        return "redirect"; // → redirect.jsp
    }
    
    @GetMapping("/response")
    public String showResponse() {
        return "response"; // → response.jsp
    }
    
    @GetMapping("/response01")
    public String showResponse01() {
        return "response01"; // → response01.jsp
    }
    
    @PostMapping("/response01_process")
    public String showResponse01_process() {
        return "response01_process"; // → response01_process.jsp
    }
    
    @GetMapping("/response01_success")
    public String showResponse01_success() {
        return "response01_success"; // → response01_success.jsp
    }
    
    @GetMapping("/response01_failed")
    public String showResponse01_failed() {
        return "response01_failed"; // → response01_failed.jsp
    }
    //20250501
    @GetMapping("/form01")
    public String showform01() {
        return "form01"; // → form01.jsp
    }
    
  //20250501
    @PostMapping("/form01_process")
    public String showform01_process() {
        return "form01_process"; // → form01_process.jsp
    }
    
    //20250502 
    @GetMapping("/fileupload03")
    public String showfileupload03() {
        return "fileupload03"; // → fileupload01.jsp
    }
    
    //20250502
    @PostMapping("/fileupload03_process")
    public String showfileupload03_process() {
        return "fileupload03_process"; // → fileupload01_process.jsp
    }
    
    
    //20250501
    @GetMapping("/addProduct")
    public String showAddProduct() {
        return "addProduct"; // → addProduct.jsp
    }
    
    //20250504
    @Value("${file.upload-dir}")
    private String uploadDir;

//    @PostMapping("/addProduct_process")
//    public String showAddProduct_process(@RequestParam("productName") String productName,
//                                 @RequestParam("fileName") MultipartFile fileName,
//                                 Model model) throws IOException {
//
//    	
//    	
//        if (!fileName.isEmpty()) {
//            String fileName2 = UUID.randomUUID() + "_" + fileName.getOriginalFilename();
//            Path savePath = Paths.get(uploadDir, fileName2);
//            Files.createDirectories(savePath.getParent());
//            Files.write(savePath, fileName.getBytes());
//
//            model.addAttribute("filename", "/uploads/" + fileName);
//            model.addAttribute("productName", productName);
//        }
//
//        return "products"; // 업로드 확인용 페이지
//    }
    
    @PostMapping("/deleteProduct")
    public String deleteProduct(@RequestParam("productId") String productId) {
        productRepository.deleteProduct(productId);
        return "redirect:/products";
    }
    
    @PostMapping("/addProduct_process")
    public String handleUpload(@RequestParam("filename") MultipartFile file,
                               @RequestParam("productName") String productName,
                               @RequestParam("unitPrice") int unitPrice,
                               @RequestParam("description") String description,
                               @RequestParam("manufacturer") String manufacturer,
                               @RequestParam("category") String category,
                               @RequestParam("unitsInStock") long unitsInStock,
                               @RequestParam("condition") String condition,
    								HttpServletRequest request) { 

        String fileName = "";
        if (!file.isEmpty()) {
            fileName = UUID.randomUUID() + "_" + file.getOriginalFilename();
            String uploadDir = new File("src/main/resources/static/images").getAbsolutePath();
            //String uploadDir = "F:\\dev_0420_009\\dev\\workspace\\Boot-Employees REST API\\src\\main\\resources\\static\\images";
            // 📌 실제 저장 폴더 경로 (static/images)
            //String uploadDir = request.getServletContext().getRealPath("/images");
            
         // 📁 폴더 없으면 생성
            File saveFolder = new File(uploadDir);
            if (!saveFolder.exists()) {
                saveFolder.mkdirs();
            }
            
         // 📥 이미지 저장
            File saveFile = new File(uploadDir, fileName);
            try {
                file.transferTo(saveFile);
            } catch (IOException e) {
                e.printStackTrace();
            }
        }

        Product product = new Product();
        product.setProductId("P" + UUID.randomUUID().toString().substring(0, 8)); // 자동 생성 ID
        product.setProductName(productName);
        product.setUnitPrice(unitPrice);
        product.setDescription(description);
        product.setManufacturer(manufacturer);
        product.setCategory(category);
        product.setUnitsInStock(unitsInStock);
        product.setCondition(condition);
        product.setFilename(fileName);

        productRepository.addProduct(product);

        return "redirect:/products";
    }

}
