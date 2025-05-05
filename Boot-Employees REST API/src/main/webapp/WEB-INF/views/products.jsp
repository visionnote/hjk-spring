<%@ page contentType="text/html; charset=utf-8" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="com.example.myapp.dto.Product" %>
<%@ page import="com.example.myapp.dao.ProductRepository" %>

<html>
<head>
    <link rel="stylesheet" href="/css/bootstrap.min.css">
    <title>상품 목록</title>
</head>
<body>

<jsp:include page="menu.jsp" />

<div class="jumbotron">
    <div class="container">
        <h1 class="display-3">상품 목록</h1>
    </div>
</div>

<%
    ProductRepository productDAO = ProductRepository.getInstance();
    ArrayList<Product> listOfProducts = productDAO.getAllProducts();
%>

<div class="container">
    <div class="row text-center">
        <%
            for (Product product : listOfProducts) {
        %>
        <div class="col-md-4 mb-4">
            <!-- 이미지 경로 수정 -->
            <img src="<%=request.getContextPath()%>/images/<%=product.getFilename()%>" 
                 alt="제품 이미지" style="width: 100%; height: 250px; object-fit: cover;">
            <h3><%=product.getProductName() %></h3>
            <p><%=product.getDescription() %></p>
            <p><%=product.getUnitPrice() %>원</p>
            <p>
                <a href="./product?id=<%=product.getProductId()%>" class="btn btn-secondary" role="button">
                    상세 정보 &raquo;
                </a>
                <form action="/deleteProduct" method="post" style="display:inline;">
                    <input type="hidden" name="productId" value="<%=product.getProductId()%>">
                    <button type="submit" class="btn btn-danger btn-sm">삭제</button>
                </form>
            </p>
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
