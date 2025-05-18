<%@ page contentType="text/html; charset=UTF-8" %>
<html>
<head>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css">
    <title>장바구니 전체 삭제</title>
</head>
<body>
    <div class="container mt-5">
        <h2>장바구니 전체 삭제</h2>
        <form action="/cart/clear" method="post">
            <div class="form-group">
                <p>장바구니의 모든 상품을 삭제하시겠습니까?</p>
            </div>
            <div class="form-group">
                <input type="submit" class="btn btn-danger" value="전체 삭제">
                <a href="/cart/view" class="btn btn-secondary">취소</a>
            </div>
        </form>
    </div>
</body>
</html>
