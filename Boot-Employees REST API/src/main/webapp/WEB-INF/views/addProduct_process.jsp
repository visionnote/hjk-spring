<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<%@ page import="java.io.File" %>
<%@ page import="java.nio.charset.StandardCharsets" %>
<%@ page import="java.util.List" %>
<%@ page import="java.util.ArrayList" %>

<%@ page import="org.apache.commons.fileupload.FileItem" %>
<%@ page import="org.apache.commons.fileupload.disk.DiskFileItemFactory" %>
<%@ page import="org.apache.commons.fileupload.servlet.ServletFileUpload" %>

<%@ page import="com.example.myapp.dto.Product" %>
<%@ page import="com.example.myapp.dao.ProductRepository" %>

<html>
<head>
    <title>상품 등록 처리</title>
</head>
<body>
<%
    request.setCharacterEncoding("UTF-8");
	String productId = request.getParameter("productId");
	String productName = request.getParameter("productName");
	String unitPrice = request.getParameter("unitPrice");
	String description = request.getParameter("description");
	String manufacturer = request.getParameter("manufacturer");
	String category = request.getParameter("category");
	String unitsInStock = request.getParameter("unitsInStock");
	String condition = request.getParameter("condition");
	String imageFilename = null;
	
	Integer price;

	if(unitPrice.isEmpty())
	 	price = 0;
	else
		price = Integer.valueOf(unitPrice);
		
	long stock;

	if(unitsInStock.isEmpty())
		stock = 0;
	else 
		stock = Long.valueOf(unitsInStock);
    // 업로드 디렉토리 경로
	String uploadPath = "F:/dev_0420_009/dev/workspace/Boot-Employees REST API/src/main/resources/static/images/";
    File uploadDir = new File(uploadPath);
    if (!uploadDir.exists()) uploadDir.mkdirs();

	System.out.println("업로드 경로 확인!!"+uploadDir.getAbsolutePath());
	
    try {
        // 파일 업로드 준비
	boolean isMultipart = ServletFileUpload.isMultipartContent(request);
	if (isMultipart) {
	    DiskFileItemFactory factory = new DiskFileItemFactory();
	    factory.setRepository(new File("임시저장폴더경로")); // 필요시 설정
	    ServletFileUpload upload = new ServletFileUpload(factory);
	    List<FileItem> items = upload.parseRequest(request);
	
        // 요청 파싱
        for (FileItem item : items) {
            if (item.isFormField()) {
                String name = item.getFieldName();
                String value = item.getString(StandardCharsets.UTF_8);
                switch (name) {
                    case "productId": productId = value; break;
                    case "productName": productName = value; break;
                    case "unitPrice": price = value.isEmpty() ? 0 : Integer.parseInt(value); break;
                    case "description": description = value; break;
                    case "manufacturer": manufacturer = value; break;
                    case "category": category = value; break;
                    case "unitsInStock": stock = value.isEmpty() ? 0L : Long.parseLong(value); break;
                    case "condition": condition = value; break;
                }
            } else {
                // 파일 저장 처리
                String fileName = item.getName();
				System.out.println("파일명: " + fileName);
				System.out.println("<p>파일명: " + fileName + "</p>");
				System.out.println("<p>11필드명: " + item.getFieldName() + "</p>");
				System.out.println("<p>22파일명: " + item.getName() + "</p>");

                if (fileName != null && !fileName.isEmpty()) {
                    File uploadedFile = new File(uploadDir, fileName);
					try {
					    item.write(uploadedFile.toPath());
					} catch (Exception e) {
					    e.printStackTrace();
					    out.println("<p>파일 저장 중 오류 발생: " + e.getMessage() + "</p>");
					}
                    out.println("<p>저장된 파일: " + uploadedFile.getAbsolutePath() + "</p>");
                    imageFilename = fileName;
                }
            }
        }

        // Product 객체 생성 및 설정
        Product newProduct = new Product();
        newProduct.setProductId(productId);
        newProduct.setProductName(productName);
        newProduct.setUnitPrice(price);
        newProduct.setDescription(description);
        newProduct.setManufacturer(manufacturer);
        newProduct.setCategory(category);
        newProduct.setUnitsInStock(stock);
        newProduct.setCondition(condition);
        newProduct.setFilename(imageFilename);
		System.out.println("여기파일명2"+imageFilename);

		if (imageFilename == null || imageFilename.isBlank()) {
		    out.println("<p>파일이 첨부되지 않았습니다.</p>");
		}
        // DB에 저장
        ProductRepository dao = ProductRepository.getInstance();
        dao.addProduct(newProduct);
		
		ArrayList<Product> list = dao.getAllProducts();
		  for (Product p : list) {
		      System.out.println("여기여기~~"+"<p>" + p.getProductId() + " - " + p.getProductName() + "</p>");
		  }

        // 성공 시 리다이렉트
        response.sendRedirect(request.getContextPath() + "/products");
        return;

    } catch (Exception e) {
        out.println("<p style='color:red;'>업로드 오류: " + e.getMessage() + "</p>");
        e.printStackTrace();
    }
%>
</body>
</html>
