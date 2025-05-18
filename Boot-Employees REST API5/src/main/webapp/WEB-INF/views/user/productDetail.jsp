<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="com.example.myapp.dto.Product" %>
<%@ page import="javax.servlet.http.HttpSession" %>
<%
    Product product = (Product) request.getAttribute("product");
    HttpSession session = request.getSession();
    String userRole = (String) session.getAttribute("userRole");
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

        <form action="/cart/add" method="post">
            <input type="hidden" name="productId" value="<%= product.getProductId() %>">
            <div class="form-group">
                <label for="quantity">수량:</label>
                <input type="number" name="quantity" id="quantity" class="form-control" value="1" min="1" max="<%= product.getUnitsInStock() %>">
            </div>
            <button type="submit" class="btn btn-success mt-2">장바구니에 담기</button>
        </form>

        <a href="<%= userRole != null && userRole.equals("ADMIN") ? "/admin/products" : "/products" %>" class="btn btn-primary mt-2">목록으로</a>
    <%
        }
    %>
</div>
</body>
</html>
