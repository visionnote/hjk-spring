<%@ page contentType="text/html; charset=utf-8" %>
<%@ page import="java.util.List" %>
<%@ page import="com.example.myapp.dto.Product" %>
<%
    List<Product> listOfProducts = (List<Product>) request.getAttribute("listOfProducts");
%>
<html>
<head>
    <title>상품 목록</title>
    <link rel="stylesheet" href="/css/bootstrap.min.css">
</head>
<body>

<jsp:include page="menu.jsp" />

<div class="jumbotron">
    <div class="container">
        <h1 class="display-3">상품 목록</h1>
    </div>
</div>

<div class="container">
    <div class="row text-center">

        <%
            if (listOfProducts != null && !listOfProducts.isEmpty()) {
                for (Product product : listOfProducts) {
        %>
        <div class="col-md-4 mb-4">
            <img src="<%= request.getContextPath() %>/images/<%= product.getFilename() %>"
                 alt="제품 이미지"
                 style="width: 100%; height: 250px; object-fit: cover;">
            <h3><%= product.getProductName() %></h3>
            <p><%= product.getDescription() %></p>
            <p><strong><%= product.getUnitPrice() %>원</strong></p>
            <p>
                <a href="<%= request.getContextPath() %>/product?id=<%= product.getProductId() %>"
                   class="btn btn-secondary btn-sm">상세 정보 &raquo;</a>

                <form action="/deleteProduct" method="post" style="display:inline;">
                    <input type="hidden" name="productId" value="<%= product.getProductId() %>">
                    <button type="submit" class="btn btn-danger btn-sm">삭제</button>
                </form>
            </p>
        </div>
        <%
                }
            } else {
        %>
        <div class="col-12">
            <p>등록된 상품이 없습니다.</p>
        </div>
        <%
            }
        %>
    </div>
    <hr>
</div>

<jsp:include page="footer.jsp" />

</body>
</html>
