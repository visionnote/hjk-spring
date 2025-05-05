<%@ page contentType="text/html; charset=utf-8" %>
<%@ page import="com.example.myapp.dto.Product" %>
<%@ page import="com.example.myapp.dao.ProductRepository" %>

<html>
<head>
    <link rel="stylesheet" href="/css/bootstrap.min.css">
    <title>상품 상세 정보</title>
</head>
<body>

<jsp:include page="menu.jsp" />

<div class="jumbotron">
    <div class="container">
        <h1 class="display-3">상품 정보</h1>
    </div>
</div>

<%
    String id = request.getParameter("id");
	ProductRepository dao = ProductRepository.getInstance();
    Product product = dao.getProductById(id);
%>

<div class="container">
    <div class="row">
        <%
            if (id == null || id.trim().isEmpty()) {
        %>
            <div class="col-12">
                <p class="text-danger">상품 ID가 전달되지 않았습니다.</p>
            </div>
        <%
            } else if (product == null) {
        %>
            <div class="col-12">
                <p class="text-danger">해당 ID에 해당하는 상품을 찾을 수 없습니다. (id: <%= id %>)</p>
            </div>
        <%
            } else {
        %>
        <div class="col-md-5">
            <img src="/images/<%=product.getFilename()%>" alt="제품 이미지" style="width: 100%">
        </div>
        <div class="col-md-6">
            <h3><%=product.getProductName()%></h3>
            <p><%=product.getDescription()%></p>
            <p><strong>상품 코드:</strong> <span class="badge badge-danger"><%=product.getProductId()%></span></p>
            <p><strong>제조사:</strong> <%=product.getManufacturer()%></p>
            <p><strong>분류:</strong> <%=product.getCategory()%></p>
            <p><strong>재고 수:</strong> <%=product.getUnitsInStock()%></p>
            <h4><%=product.getUnitPrice()%>원</h4>
        </div>
        <%
            } // if-else 종료
        %>
    </div>

    <div class="row mt-3">
        <div class="col-12">
            <a href="/products" class="btn btn-secondary">상품 목록 &raquo;</a>
        </div>
    </div>
</div>

<jsp:include page="footer.jsp" />

</body>
</html>
