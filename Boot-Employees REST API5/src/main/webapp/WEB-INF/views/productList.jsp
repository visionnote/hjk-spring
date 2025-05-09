<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

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
        <c:forEach var="product" items="${productList}">
            <div class="col-md-4 mb-4">
                <!-- 이미지 경로 확인 (static/images 기준) -->
                <img src="${pageContext.request.contextPath}/images/${product.filename}" 
                     alt="제품 이미지" style="width: 100%; height: 250px; object-fit: cover;">
                <h3>${product.productName}</h3>
                <p>${product.description}</p>
                <p>${product.unitPrice}원</p>
                <p>
                    <a href="product?id=${product.productId}" class="btn btn-secondary" role="button">
                        상세 정보 &raquo;
                    </a>
                    <form action="/deleteProduct" method="post" style="display:inline;">
                        <input type="hidden" name="productId" value="${product.productId}">
                        <button type="submit" class="btn btn-danger btn-sm">삭제</button>
                    </form>
                </p>
            </div>
        </c:forEach>
    </div>
    <hr>
</div>

<jsp:include page="footer.jsp" />

</body>
</html>
