<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="com.example.myapp.dto.Product" %>
<%
    Product product = (Product) request.getAttribute("product");
%>
<html>
<head>
    <title>상품 수정</title>
    <link rel="stylesheet" href="/css/bootstrap.min.css">
</head>
<body>
<div class="container mt-4">
    <h2>상품 수정</h2>

    <form action="/updateProduct" method="post" enctype="multipart/form-data">
        <input type="hidden" name="productId" value="<%= product.getProductId() %>">
        <input type="hidden" name="existingFilename" value="<%= product.getFilename() %>">

        <div class="mb-3">
            <label>상품명</label>
            <input type="text" name="productName" class="form-control" value="<%= product.getProductName() %>" required>
        </div>
        <div class="mb-3">
            <label>가격</label>
            <input type="number" name="unitPrice" class="form-control" value="<%= product.getUnitPrice() %>" required>
        </div>
        <div class="mb-3">
            <label>설명</label>
            <textarea name="description" class="form-control"><%= product.getDescription() %></textarea>
        </div>
        <div class="mb-3">
            <label>제조사</label>
            <input type="text" name="manufacturer" class="form-control" value="<%= product.getManufacturer() %>">
        </div>
        <div class="mb-3">
            <label>카테고리</label>
            <input type="text" name="category" class="form-control" value="<%= product.getCategory() %>">
        </div>
        <div class="mb-3">
            <label>재고 수</label>
            <input type="number" name="unitsInStock" class="form-control" value="<%= product.getUnitsInStock() %>">
        </div>
        <div class="mb-3">
            <label>상태</label>
            <input type="text" name="condition" class="form-control" value="<%= product.getCondition() %>">
        </div>
        <div class="mb-3">
            <label>이미지 변경</label>
            <input type="file" name="filename" class="form-control">
            <% if (product.getFilename() != null && !product.getFilename().isEmpty()) { %>
                <p>현재 이미지:</p>
                <img src="/images/<%= product.getFilename() %>" width="150">
            <% } %>
        </div>
		<%-- 상품 수정 시 기존 이미지를 표시 --%>
		<% if (product.getFilename() != null && !product.getFilename().isEmpty()) { %>
		    <img src="<%= request.getContextPath() %>/images/thumb_<%= product.getFilename() %>" 
		         alt="기존 썸네일" style="max-width: 50px;">
		    <input type="hidden" name="existingFile" value="<%= product.getFilename() %>">
		<% } %>
        <button type="submit" class="btn btn-primary">저장</button>
        <a href="/products" class="btn btn-secondary">취소</a>
    </form>
</div>
</body>
</html>
