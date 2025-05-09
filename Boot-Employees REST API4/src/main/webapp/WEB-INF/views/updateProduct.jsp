<%@ page contentType="text/html; charset=UTF-8" %>
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

<jsp:include page="menu.jsp" />

<div class="container mt-5">
    <h2>상품 수정</h2>

    <form action="/updateProduct" method="post" enctype="multipart/form-data">
        <input type="hidden" name="productId" value="<%= product.getProductId() %>">
        <input type="hidden" name="existingFile" value="<%= product.getFilename() %>">

        <div class="form-group">
            <label>상품명</label>
            <input type="text" name="productName" class="form-control" value="<%= product.getProductName() %>">
        </div>

        <div class="form-group">
            <label>가격</label>
            <input type="number" name="unitPrice" class="form-control" value="<%= product.getUnitPrice() %>">
        </div>

        <div class="form-group">
            <label>설명</label>
            <textarea name="description" class="form-control"><%= product.getDescription() %></textarea>
        </div>

        <div class="form-group">
            <label>제조사</label>
            <input type="text" name="manufacturer" class="form-control" value="<%= product.getManufacturer() %>">
        </div>

        <div class="form-group">
            <label>카테고리</label>
            <input type="text" name="category" class="form-control" value="<%= product.getCategory() %>">
        </div>

        <div class="form-group">
            <label>재고수</label>
            <input type="number" name="unitsInStock" class="form-control" value="<%= product.getUnitsInStock() %>">
        </div>

        <div class="form-group">
            <label>상태</label>
            <input type="text" name="condition" class="form-control" value="<%= product.getCondition() %>">
        </div>

        <div class="form-group">
            <label>기존 이미지</label><br>
            <% if (product.getFilename() != null && !product.getFilename().isEmpty()) { %>
                <img src="<%= request.getContextPath() %>/images/thumb_<%= product.getFilename() %>" 
                     alt="기존 썸네일" style="max-width: 200px;">
            <% } else { %>
                <p>등록된 이미지 없음</p>
            <% } %>
        </div>

        <div class="form-group">
            <label>새 이미지 업로드 (선택)</label>
            <input type="file" name="filename" class="form-control">
        </div>

        <button type="submit" class="btn btn-primary">수정</button>
        <a href="/products" class="btn btn-secondary">취소</a>
    </form>
</div>

<jsp:include page="footer.jsp" />
</body>
</html>

