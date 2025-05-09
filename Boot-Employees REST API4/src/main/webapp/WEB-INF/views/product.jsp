<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="com.example.myapp.dto.Product" %>
<%
    Product product = (Product) request.getAttribute("product");
%>
<html>
<head>
    <title>상품 상세</title>
    <link rel="stylesheet" href="/css/bootstrap.min.css">
</head>
<body>
<div class="container mt-4">
    <h2>상품 상세 정보</h2>

    <%
        if (product == null) {
    %>
        <p style="color:red;">해당 상품이 존재하지 않습니다.</p>
    <%
        } else {
    %>
        <table class="table table-bordered">
            <tr><th>상품 ID</th><td><%= product.getProductId() %></td></tr>
            <tr><th>상품명</th><td><%= product.getProductName() %></td></tr>
            <tr><th>가격</th><td><%= product.getUnitPrice() %> 원</td></tr>
            <tr><th>설명</th><td><%= product.getDescription() %></td></tr>
            <tr><th>제조사</th><td><%= product.getManufacturer() %></td></tr>
            <tr><th>카테고리</th><td><%= product.getCategory() %></td></tr>
            <tr><th>재고수</th><td><%= product.getUnitsInStock() %></td></tr>
            <tr><th>상태</th><td><%= product.getCondition() %></td></tr>
            <tr>
                <th>이미지</th>
                <td>
                    <%
                        String filename = product.getFilename();
                        if (filename != null && !filename.isEmpty()) {
                    %>
                        <img src="/images/<%= filename %>" alt="상품 이미지" width="200">
                    <%
                        } else {
                    %>
                        <p>이미지가 없습니다.</p>
                    <%
                        }
                    %>
                </td>
            </tr>
        </table>
        <a href="/products" class="btn btn-primary">목록으로</a>
		<a href="/editProduct?id=<%= product.getProductId() %>" class="btn btn-warning">수정</a>
    <%
        }
    %>
</div>
</body>
</html>
