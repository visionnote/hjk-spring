package com.example.myapp.controller;

import java.awt.Graphics2D;
import java.awt.Image;
import java.awt.image.BufferedImage;
import java.io.File;
import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.sql.Timestamp;
import java.time.LocalDateTime;
import java.util.List;
import java.util.UUID;

import javax.imageio.ImageIO;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.example.myapp.dao.ProductRepository;
import com.example.myapp.dto.Product;
import com.example.myapp.model.Member;

import jakarta.servlet.http.HttpServletRequest;

@Controller
public class MyController {

    @Autowired
    ProductRepository productRepository;

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

    // 20250428->20250430 상세 추가
    @GetMapping("/products")
    public String showProducts(@RequestParam(value = "page", defaultValue = "1") int page,
            @RequestParam(value = "size", defaultValue = "10") int size, Model model, HttpServletRequest request) {
        File uploadDir = new File(request.getServletContext().getRealPath("/uploads"));
        File[] files = uploadDir.listFiles();
        model.addAttribute("files", files);
        // 페이징 처리를 위해 아래 2줄 추가함
        List<Product> products = productRepository.getProductsByPage(page, size);
        model.addAttribute("listOfProducts", products);

        // model.addAttribute("listOfProducts", productRepository.getAllProducts());
        model.addAttribute("productList", productRepository.getProductsByPage(page, size));
        return "products"; // → products.jsp
    }

    @PostMapping("/products")
    public String addProduct(
            @RequestParam("productName") String productName,
            @RequestParam("unitPrice") long unitPrice,
            @RequestParam("description") String description,
            @RequestParam("manufacturer") String manufacturer,
            @RequestParam("category") String category,
            @RequestParam("unitsInStock") int unitsInStock,
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

    // 20250430
    @GetMapping("/product")
    public String getProduct(@RequestParam("id") String id, Model model) {
        System.out.println("요청 ID: " + id);

        // Product product = new Product();
        // product.setProductId(id);
        // product.setProductName("테스트 상품");
        // product.setDescription("테스트 설명");
        // product.setUnitPrice(10000);

        Product product = productRepository.getProductById(id);
        System.out.println("조회된 상품: " + product);
        model.addAttribute("product", product);

        // 20250505 추가하기
        model.addAttribute("id", id); // ✅ id도 모델에 추가
        return "product"; // => /WEB-INF/views/product.jsp 로 이동
    }

    // 20250428
    @GetMapping("/request")
    public String showRequest() {
        return "request"; // → request.jsp
    }

    // 20250428
    // 수정: /process는 GET과 POST 모두 처리할 수 있게
    @RequestMapping("/process")
    public String processRequest() {
        return "process"; // → process.jsp
    }

    // 20250429
    @GetMapping("/request01")
    public String showRequest01() {
        return "request01"; // → request01.jsp
    }

    // 20250429
    @GetMapping("/request02")
    public String showRequest02() {
        return "request02"; // → request02.jsp
    }

    // 20250429
    @GetMapping("/start")
    public String showStart() {
        return "start"; // → start.jsp
    }

    // 20250429
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

    // 20250501
    @GetMapping("/form01")
    public String showform01() {
        return "form01"; // → form01.jsp
    }

    // 20250501
    @PostMapping("/form01_process")
    public String showform01_process() {
        return "form01_process"; // → form01_process.jsp
    }

    // 20250502
    @GetMapping("/fileupload03")
    public String showfileupload03() {
        return "fileupload03"; // → fileupload01.jsp
    }

    // 20250502
    @PostMapping("/fileupload03_process")
    public String showfileupload03_process() {
        return "fileupload03_process"; // → fileupload01_process.jsp
    }

    // 20250505
    @GetMapping("/home")
    public String showHome() {
        return "home"; // home.jsp를 렌더링
    }

    // 20250501
    @GetMapping("/addProduct")
    public String showAddProduct() {
        return "addProduct"; // → addProduct.jsp
    }

    // 20250504
    @Value("${file.upload-dir}")
    private String uploadDir;

    // @PostMapping("/addProduct_process")
    // public String showAddProduct_process(@RequestParam("productName") String
    // productName,
    // @RequestParam("fileName") MultipartFile fileName,
    // Model model) throws IOException {
    //
    //
    //
    // if (!fileName.isEmpty()) {
    // String fileName2 = UUID.randomUUID() + "_" + fileName.getOriginalFilename();
    // Path savePath = Paths.get(uploadDir, fileName2);
    // Files.createDirectories(savePath.getParent());
    // Files.write(savePath, fileName.getBytes());
    //
    // model.addAttribute("filename", "/uploads/" + fileName);
    // model.addAttribute("productName", productName);
    // }
    //
    // return "products"; // 업로드 확인용 페이지
    // }

    @PostMapping("/deleteProduct")
    @ResponseBody
    public String deleteProduct(@RequestParam("productId") String productId,
            @RequestParam("filename") String filename) {
        // 상품 삭제
        productRepository.deleteProduct(productId);

        // 1. 썸네일 및 원본 이미지 삭제
        String originalPath = "src/main/resources/static/images/" + filename;

        File originalFile = new File(originalPath);

        if (originalFile.exists()) {
            originalFile.delete(); // 원본 파일 삭제
        }

        // 2. 썸네일 이미지 삭제
        String thumbPath = "src/main/resources/static/images/" + "thumb_" + filename;

        File thumbFile = new File(thumbPath);

        if (thumbFile.exists()) {
            thumbFile.delete(); // 원본 파일 삭제
        }

        return "success"; // JSON 형식으로 성공 메시지 전달
    }

    // public String deleteProduct(@RequestParam("productId") String productId) {
    // productRepository.deleteProduct(productId);
    // return "success"; // JSON 형식으로 성공 메시지 전달
    // }

    @PostMapping("/addProduct_process")
    public String handleUpload(@RequestParam("filename") MultipartFile file,
            @RequestParam("productName") String productName,
            @RequestParam("unitPrice") long unitPrice,
            @RequestParam("description") String description,
            @RequestParam("manufacturer") String manufacturer,
            @RequestParam("category") String category,
            @RequestParam("unitsInStock") int unitsInStock,
            @RequestParam("condition") String condition,
            @RequestParam(value = "existingFile", required = false) String existingFile, // 기존 이미지
            HttpServletRequest request) {

        String fileName = existingFile; // 기존 파일명으로 시작

        if (!file.isEmpty()) {
            fileName = UUID.randomUUID() + "_" + file.getOriginalFilename();
            String uploadDir = new File("src/main/resources/static/images").getAbsolutePath();

            // 폴더 없으면 생성
            File saveFolder = new File(uploadDir);
            if (!saveFolder.exists()) {
                saveFolder.mkdirs();
            }

            // 파일 저장
            File saveFile = new File(uploadDir, fileName);
            try {
                file.transferTo(saveFile);
            } catch (IOException e) {
                e.printStackTrace();
            }

            // 3. 썸네일 생성
            File thumbFile = new File(uploadDir, "thumb_" + fileName);
            try {
                createThumbnail(saveFile, thumbFile, 50, 50);
            } catch (IOException e) {
                // TODO Auto-generated catch block
                e.printStackTrace();
            } // 썸네일 크기: 200x200
        }

        // 상품 객체 생성
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

        product.setCreatedAt(LocalDateTime.now()); // 등록일 설정
        product.setUpdatedAt(LocalDateTime.now()); // 수정일 초기값 설정

        productRepository.addProduct(product);

        return "redirect:/products";
    }

    private void createThumbnail(File originalFile, File thumbnailFile, int width, int height) throws IOException {
        BufferedImage originalImage = ImageIO.read(originalFile);
        if (originalImage == null)
            return;

        Image scaledImage = originalImage.getScaledInstance(width, height, Image.SCALE_SMOOTH);
        BufferedImage bufferedThumb = new BufferedImage(width, height, BufferedImage.TYPE_INT_RGB);
        Graphics2D g2d = bufferedThumb.createGraphics();
        g2d.drawImage(scaledImage, 0, 0, null);
        g2d.dispose();

        String extension = getFileExtension(thumbnailFile.getName());
        ImageIO.write(bufferedThumb, extension, thumbnailFile);
    }

    private String getFileExtension(String fileName) {
        int dotIndex = fileName.lastIndexOf('.');
        return dotIndex >= 0 ? fileName.substring(dotIndex + 1) : "jpg";
    }

    // 20250505 추가
    @GetMapping("/editProduct")
    public String editProduct(@RequestParam("id") String id, Model model) {
        Product product = productRepository.getProductById(id);
        model.addAttribute("product", product);
        return "editProduct"; // => editProduct.jsp
    }

    @PostMapping("/updateProduct")
    public String updateProduct(@RequestParam("productId") String productId,
            @RequestParam("productName") String productName,
            @RequestParam("unitPrice") long unitPrice,
            @RequestParam("description") String description,
            @RequestParam("manufacturer") String manufacturer,
            @RequestParam("category") String category,
            @RequestParam("unitsInStock") int unitsInStock,
            @RequestParam("condition") String condition,
            @RequestParam("existingFile") String existingFile,
            @RequestParam("filename") MultipartFile file,
            HttpServletRequest request) {

        String uploadDir = new File("src/main/resources/static/images").getAbsolutePath();
        String fileName = existingFile;

        // 새 이미지 업로드 시 기존 이미지 삭제
        if (!file.isEmpty()) {
            // 새 파일명
            fileName = UUID.randomUUID() + "_" + file.getOriginalFilename();

            // 기존 원본 + 썸네일 삭제
            File oldFile = new File(uploadDir, existingFile);
            File oldThumb = new File(uploadDir, "thumb_" + existingFile);
            if (oldFile.exists())
                oldFile.delete();
            if (oldThumb.exists())
                oldThumb.delete();

            // 새 파일 저장
            try {
                File saveFile = new File(uploadDir, fileName);
                file.transferTo(saveFile);

                // 썸네일 생성
                createThumbnail(saveFile.getAbsolutePath(), uploadDir + "/thumb_" + fileName);
            } catch (IOException e) {
                e.printStackTrace();
            }
        }

        Product product = new Product();
        product.setProductId(productId);
        product.setProductName(productName);
        product.setUnitPrice(unitPrice);
        product.setDescription(description);
        product.setManufacturer(manufacturer);
        product.setCategory(category);
        product.setUnitsInStock(unitsInStock);
        product.setCondition(condition);
        product.setFilename(fileName);

        product.setUpdatedAt(LocalDateTime.now()); // 수정일 갱신

        productRepository.updateProduct(product);

        return "redirect:/products";
    }

    private void createThumbnail(String imagePath, String thumbnailPath) {
        try {
            File inputFile = new File(imagePath);
            if (!inputFile.exists()) {
                System.err.println("❌ 이미지 파일 없음: " + imagePath);
                return;
            }

            BufferedImage originalImage = ImageIO.read(inputFile);
            if (originalImage == null) {
                System.err.println("❌ 이미지 로딩 실패 (null 반환): " + imagePath);
                return;
            }

            BufferedImage thumbnail = new BufferedImage(200, 200, BufferedImage.TYPE_INT_RGB);
            Graphics2D g = thumbnail.createGraphics();
            g.drawImage(originalImage.getScaledInstance(200, 200, Image.SCALE_SMOOTH), 0, 0, null);
            g.dispose();

            File outputFile = new File(thumbnailPath);
            ImageIO.write(thumbnail, "png", outputFile);
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    @PostMapping("/editProduct_process")
    public String editProduct(@RequestParam("productId") String productId,
            @RequestParam("productName") String productName,
            @RequestParam("unitPrice") long unitPrice,
            @RequestParam("description") String description,
            @RequestParam("manufacturer") String manufacturer,
            @RequestParam("category") String category,
            @RequestParam("unitsInStock") int unitsInStock,
            @RequestParam("condition") String condition,
            @RequestParam("filename") MultipartFile file,
            @RequestParam("existingFilename") String existingFilename,
            HttpServletRequest request) {

        String fileName = existingFilename;

        if (!file.isEmpty()) {
            // 1. 기존 파일 삭제
            String uploadDir = new File("src/main/resources/static/images").getAbsolutePath();
            File oldFile = new File(uploadDir, existingFilename);
            if (oldFile.exists()) {
                oldFile.delete();
            }

            // 2. 새 파일 저장
            fileName = UUID.randomUUID() + "_" + file.getOriginalFilename();
            File saveFile = new File(uploadDir, fileName);
            try {
                file.transferTo(saveFile);
            } catch (IOException e) {
                e.printStackTrace();
            }
        }

        Product product = new Product();
        product.setProductId(productId);
        product.setProductName(productName);
        product.setUnitPrice(unitPrice);
        product.setDescription(description);
        product.setManufacturer(manufacturer);
        product.setCategory(category);
        product.setUnitsInStock(unitsInStock);
        product.setCondition(condition);
        product.setFilename(fileName);

        productRepository.updateProduct(product); // Mapper에 이 메서드 필요

        return "redirect:/products";
    }

    // 20250509 엑셀로 상품업로드 기능 추가
    @GetMapping("/upload")
    public String showUploadPage() {
        return "upload";
    }

    // 20250512 유효성기능
    @GetMapping("/validation01")
    public String showValidation01() {
        return "validation01";
    }

    // 20250512 엑셀로 상품업로드 기능 추가
    @GetMapping("/validation02")
    public String showValidation02() {
        return "validation02";
    }

    // 20250512 엑셀로 상품업로드 기능 추가
    @PostMapping("/validation02_process")
    public String showValidation02_process() {
        return "validation02_process";
    }

    // 20250518 index.jsp가 서버에서 동작하는 방법 보여주기
    @GetMapping("/index")
    public String showIndex() {
        return "index";
    }

    @GetMapping("/pageDirective")
    public String showPageDirective() {
        return "pageDirective";
    }

    @GetMapping("/pageDirectiveImport")
    public String showPageDirectiveImport() {
        return "pageDirectiveImport";
    }

    @GetMapping("/pageDirectiveSession")
    public String showPageDirectiveSession() {
        return "pageDirectiveSession";
    }

    @GetMapping("/directiveInclude")
    public String showDirectiveInclude() {
        return "directiveInclude";
    }

    @GetMapping("/scriptTest")
    public String showScriptTest() {
        return "scriptTest";
    }

    // 20250519
    @GetMapping("/declarationTest")
    public String showDeclarationTest() {
        return "declarationTest";
    }

    @GetMapping("/declarationTest2")
    public String showDeclarationTest2() {
        return "declarationTest2";
    }

    @GetMapping("/expressionTest")
    public String showExpressionTest() {
        return "expressionTest";
    }

    @GetMapping("/expressionTest2")
    public String showExpressionTest2() {
        return "expressionTest2";
    }

    @GetMapping("/htmlComment2")
    public String showHtmlComment2() {
        return "htmlComment2";
    }

    @GetMapping("/jspComment")
    public String showJspComment() {
        return "jspComment";
    }

    @GetMapping("/ifTestForm")
    public String showIfTestForm() {
        return "ifTestForm";
    }

    @PostMapping("/ifTestPro")
    public String showIfTestPro() {
        return "ifTestPro";
    }

    @GetMapping("/ifElseTestForm")
    public String showIfElseTestForm() {
        return "ifElseTestForm";
    }

    @PostMapping("/ifElseTestPro")
    public String showIfElseTestPro() {
        return "ifElseTestPro";
    }

    @GetMapping("/ifMultiTestForm")
    public String showIfMultiTestForm() {
        return "ifMultiTestForm";
    }

    @PostMapping("/ifMultiTestPro")
    public String showIfMultiTestPro() {
        return "ifMultiTestPro";
    }

    @GetMapping("/switchTestForm")
    public String showSwitchTestForm() {
        return "switchTestForm";
    }

    @PostMapping("/switchTestPro")
    public String showSwitchTestPro() {
        return "switchTestPro";
    }

    @GetMapping("/forTest")
    public String showForTest() {
        return "forTest";
    }

    @GetMapping("/whileTest")
    public String showWhileTest() {
        return "whileTest";
    }

    @GetMapping("/requestTestForm")
    public String showRequestTestForm() {
        return "requestTestForm";
    }

    @PostMapping("/requestTestPro")
    public String showRequestTestPro() {
        return "requestTestPro";
    }

    @GetMapping("/requestTest2")
    public String showRequestTest2() {
        return "requestTest2";
    }

    @GetMapping("/responseRedirect")
    public String showResponseRedirect() {
        return "responseRedirect";
    }

    @GetMapping("/responseRedirected")
    public String showResponseRedirected() {
        return "responseRedirected";
    }

    @GetMapping("/outTest")
    public String showOutTest() {
        return "outTest";
    }

    @GetMapping("/includeTestForm")
    public String showIncludeTestForm() {
        return "includeTestForm";
    }

    @PostMapping("/includeTest")
    public String showIncludeTest() {
        return "includeTest";
    }

    @GetMapping("/includeTest2")
    public String showIncludeTest2() {
        return "includeTest2";
    }

    @GetMapping("/forwardTestForm")
    public String showForwardTestForm() {
        return "forwardTestForm";
    }

    @PostMapping("/forwardTest")
    public String showForwardTest() {
        return "forwardTest";
    }

    @GetMapping("/forwardTest2")
    public String showForwardTest2() {
        return "forwardTest2";
    }

    @GetMapping("/driverTest")
    public String showDriverTest() {
        return "driverTest";
    }
    
    @GetMapping("/insertTestForm")
    public String showInsertTestForm() {
        return "insertTestForm";
    }

    @PostMapping("/insertTestPro")
    public String showInsertTestPro() {
        return "insertTestPro";
    }
    
    @GetMapping("/selectTest")
    public String showSelectTest() {
        return "selectTest";
    }
    
    @GetMapping("/updateTestForm")
    public String showUpdateTestForm() {
        return "updateTestForm";
    }

    @PostMapping("/updateTestPro")
    public String showUpdateTestPro() {
        return "updateTestPro";
    }
    
    //20250521
    @GetMapping("/deleteTestForm")
    public String showDeleteTestForm() {
        return "deleteTestForm";
    }

    @PostMapping("/deleteTestPro")
    public String showDeleteTestPro() {
        return "deleteTestPro";
    }
    
    @GetMapping("/makeCookie")
    public String showMakeCookie() {
        return "makeCookie";
    }

    @PostMapping("/useCookie")
    public String showUseCookie() {
        return "useCookie";
    }
      
   }
