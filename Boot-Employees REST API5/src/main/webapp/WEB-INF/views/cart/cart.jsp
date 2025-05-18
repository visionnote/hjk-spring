<%@ page contentType="text/html; charset=UTF-8" %>
<html>
<head>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css">
    <title>장바구니</title>
</head>
<body>
    <div class="container mt-5">
        <h2>장바구니</h2>
        <c:choose>
            <c:when test="${empty cart}">
                <p>장바구니가 비어 있습니다.</p>
            </c:when>
            <c:otherwise>
                <table class="table table-bordered">
                    <thead>
                        <tr>
                            <th>상품명</th>
                            <th>가격</th>
                            <th>수량</th>
                            <th>합계</th>
                            <th>삭제</th>
                        </tr>
                    </thead>
                    <tbody>
                        <c:forEach var="item" items="${cart}">
                            <tr>
                                <td>${item.productName}</td>
                                <td>${item.unitPrice}</td>
                                <td>${item.quantity}</td>
                                <td>${item.totalPrice}</td>
                                <td>
                                    <form action="/cart/remove" method="post">
                                        <input type="hidden" name="productId" value="${item.productId}">
                                        <input type="submit" class="btn btn-danger" value="삭제">
                                    </form>
                                </td>
                            </tr>
                        </c:forEach>
                    </tbody>
                </table>
                <form action="/cart/clear" method="post">
                    <input type="submit" class="btn btn-danger" value="전체 삭제">
                </form>
            </c:otherwise>
        </c:choose>
    </div>
</body>
</html>
