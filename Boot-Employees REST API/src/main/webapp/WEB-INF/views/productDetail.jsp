<%@ page contentType="text/html; charset=UTF-8" %>
<html>
<body>
    <h2>상품 등록 완료</h2>
    <p>상품명: ${product.productName}</p>
    <p>이미지 파일: ${product.filename}</p>
    <c:if test="${not empty product.filename}">
        <img src="/uploads/${product.filename}" width="200">
    </c:if>
</body>
</html>
